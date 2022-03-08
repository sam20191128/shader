Shader "DOF_BokehBlur"
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
            half2 uv_depth : TEXCOORD1;
        };

        //顶点shader
        v2f vertBokehBlur(appdata_img v)
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

            return o;
        }

        //散景模糊
        half4 BokehBlur(v2f i)
        {
            //预计算旋转
            float c = cos(2.39996323f);
            float s = sin(2.39996323f);
            half4 _GoldenRot = half4(c, s, -s, c);

            half2x2 rot = half2x2(_GoldenRot);
            half4 accumulator = 0.0; //累加器
            half4 divisor = 0.0; //因子

            half r = 1.0;
            half2 angle = half2(0.0, _BlurSize);

            for (int j = 0; j < _Iteration; j++)
            {
                r += 1.0 / r; //每次 + r分之一 1.1
                angle = mul(rot, angle);
                half4 bokeh = tex2D(_MainTex, float2(i.uv + _DownSample * (r - 1.0) * angle));
                accumulator += bokeh * bokeh;
                divisor += bokeh;
            }
            return accumulator / divisor;
        }

        //像素shader
        half4 fragBokehBlur(v2f i) : SV_Target
        {
            float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv_depth);
            float linearDepth = Linear01Depth(depth);
            float3 cameraworldPos = _WorldSpaceCameraPos + linearDepth;

            float density = (_End - cameraworldPos) / (_End - _Start);
            density = saturate(density * _Density);

            fixed4 finalColor = tex2D(_MainTex, i.uv);

            finalColor.rgb = lerp(BokehBlur(i).rgb, finalColor.rgb, density);

            return finalColor;
        }
        ENDCG

        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vertBokehBlur
            #pragma fragment fragBokehBlur
            ENDCG
        }
    }
    FallBack "Diffuse"
}