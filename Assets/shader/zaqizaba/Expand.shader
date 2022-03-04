Shader "Expand"
{
    Properties
    {
        [Header(Texture)]
        _MainTex ("RGB:基础颜色 A:环境遮罩", 2D) = "white" {}
        [Normal] _NormTex ("RGB:法线贴图", 2D) = "bump" {}
        _SpecTex ("RGB:高光颜色 A:高光次幂", 2D) = "gray" {}
        _EmitTex ("RGB:环境贴图", 2d) = "black" {}
        _Cubemap ("RGB:环境贴图", cube) = "_Skybox" {}
        [Header(Diffuse)]
        _MainCol ("基本色", Color) = (0.5, 0.5, 0.5, 1.0)
        _EnvDiffInt ("环境漫反射强度", Range(0, 1)) = 0.2
        _EnvUpCol ("环境天顶颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvSideCol ("环境水平颜色", Color) = (0.5, 0.5, 0.5, 1.0)
        _EnvDownCol ("环境地表颜色", Color) = (0.0, 0.0, 0.0, 0.0)
        [Header(Specular)]
        [PowerSlider(2)] _SpecPow ("高光次幂", Range(1, 90)) = 30
        _EnvSpecInt ("环境镜面反射强度", Range(0, 5)) = 0.2
        _FresnelPow ("菲涅尔次幂", Range(0, 5)) = 1
        _CubemapMip ("环境球Mip", Range(0, 7)) = 0

        [Header(Expand)]
        _Expand ("膨胀强度", float) = 1


    }
    SubShader
    {
        Tags
        {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass
        {
            Name "FORWARD"
            Tags
            {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha // 修改混合方式One/SrcAlpha OneMinusSrcAlpha
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            // 追加投影相关包含文件
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数

            uniform float _Expand;

            // Texture
            uniform sampler2D _MainTex;
            uniform float4 _MainTex_ST;
            uniform sampler2D _NormTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _EmitTex;
            uniform samplerCUBE _Cubemap;
            // Diffuse
            uniform float3 _MainCol;
            uniform float _EnvDiffInt;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            // Specular
            uniform float _SpecPow;
            uniform float _FresnelPow;
            uniform float _EnvSpecInt;
            uniform float _CubemapMip;

            // 输入结构
            struct VertexInput
            {
                float4 vertex : POSITION; // 顶点信息 Get✔
                float2 uv0 : TEXCOORD0; // UV信息 Get✔
                float2 uv1 : TEXCOORD1; // UV信息 Get✔
                float4 normal : NORMAL; // 法线信息 Get✔
                float4 tangent : TANGENT; // 切线信息 Get✔
                float4 color : COLOR; // 追加顶点色信息
            };

            // 输出结构
            struct VertexOutput
            {
                float4 pos : SV_POSITION; // 屏幕顶点位置
                float2 uv0 : TEXCOORD0; // UV0
                float2 uv1 : TEXCOORD1; // UV0
                float4 posWS : TEXCOORD2; // 世界空间顶点位置
                float3 nDirWS : TEXCOORD3; // 世界空间法线方向
                float3 tDirWS : TEXCOORD4; // 世界空间切线方向
                float3 bDirWS : TEXCOORD5; // 世界空间副切线方向
                float4 effectMask : TEXCOORD6; // 追加effectMask输出
                LIGHTING_COORDS(7, 8) // 投影相关
            };

            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert(VertexInput v)
            {
                // 输出结构
                VertexOutput o = (VertexOutput)0;
                // 计算顶点动画 同时获取EffectMask
                //o.effectMask = CyberpunkAnim(noise, v.color.r, v.normal.xyz, v.vertex.xyz);
                //o.pos = UnityObjectToClipPos(v.vertex); // 顶点位置 OS>CS
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw; // 传递UV
                o.uv1 = v.uv1;
                o.posWS = mul(unity_ObjectToWorld, v.vertex); // 顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal(v.normal); // 法线方向 OS>WS
                o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w); // 副切线方向
                TRANSFER_VERTEX_TO_FRAGMENT(o) // 投影相关

                //顶点偏移
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal * _Expand, 1));
                
                return o; // 返回输出结构
            }

            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR
            {
                // 准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 vrDirWS = reflect(-vDirWS, nDirWS);
                float3 lDirWS = _WorldSpaceLightPos0.xyz;
                float3 lrDirWS = reflect(-lDirWS, nDirWS);
                // 准备点积结果
                float ndotl = dot(nDirWS, lDirWS);
                float vdotr = dot(vDirWS, lrDirWS);
                float vdotn = dot(vDirWS, nDirWS);
                // 采样纹理
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float3 var_Cubemap = texCUBElod(_Cubemap, float4(vrDirWS, lerp(_CubemapMip, 0.0, var_SpecTex.a))).rgb;
                // 光照模型(直接光照部分)
                float3 baseCol = var_MainTex.rgb * _MainCol;
                float lambert = max(0.0, ndotl);
                float specCol = var_SpecTex.rgb;
                float specPow = lerp(1, _SpecPow, var_SpecTex.a);
                float phong = pow(max(0.0, vdotr), specPow);
                float shadow = LIGHT_ATTENUATION(i);
                float3 dirLighting = (baseCol * lambert + specCol * phong) * _LightColor0 * shadow;
                // 光照模型(环境光照部分) 
                float fresnel = pow(max(0.0, 1.0 - vdotn), _FresnelPow); // 菲涅尔
                float occlusion = var_MainTex.a;
                float3 envLighting = (baseCol * _EnvDiffInt + var_Cubemap * fresnel * _EnvSpecInt * var_SpecTex.a) * occlusion;
                // 返回结果
                float3 finalRGB = dirLighting + envLighting;
                return float4(finalRGB, 1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}