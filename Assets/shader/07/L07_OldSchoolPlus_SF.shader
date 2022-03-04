// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33607,y:32903,varname:node_3138,prsc:2|emission-621-OUT;n:type:ShaderForge.SFN_NormalVector,id:9576,x:31749,y:32851,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:4465,x:31968,y:32935,cmnt:h dot v,varname:node_4465,prsc:2,dt:0|A-9576-OUT,B-4387-OUT;n:type:ShaderForge.SFN_Max,id:7332,x:32164,y:32992,cmnt: Lambert Diffuse,varname:node_7332,prsc:2|A-4465-OUT,B-7039-OUT;n:type:ShaderForge.SFN_Vector1,id:7039,x:31968,y:33102,varname:node_7039,prsc:2,v1:0;n:type:ShaderForge.SFN_HalfVector,id:4387,x:31749,y:33045,varname:node_4387,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8258,x:32715,y:33441,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:node_5423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:2980,x:31617,y:33672,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_7756,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Multiply,id:1000,x:32509,y:33650,cmnt:可控强度,varname:node_1000,prsc:2|A-4424-OUT,B-5671-OUT;n:type:ShaderForge.SFN_NormalVector,id:1767,x:30590,y:33309,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:9218,x:30781,y:33309,varname:node_9218,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1767-OUT;n:type:ShaderForge.SFN_Max,id:4048,x:30985,y:33309,cmnt:向上部分遮罩,varname:node_4048,prsc:2|A-9218-OUT,B-8015-OUT;n:type:ShaderForge.SFN_Vector1,id:8015,x:30781,y:33532,varname:node_8015,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:9588,x:31617,y:33476,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_EnvCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Color,id:9459,x:31617,y:33292,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:_EnvCol_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Multiply,id:7748,x:31876,y:33290,varname:node_7748,prsc:2|A-9459-RGB,B-4048-OUT;n:type:ShaderForge.SFN_Add,id:8812,x:32083,y:33390,varname:node_8812,prsc:2|A-7748-OUT,B-3123-OUT;n:type:ShaderForge.SFN_Add,id:4424,x:32298,y:33650,cmnt:混合三重环境色,varname:node_4424,prsc:2|A-8812-OUT,B-3397-OUT;n:type:ShaderForge.SFN_Subtract,id:5674,x:31195,y:33498,varname:node_5674,prsc:2|A-8675-OUT,B-4048-OUT;n:type:ShaderForge.SFN_Vector1,id:8675,x:30985,y:33532,varname:node_8675,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:5068,x:31387,y:33498,cmnt:侧面部分遮罩,varname:node_5068,prsc:2|A-5674-OUT,B-3785-OUT;n:type:ShaderForge.SFN_Multiply,id:2060,x:30985,y:33699,varname:node_2060,prsc:2|A-9218-OUT,B-8763-OUT;n:type:ShaderForge.SFN_Vector1,id:8763,x:30781,y:33715,varname:node_8763,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:3785,x:31195,y:33699,cmnt:向下部分遮罩,varname:node_3785,prsc:2|A-2060-OUT,B-8015-OUT;n:type:ShaderForge.SFN_Multiply,id:3123,x:31876,y:33475,varname:node_3123,prsc:2|A-9588-RGB,B-5068-OUT;n:type:ShaderForge.SFN_Multiply,id:3397,x:31876,y:33672,varname:node_3397,prsc:2|A-2980-RGB,B-3785-OUT;n:type:ShaderForge.SFN_LightVector,id:5648,x:31330,y:32231,varname:node_5648,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1599,x:31544,y:32252,varname:node_1599,prsc:2|A-5648-OUT,B-3627-OUT;n:type:ShaderForge.SFN_Vector1,id:3627,x:31330,y:32389,varname:node_3627,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:3424,x:31734,y:32331,cmnt:rDir,varname:node_3424,prsc:2|A-1599-OUT,B-4129-OUT;n:type:ShaderForge.SFN_NormalVector,id:4129,x:31544,y:32411,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:7455,x:31734,y:32508,varname:node_7455,prsc:2;n:type:ShaderForge.SFN_Dot,id:2184,x:31938,y:32413,cmnt:r dot v,varname:node_2184,prsc:2,dt:0|A-3424-OUT,B-7455-OUT;n:type:ShaderForge.SFN_Max,id:8402,x:32134,y:32470,varname:node_8402,prsc:2|A-2184-OUT,B-7178-OUT;n:type:ShaderForge.SFN_Vector1,id:7178,x:31938,y:32580,varname:node_7178,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:1753,x:32323,y:32470,cmnt:Phong Specular,varname:node_1753,prsc:2|VAL-8402-OUT,EXP-5395-OUT;n:type:ShaderForge.SFN_Slider,id:5395,x:31938,y:32685,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:_SpecularPower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Add,id:1113,x:32734,y:32789,varname:node_1113,prsc:2|A-1753-OUT,B-7549-OUT;n:type:ShaderForge.SFN_Slider,id:5671,x:32141,y:33832,ptovrint:False,ptlb:EnvInt,ptin:_EnvInt,varname:node_5671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4,max:1;n:type:ShaderForge.SFN_Multiply,id:3100,x:32715,y:33630,cmnt:叠加基础色影响,varname:node_3100,prsc:2|A-6382-RGB,B-1000-OUT;n:type:ShaderForge.SFN_Multiply,id:7739,x:32919,y:33503,cmnt:环境部分结果,varname:node_7739,prsc:2|A-8258-RGB,B-3100-OUT;n:type:ShaderForge.SFN_Color,id:6382,x:32312,y:33112,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_6382,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7549,x:32515,y:32996,varname:node_7549,prsc:2|A-7332-OUT,B-6382-RGB;n:type:ShaderForge.SFN_Color,id:1802,x:32734,y:32552,ptovrint:False,ptlb:LightCol,ptin:_LightCol,cmnt:光源颜色,varname:node_1802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8375,x:32949,y:32676,varname:node_8375,prsc:2|A-1802-RGB,B-1113-OUT;n:type:ShaderForge.SFN_Multiply,id:6124,x:33128,y:32594,cmnt:光源部分结果,varname:node_6124,prsc:2|A-5633-OUT,B-8375-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5633,x:32949,y:32509,cmnt:光源遮挡,varname:node_5633,prsc:2;n:type:ShaderForge.SFN_Add,id:621,x:33329,y:33000,varname:node_621,prsc:2|A-6124-OUT,B-7739-OUT;proporder:6382-1802-5395-8258-5671-9459-9588-2980;pass:END;sub:END;*/

Shader "AP01/L07/OldSchoolPlus_SF" {
    Properties {
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _LightCol ("LightCol", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(1, 90)) = 30
        _Occlusion ("Occlusion", 2D) = "white" {}
        _EnvInt ("EnvInt", Range(0, 1)) = 0.4
        _EnvUpCol ("EnvUpCol", Color) = (0.5584282,0.8110124,0.8396226,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.5584282,0.8110124,0.8396226,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.5584282,0.8110124,0.8396226,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol ); // 光源颜色
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_9218 = i.normalDir.g;
                float node_8015 = 0.0;
                float node_4048 = max(node_9218,node_8015); // 向上部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float node_3785 = max((node_9218*(-1.0)),node_8015); // 向下部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float _EnvInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvInt );
                float3 emissive = ((attenuation*(_LightCol_var.rgb*(pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),_SpecPow_var)+(max(dot(i.normalDir,halfDirection),0.0)*_BaseCol_var.rgb))))+(_Occlusion_var.rgb*(_BaseCol_var.rgb*((((_EnvUpCol_var.rgb*node_4048)+(_EnvSideCol_var.rgb*((1.0-node_4048)-node_3785)))+(_EnvDownCol_var.rgb*node_3785))*_EnvInt_var))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
