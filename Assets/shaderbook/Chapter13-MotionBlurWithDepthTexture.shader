// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/Chapter 13/Motion Blur With Depth Texture"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _BlurSize ("Blur Size", Float) = 1.0
    }
    SubShader
    {
        CGINCLUDE
        #include "UnityCG.cginc"

        sampler2D _MainTex;
        half4 _MainTex_TexelSize;
        sampler2D _CameraDepthTexture;
        float4x4 _CurrentViewProjectionInverseMatrix;
        float4x4 _PreviousViewProjectionMatrix;
        half _BlurSize;

        struct v2f
        {
            float4 pos : SV_POSITION;
            half2 uv : TEXCOORD0;
            half2 uv_depth : TEXCOORD1;
        };

        v2f vert(appdata_img v)
        {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex);

            o.uv = v.texcoord;
            o.uv_depth = v.texcoord;

            #if UNITY_UV_STARTS_AT_TOP
            if (_MainTex_TexelSize.y < 0)
                o.uv_depth.y = 1 - o.uv_depth.y;
            #endif

            return o;
        }

        fixed4 frag(v2f i) : SV_Target
        {
            //获取此像素处的深度缓冲值，d是由NDC下的坐标映射而来的
            float d = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv_depth);
            //NDC坐标H是该像素的视口位置，范围为-1到1，把这个深度值重新映射回NDC，只需要使用原映射的反函数即可，即d*2-1
            float4 H = float4(i.uv.x * 2 - 1, i.uv.y * 2 - 1, d * 2 - 1, 1);
            //通过视图投影逆变换
            float4 D = mul(_CurrentViewProjectionInverseMatrix, H);
            //除以w得到世界位置
            float4 worldPos = D / D.w;

            //当前帧像素的位置
            float4 currentPos = H;
            //使用世界位置，并通过之前的视图投影矩阵进行变换，得到前一帧在NDC下的坐标 previousPos
            float4 previousPos = mul(_PreviousViewProjectionMatrix, worldPos);
            //过除以w转换为非齐次（非均质的）的点[-1,1]，前一帧像素的位置
            previousPos /= previousPos.w;

            //使用当前帧的位置和前一帧的位置来计算像素速度
            float2 velocity = (currentPos.xy - previousPos.xy) / 2.0f;//取平均值

            float2 uv = i.uv;
            float4 c = tex2D(_MainTex, uv);//正常的采样
            uv += velocity * _BlurSize;//一个模糊的uv
            for (int it = 1; it < 3; it++, uv += velocity * _BlurSize)
            {
                float4 currentColor = tex2D(_MainTex, uv);//模糊的采样
                c += currentColor;//正常的采样+模糊的采样
            }
            c /= 3;

            return fixed4(c.rgb, 1.0);
        }
        ENDCG

        Pass
        {
            ZTest Always Cull Off ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
        }
    }
    FallBack Off
}