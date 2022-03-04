Shader "AP1/L05/OldSchool_BlinnPhong" //Shader路径名
{
    Properties //材质面板参数
    {
        _MainCol        ("颜色",        color)          =(1.0,1.0,1.0,1.0)
        _SpecularPow    ("高光次幂",    Range(1,90))    =30
        _SpecularCol    ("高光颜色",    color)          =(1.0,1.0,1.0,1.0)
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

            //uniform 共享于vert, frag
            //attibute 仅用于vert
            //varying 用于vert, frag传数据

            uniform float3 _MainCol;
            uniform float _SpecularPow;
            uniform float3  _SpecularCol;
            
            struct VertexInput //输入结构
            {
                float4 vertex : POSITION;   // 将模型顶点信息输入进来
                float3 normal : NORMAL;     // 将模型法线信息输入进来
            };

            struct VertexOutput //输出结构
            {
                float4 posCS : SV_POSITION;     // 齐次裁剪空间（屏幕空间）顶点位置
                float4 posWS : TEXCOORD0;       // 世界空间定点位置
                float3 nDirWS : TEXCOORD1;      // 世界空间法线方向
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;               // 新建输出结构
                o.posCS = UnityObjectToClipPos( v.vertex );     // 变换顶点位置 OS>CS
                o.posWS = mul(unity_ObjectToWorld,v.vertex );   // 变换顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线方向 OS>WS
                return o;                                       // 返回输出结构
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                //准备向量
                float3 nDir = i.nDirWS;                                               // 获取nDir
                float3 lDir = _WorldSpaceLightPos0.xyz;                               // 获取lDir
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);          // 获取vDir
                float3 hDir = normalize(vDir + lDir);                                   // 获取hDir
                //准备点积结果
                float nDotl = dot(nDir,lDir);                                         // nDir点积lDir
                float nDoth = dot(nDir,hDir);                                         // nDir点积hDir
                //光照模型
                float lambert = max(0.0, nDotl);                                      // 兰伯特
                float blinnPhong = pow( max(0.0, nDoth) , _SpecularPow );                 // 高光
                float3 finalRGB = _MainCol * lambert + _SpecularCol * blinnPhong;
                //返回结果
                return float4(finalRGB, 1.0);                                         // 输出最终颜色
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
