Shader "AP1/L09/OldSchoolPro" //Shader路径名
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
        _Cubemap    ("环境球", Cube) = "_Skybox" {}
        _NormalMap  ("法线贴图", 2D) = "bump" {}
        _CubemapMip ("环境球Mip", Range(0, 7)) = 0
        _FresnelPow ("菲涅尔次幂", Range(0, 10)) = 1
        _EnvSpecInt ("环境镜面反射强度", Range(0, 5)) = 1
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

            // 输入参数
            uniform float3       _BaseCol;    
            uniform float3       _LightCol;   
            uniform float        _SpecPow;   
            uniform sampler2D    _Occlusion;  
            uniform float        _EnvInt;    
            uniform float3       _EnvUpCol;  
            uniform float3       _EnvSideCol; 
            uniform float3       _EnvDownCol; 
            uniform samplerCUBE  _Cubemap;
            uniform sampler2D    _NormalMap; 
            uniform float        _CubemapMip; 
            uniform float        _FresnelPow;
            uniform float        _EnvSpecInt;
            
            struct VertexInput //输入结构
            {
                float4 vertex  : POSITION;   // 将模型顶点信息输入进来
                float3 normal  : NORMAL;     // 将模型法线信息输入进来
                float4 tangent : TANGENT;    // 切线信息
                float2 uv0     : TEXCOORD0;
            };

            struct VertexOutput //输出结构
            {
                float4 pos       : SV_POSITION;  // 齐次裁剪空间（屏幕空间）顶点位置
                float3 posWS     : TEXCOORD0;
                float2 uv0       : TEXCOORD1;
                float3 nDirWS    : TEXCOORD2;
                float3 tDirWS    : TEXCOORD3;    // 世界切线方向
                float3 bDirWS    : TEXCOORD4;    // 世界副切线方向
                LIGHTING_COORDS(5,6)             //投影用坐标信息,unity已封装
            };

            VertexOutput vert (VertexInput v) //顶点shader
            {
                VertexOutput o = (VertexOutput)0;               // 新建输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点位置 OS>CS
                    o.uv0 = v.uv0;
                    o.posWS = mul(unity_ObjectToWorld,v.vertex );   // 变换顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线方向 OS>WS
                    o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
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
                
                float3 nDirTS  = UnpackNormal(tex2D(_NormalMap, i.uv0)).rgb;            // 采样法线纹理并解码 切线空间nDir
                float3x3 TBN   = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);                // 构建TBN矩阵
                float3 nDirWS  = normalize(mul(nDirTS, TBN));                           // 世界空间nDir
                float3 nDirVS  = mul(UNITY_MATRIX_V , float4(nDirWS,0.0));              // 视空间nDir
                float3 vDirWS  = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);     //计算菲涅尔
                float3 vrDirWS = reflect(-vDirWS, nDirWS);// 采样Cubemap

                //中间量准备
                float nDotl = dot(nDir,lDir);                                         // nDir点积lDir
                float vDotr = dot(rDir,vDir); 
                float nDotv = dot(nDirWS,vDirWS);//菲涅尔

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
                float occlusion    = tex2D(_Occlusion , i.uv0).r;
                //计算环境光照
                float3 envLighting = _EnvInt * envCol * occlusion;

                //光照模型(cubemap)
                //float3 occlusion = tex2D(_Occlusion,i.uv0).r;
                float3 cubemap = texCUBElod(_Cubemap,float4(vrDirWS,_CubemapMip));
                float frensel = pow(1.0 - nDotv,_FresnelPow);
                float3 envSpecLighting = cubemap * frensel * _EnvSpecInt * occlusion;

                //返回结果
                float3 finalRGB = dirLighting + envLighting + envSpecLighting;
                return float4(finalRGB, 1.0);// 输出最终颜色
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
