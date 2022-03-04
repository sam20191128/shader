Shader "Anisotropic"
{
    Properties
    {
        _MainTex ("RGB:基础颜色 A:环境遮罩", 2D) = "white" {}
        _Diffuse("Diffuse", Color) = (1, 1, 1, 1)
        _Specular("Specular", Color) = (1, 1, 1, 1)
        _Gloss1("Gloss1", Range(8.0, 256)) = 20 //亮度1
        _Gloss2("Gloss2", Range(8.0, 256)) = 20 //亮度2
        _Shift1("Shift1", float) = 0 //偏移1
        _Shift2("Shift2", float) = 0 //偏移2
        _NoiseTex("NoiseTex" , 2D) = "white"{} //扰动图
        _AlphaTex("Alpha Tex", 2D) = "white" {} //透明贴图
    }

    SubShader
    {
        Tags
        {
            "Queue" = "AlphaTest"
            "IgnoreProjector" = "True"
            "RenderType" = "TransparentCutout"
        }
        Pass
        {
            Tags
            {
                "LightMode" = "ForwardBase"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Lighting.cginc"

            uniform sampler2D _MainTex;
            uniform float4 _MainTex_ST;
            uniform fixed4 _Diffuse;
            uniform fixed4 _Specular;
            uniform float _Gloss1;
            uniform float _Gloss2;
            uniform float _Shift1;
            uniform float _Shift2;
            uniform sampler2D _NoiseTex;
            uniform float4 _NoiseTex_ST;
            uniform float4 _AlphaTex_ST;
            uniform sampler2D _AlphaTex;

            struct a2v
            {
                float4 vertex : POSITION; // 顶点信息 Get✔
                float4 uv0 : TEXCOORD0; // UV信息 Get✔
                float4 normal : NORMAL; // 法线信息 Get✔
                float4 tangent : TANGENT; // 切线信息 Get✔
            };

            struct v2f
            {
                float4 pos : SV_POSITION; // 屏幕顶点位置
                float4 uv0 : TEXCOORD0; // UV0
                float4 posWS : TEXCOORD1; // 世界空间顶点位置
                float3 nDirWS : TEXCOORD2; // 世界空间法线方向
                float3 tDirWS : TEXCOORD3; // 世界空间切线方向
                float3 bDirWS : TEXCOORD4; // 世界空间副切线方向
            };

            //顶点着色器
            v2f vert(a2v v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal); // 法线方向 OS>WS
                o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                //T参数是指 发梢 到 发根 的方向 ，也就是 副切线 的方向,而顶点中的 tangent 是指 垂直于 发梢 到 发根 方向 的向量, 所有求 T 的方法是 用这个 tangent 于 normal 叉乘得到
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w); // 副切线方向  T参数
                o.uv0.xy = v.uv0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
                o.uv0.zw = v.uv0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
                return o;
            }

            //T参数是指 发梢 到 发根 的方向 ，也就是 副切线 的方向 ———— bDirWS
            //而顶点中的 tangent 是指 垂直于 发梢 到 发根 方向 的向量, 所有求 T 的方法是 用这个 tangent 于 normal 叉乘得到

            //高光值
            float StrandSpecular(float3 T, float3 vDir, float3 lDir, float exponent)
            {
                float3 hDir = normalize(vDir + lDir); // 获取半角向量hDir1
                float dotTH = dot(T, hDir); //副切线1（T参数） dot 半角向量hDir1
                float sinTH = max(0.01, sqrt(1.0 - pow(dotTH, 2))); //平方根（1 - dotTH1的平方）
                float dirAtten = smoothstep(-1, 0, dotTH);
                return dirAtten * pow(sinTH, exponent);
            }

            //副切线的偏移
            float3 ShiftTangent(float3 T, float3 nDir, float shift)
            {
                float3 shiftedT = T + shift * nDir;
                return normalize(shiftedT);
            }

            //片元着色器
            fixed4 frag(v2f i) : SV_Target
            {
                float4 var_MainTex = tex2D(_MainTex, i.uv0);

                fixed Alpha = tex2D(_AlphaTex, i.uv0.xy).a;
                clip(Alpha - 0.5); //clip函数会将参数小于0的像素点直接丢弃掉

                //获取环境光
                fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;

                fixed3 lDirWS = normalize(UnityWorldSpaceLightDir(i.posWS));
                fixed3 vDirWS = normalize(UnityWorldSpaceViewDir(i.posWS));

                float shift = tex2D(_NoiseTex, i.uv0.xy).r - 0.5;
                float shift1 = shift - _Shift1;
                float shift2 = shift - _Shift2;

                //Kajiya-Kay Shading
                float3 bDirWS1 = ShiftTangent(i.bDirWS, i.nDirWS, shift1); //副切线1
                float3 bDirWS2 = ShiftTangent(i.bDirWS, i.nDirWS, shift2); //副切线2

                //主高光
                float S1 = StrandSpecular(bDirWS1, vDirWS, lDirWS, _Gloss1);
                //副高光
                float S2 = StrandSpecular(bDirWS2, vDirWS, lDirWS, _Gloss2);

                //specular = 主高光 + 副高光 
                fixed3 specular = _LightColor0.rgb * _Specular.rgb * (S1 + S2 * _Diffuse.rgb); //S2副高光 * _Diffuse.rgb亮度减弱

                //Lambert光照
                fixed3 diffuse = _LightColor0.rgb * var_MainTex.rgb * _Diffuse.rgb * saturate(dot(i.nDirWS, lDirWS)); //saturate,值规范到0~1之间

                //对高光范围进行遮罩
                specular *= saturate(diffuse * 2);

                return fixed4(ambient + diffuse + specular, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}