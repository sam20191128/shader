Shader "AP01/L19/Translation" //Shader路径名
{
    Properties //材质面板参数
    {
        _MainTex    ("RGB：颜色 A：透贴", 2d) = "gray"{}
        _Opacity    ("透明度", range(0, 1)) = 0.5
        _MoveRange  ("移动范围", range(0.0, 3.0)) = 1.0
        _MoveSpeed  ("移动速度", range(0.0, 3.0)) = 1.0
    }

    SubShader
    {
        Tags 
        {
            "Queue"="Transparent"               // 调整渲染顺序
            "RenderType"="Transparent"          // 对应改为Cutout
            "ForceNoShadowCasting"="True"       // 关闭阴影投射
            "IgnoreProjector"="True"            // 不响应投射器
        }
        Pass 
        {
            Name "FORWARD"
            Tags 
            {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha          // 修改混合方式One/SrcAlpha OneMinusSrcAlpha
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half _Opacity;
            uniform float _MoveRange;
            uniform float _MoveSpeed;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };

            // 声明常量
            #define TWO_PI 6.283185
            // 顶点动画方法
            void Translation (inout float3 vertex) 
            {
                vertex.y += _MoveRange * sin(frac(_Time.z * _MoveSpeed) * TWO_PI);//乘以2倍的π，走完完整的sin函数
            }

            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                    Translation(v.vertex.xyz);
                    o.pos = UnityObjectToClipPos( v.vertex);    // 顶点位置 OS>CS
                    o.uv = TRANSFORM_TEX(v.uv, _MainTex);       // UV信息 支持TilingOffset
                return o;
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR 
            {
                half4 var_MainTex = tex2D(_MainTex,i.uv);      // 采样贴图 RGB颜色 A透贴
                half3 finalRGB = var_MainTex.rgb;
                half opacity = var_MainTex.a * _Opacity;
                return half4(finalRGB * opacity, opacity);     // 返回值
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
