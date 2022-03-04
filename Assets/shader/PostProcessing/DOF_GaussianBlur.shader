Shader "DOF_GaussianBlur"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}

        //散景模糊
        _BlurSize ("模糊强度", Float) = 1.0
        _Iteration ("迭代次数", int) = 3
        _DownSample ("像素大小", int) = 2

        //景深
        _Start ("Fog Start", Float) = 0.0
        _End ("Fog End", Float) = 1.0
        _Density ("Fog Density", Float) = 1.0

    }

    SubShader
    {
        CGINCLUDE
        #include "UnityCG.cginc"

        sampler2D _MainTex;
        half4 _MainTex_TexelSize;

        float _BlurSize;
        int _Iteration;
        int _DownSample;

        sampler2D _CameraDepthTexture;
        float _Start;
        float _End;
        half _Density;


        struct v2f
        {
            float4 pos : SV_POSITION;
            half2 uv: TEXCOORD0;
            float4 uv01: TEXCOORD1;
            float4 uv23: TEXCOORD2;
            float4 uv45: TEXCOORD3;
            half2 uv_depth : TEXCOORD4;
        };

        //顶点shader
        v2f vert(appdata_img v)
        {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex);

            half2 uv = v.texcoord;
            o.uv = uv;
            o.uv_depth = uv;

            #if UNITY_UV_STARTS_AT_TOP
            o.uv = o.uv * float2(1.0, -1.0) + float2(0.0, 1.0);

            if (_MainTex_TexelSize.y < 0)
                o.uv_depth.y = 1 - o.uv_depth.y;
            #endif

            o.uv01 = o.uv.xyxy + _BlurSize.xyxy * float4(1, 1, -1, -1);
            o.uv23 = o.uv.xyxy + _BlurSize.xyxy * float4(1, 1, -1, -1) * 2.0;
            o.uv45 = o.uv.xyxy + _BlurSize.xyxy * float4(1, 1, -1, -1) * 6.0;

            return o;
        }

        //高斯模糊
        half4 GaussianBlur(half4 tex, v2f i)
        {
            tex += 0.40 * tex2D(_MainTex, i.uv) * _BlurSize;
            tex += 0.15 * tex2D(_MainTex, i.uv01.xy) * _BlurSize;
            tex += 0.15 * tex2D(_MainTex, i.uv01.zw) * _BlurSize;
            tex += 0.10 * tex2D(_MainTex, i.uv23.xy) * _BlurSize;
            tex += 0.10 * tex2D(_MainTex, i.uv23.zw) * _BlurSize;
            tex += 0.05 * tex2D(_MainTex, i.uv45.xy) * _BlurSize;
            tex += 0.05 * tex2D(_MainTex, i.uv45.zw) * _BlurSize;

            return tex;
        }

        //像素shader
        half4 frag(v2f i) : SV_Target
        {
            float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv_depth);
            float linearDepth = Linear01Depth(depth);
            float3 worldPos = _WorldSpaceCameraPos + linearDepth;

            float density = (_End - worldPos) / (_End - _Start);
            density = saturate(density * _Density);

            fixed4 finalColor = tex2D(_MainTex, i.uv);

            //finalColor.rgb = lerp(GaussianBlur(finalColor, i).rgb, finalColor.rgb, density);
            finalColor.rgb = GaussianBlur(finalColor, i).rgb;

            return finalColor;
        }
        ENDCG

        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
        }
    }
    FallBack "Diffuse"
}