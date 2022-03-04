Shader "AP1/L08/OldSchoolPlus" //Shader路径名
{
    Properties //材质面板参数
    {
        _BaseCol    ("基本色", Color) = (0.5,0.5,0.5,1)
        _LightCol   ("光颜色", Color) = (0.5,0.5,0.5,1)
        _SpecPow    ("高光次幂", Range(1, 90)) = 30
        _Occlusion  ("AO图", 2D) = "white" {}
        _EnvInt     ("环境光强度", Range(0, 1)) = 0.4
        _EnvUpCol   ("环境天顶颜色", Color) = (1,1,1,1)
        _EnvSideCol ("环境水平颜色", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("环境地表颜色", Color) = (0,0,0,1)
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

            uniform float3       _BaseCol;    
            uniform float3       _LightCol;   
            uniform float        _SpecPow;   
            uniform sampler2D    _Occlusion;  
            uniform float        _EnvInt;    
            uniform float3       _EnvUpCol;  
            uniform float3       _EnvSideCol; 
            uniform float3       _EnvDownCol; 
            
            struct VertexInput //输入结构
            {
                float4 vertex : POSITION;   // 将模型顶点信息输入进来
                float3 normal : NORMAL;     // 将模型法线信息输入进来
                float2 uv0    : TEXCOORD0;
            };

            struct VertexOutput //输出结构
            {
                float4 pos  : SV_POSITION;     // 齐次裁剪空间（屏幕空间）顶点位置
                float2 uv0     : TEXCOORD0;
                float4 posWS  : TEXCOORD1;       // 世界空间定点位置
                float3 nDirWS : TEXCOORD2;       // 世界空间法线方向
                LIGHTING_COORDS(3,4)             //投影用坐标信息,unity已封装
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;               // 新建输出结构
                o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点位置 OS>CS
                o.uv0 = v.uv0;
                o.posWS = mul(unity_ObjectToWorld,v.vertex );   // 变换顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线方向 OS>WS
                TRANSFER_VERTEX_TO_FRAGMENT(o)                  //unity已封装
                return o;                                       // 返回输出结构
            }

            float4 frag(VertexOutput i) : COLOR //像素shader
            {
                //准备向量
                float3 nDir = i.nDirWS;                                               // 获取nDir
                float3 lDir = _WorldSpaceLightPos0.xyz;                               // 获取lDir
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);          // 获取vDir
                float3 rDir = reflect(-lDir, nDir);                                   // 获取rDir

                //准备点积结果
                float nDotl = dot(nDir,lDir);                                         // nDir点积lDir
                float vDotr = dot(rDir,vDir); 

                //光照模型（直接光照）
                float shadow       = LIGHT_ATTENUATION(i);                                  //同样Unity封装好的函数,可取出投影
                float lambert      = max(0.0, nDotl);                                       // 兰伯特
                float Phong        = pow(max(0.0, vDotr) , _SpecPow);                       // 高光
                float3 dirLighting = (_BaseCol * lambert + Phong) * _LightCol * shadow;

                //光照模型（环境光照）
                //计算各部位遮罩
                float upMask       = max(0.0,nDir.g);            //朝上
                float downMask     = max(0.0,-nDir.g);           //朝下
                float sideMask     = 1.0 - upMask - downMask;    //侧面
                //混合环境色
                float3 envCol      = _EnvUpCol * upMask + _EnvSideCol * sideMask + _EnvDownCol * downMask;
                //采样Occlusion贴图
                float occlusion    = tex2D(_Occlusion , i.uv0);
                //计算环境光照
                float3 envLighting = _EnvInt * envCol * occlusion;

                //返回结果
                float3 finalRGB = dirLighting + envLighting;
                return float4(finalRGB, 1.0);// 输出最终颜色
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
