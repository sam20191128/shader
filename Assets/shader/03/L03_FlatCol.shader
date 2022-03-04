Shader "AP01/L03/FlatCol" //Shader路径名
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
            // 输入结构
            struct VertexInput 
            {
                float4 vertex : POSITION;
            };
            //输出结构
            struct VertexOutput 
            {
                float4 pos : SV_POSITION;
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) 
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR
            {
                return fixed4(0.1,0.5,0.1,1.0);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
