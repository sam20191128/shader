Shader "Parallax" //Shader路径名
{
    Properties //材质面板参数
    {
        [HDR]_BaseCol ("基本色", Color) = (0.5,0.5,0.5,1)
        _MainTex ("RGB:基础颜色 A:环境遮罩", 2D) = "white" {}
        _Alpha ("Alpha", Range(0, 1)) = 0.5
        _MoveSpeed ("MoveSpeed", float) = 0.1
        _HeightOffset ("HeightOffset", Range(0, 1)) = 0.15
        _StepLayer ("StepLayer", Range(2, 128)) = 128

    }

    SubShader
    {
        Tags
        {
            "IgnoreProjector"="True"
            "Queue"="Transparent-50"
            "RenderType"="Transparent"
        }

        Pass
        {
            Name "FORWARD"
            Tags
            {
                "LightMode"="ForwardBase"
            }

            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"

            #pragma multi_compile_fwdbase
            #pragma target 3.0

            //uniform 共享于vert, frag
            //attibute 仅用于vert
            //varying 用于vert, frag传数据

            sampler2D _MainTex;
            float4 _MainTex_ST;
            half _HeightOffset;
            half _HeightAmount;
            half4 _BaseCol;
            half _Alpha;
            half _MoveSpeed;
            half _StepLayer;

            half4 _LightingColor;

            struct v2f //输出结构
            {
                float4 pos : POSITION;
                float2 uv:TEXCOORD0;
                float3 nDir:TEXCOORD1;
                float3 vDir:TEXCOORD2;
                float4 posWS:TEXCOORD3;
                float2 uv2:TEXCOORD4;
                float4 color:TEXCOORD5;
                UNITY_FOG_COORDS(7)
            };

            v2f vert(appdata_full v) //顶点shader
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex) + float2(frac(_Time.y * _MoveSpeed), 0);
                o.uv2 = v.texcoord;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDir = UnityObjectToWorldNormal(v.normal);
                TANGENT_SPACE_ROTATION;
                o.vDir = mul(rotation, ObjSpaceViewDir(v.vertex));
                o.color = v.color;
                UNITY_TRANSFER_FOG(o, o.pos);
                return o;
            }

            float4 frag(v2f i) : COLOR //像素shader
            {
                //根据视角算偏移，模拟出假3D的效果,SPM优化而来的POM
                float3 vDir = normalize(i.vDir);
                vDir.xy *= _HeightOffset;
                //添加偏移值，减少狗牙感
                vDir.z += 0.4;
                float3 uv = float3(i.uv, 0);
                float3 uv2 = float3(i.uv2, 0);

                float4 var_Maintex = tex2D(_MainTex, uv2.xy); //先在uv2采样

                //vDir.xy除以vDir.z，可以得到uv的所需偏移方向，并平分为x层
                float3 minOffset = vDir / (vDir.z * _StepLayer);
                //两段noise叠加，产生新noise
                float finishedNoise = tex2D(_MainTex, uv.xy).r * var_Maintex.r; //后在uv1采样，并与uv2采样结果相乘
                float3 prev_uv = uv; //偏移前uv

                while (finishedNoise > uv.z) //新noise高于z深度
                {
                    uv += minOffset; //uv+偏移值
                    finishedNoise = tex2Dlod(_MainTex, float4(uv.xy, 0, 0)).r * var_Maintex.r; //在偏移后的uv重新采样noise
                }

                //选取每层选用的UV进行映射
                float d1 = finishedNoise - uv.z; //偏移后uv
                float d2 = finishedNoise - prev_uv.z; //偏移前uv
                float w = d1 / (d1 - d2 + 0.00000001); // w = 偏移后uv / (偏移后uv - 偏移前uv + 0.00000001)
                uv = lerp(uv, prev_uv, w); //根据w值lerp uv
                half4 resulColor = tex2D(_MainTex, uv.xy) * var_Maintex; //最终采样

                // half rangeClt = var_Maintex.a * resulColor.r + _Alpha * 0.75;
                // half Alpha = abs(smoothstep(rangeClt, _Alpha, 1.0));
                // Alpha = pow(Alpha, 5);

                half Alpha = resulColor.a * _Alpha;

                half4 finalColor = half4(resulColor.rgb * _BaseCol.rgb * _LightColor0.rgb, Alpha);

                return finalColor;
            }
            ENDCG
        }
    }
    //FallBack "Diffuse"
}