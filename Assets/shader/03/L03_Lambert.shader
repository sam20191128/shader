Shader "AP1/L03/Lambert" //Shader路径名
{
    Properties //材质面板参数
    {

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
            
            struct VertexInput //输入结构
            {
                float4 vertex : POSITION;// 将模型顶点信息输入进来
                float3 normal : NORMAL;// 将模型法线信息输入进来
            };

            struct VertexOutput //输出结构
            {
                float4 pos : SV_POSITION;// 由模型顶点信息换算而来的顶点屏幕位置
                float3 nDirWS : TEXCOORD0;// 由模型法线信息换算来的世界空间法线信息
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;// 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );// 变换顶点信息 并将其塞给输出结构
                o.nDirWS = UnityObjectToWorldNormal(v.normal);// 变换法线信息 并将其塞给输出结构
                return o;// 将输出结构 输出
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                float3 nDir = i.nDirWS;// 获取nDir
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);// 获取lDir
                float nDotl = dot(nDir,lDir);// nDir点积lDir
                float lambert = max(0.0, nDotl);// 截断负值
                return float4(lambert, lambert, lambert, 1.0);// 输出最终颜色
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
