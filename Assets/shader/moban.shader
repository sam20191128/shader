Shader "AP1/L01/moban" //Shader路径名
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

            //uniform 共享于vert, frag
            //attibute 仅用于vert
            //varying 用于vert, frag传数据
            
            struct VertexInput //输入结构
            {
                float4 vertex : POSITION;
            };

            struct VertexOutput //输出结构
            {
                float4 pos : SV_POSITION;
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                return fixed4(0.1,0.5,0.1,1.0);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
