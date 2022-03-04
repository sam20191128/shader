Shader "AP01/L07/Shadow" //Shader路径名
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
            #include "AutoLight.cginc"  //使用unity投影必须包含这两个库文件
            #include "Lighting.cginc"   //同上
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            struct VertexInput //输入结构
            {
                float4 vertex : POSITION;
            };

            struct VertexOutput //输出结构
            {
                float4 pos : SV_POSITION;
                LIGHTING_COORDS(0,1)//投影用坐标信息,unity已封装
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)//unity已封装
                return o;
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                float shadow = LIGHT_ATTENUATION(i);//同样Unity封装好的函数,可取出投影
                return float4(shadow,shadow,shadow,1.0);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
