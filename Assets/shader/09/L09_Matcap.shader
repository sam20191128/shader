Shader "AP01/L09/Matcap" //Shader路径名
{
    Properties //材质面板参数
    {
        _NormalMap  ("法线贴图", 2D)                   = "bump" {}
        _Matcap     ("Matcap", 2D)                    = "gray" {}
        _FresnelPow ("菲涅尔次幂", Range(0, 10))       = 1
        _EnvSpecInt ("环境镜面反射强度", Range(0, 5))   = 1
    }

    SubShader
    {
        Tags 
        {
            "RenderType"="Opaque"
        }

        Pass 
        {
            Name "FORWARD"
            Tags 
            {
                "LightMode"="ForwardBase"
            }
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            // 输入参数
            uniform sampler2D  _NormalMap; 
            uniform sampler2D  _Matcap; 
            uniform float      _FresnelPow;
            uniform float      _EnvSpecInt;
            
            struct VertexInput //输入结构
            {
                float4 vertex  : POSITION;
                float3 normal  : NORMAL;         // 将模型法线信息输入进来
                float4 tangent : TANGENT;        // 构建TBN矩阵 需要模型切线信息
                float2 uv0     : TEXCOORD0;      // 需要UV坐标 采样法线贴图
            };

            struct VertexOutput //输出结构
            {
                float4 pos       : SV_POSITION;
                float3 posWS     : TEXCOORD0;
                float2 uv0       : TEXCOORD1;
                float3 nDirWS    : TEXCOORD2;
                float3 tDirWS    : TEXCOORD3;   // 世界切线方向
                float3 bDirWS    : TEXCOORD4;   // 世界副切线方向
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;
                o.pos    = UnityObjectToClipPos( v.vertex );
                o.uv0    = v.uv0;
                o.posWS  = mul(unity_ObjectToWorld,v.vertex );   
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                return o;
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                //向量准备
                float3 nDirTS  = UnpackNormal(tex2D(_NormalMap, i.uv0)).rgb;            // 采样法线纹理并解码 切线空间nDir
                float3x3 TBN   = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);                // 构建TBN矩阵
                float3 nDirWS  = normalize(mul(nDirTS, TBN));                           // 世界空间nDir
                float3 nDirVS  = mul(UNITY_MATRIX_V , float4(nDirWS,0.0));              // 视空间nDir
                float3 vDirWS  = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);     //计算菲涅尔

                //中间量准备
                float2 matcapUV = nDirVS.rg * 0.5 + 0.5;
                float ndotv     = dot(nDirWS,vDirWS);       //菲涅尔

                //光照模型
                float3 matcap = tex2D(_Matcap,matcapUV);
                float frensel = pow(1.0 - ndotv,_FresnelPow);
                float3 envSpecLighting = matcap * frensel * _EnvSpecInt;

                //返回结果
                return fixed4(envSpecLighting,1.0);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
