// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33684,y:32933,varname:node_3138,prsc:2|emission-1722-OUT;n:type:ShaderForge.SFN_Tex2d,id:5423,x:33216,y:32890,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:node_5423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:7756,x:32542,y:33208,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_7756,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Multiply,id:1722,x:33454,y:33035,varname:node_1722,prsc:2|A-5423-RGB,B-7356-OUT;n:type:ShaderForge.SFN_NormalVector,id:1629,x:31515,y:32845,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:8060,x:31706,y:32845,varname:node_8060,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1629-OUT;n:type:ShaderForge.SFN_Max,id:3728,x:31910,y:32845,cmnt:向上部分遮罩,varname:node_3728,prsc:2|A-8060-OUT,B-9796-OUT;n:type:ShaderForge.SFN_Vector1,id:9796,x:31706,y:33068,varname:node_9796,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:380,x:32542,y:33012,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_EnvCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Color,id:4208,x:32542,y:32828,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:_EnvCol_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5584282,c2:0.8110124,c3:0.8396226,c4:1;n:type:ShaderForge.SFN_Multiply,id:2625,x:32801,y:32826,varname:node_2625,prsc:2|A-4208-RGB,B-3728-OUT;n:type:ShaderForge.SFN_Add,id:8469,x:33008,y:32926,varname:node_8469,prsc:2|A-2625-OUT,B-436-OUT;n:type:ShaderForge.SFN_Add,id:7356,x:33223,y:33186,cmnt:混合三重环境色,varname:node_7356,prsc:2|A-8469-OUT,B-5346-OUT;n:type:ShaderForge.SFN_Subtract,id:149,x:32120,y:33034,varname:node_149,prsc:2|A-5604-OUT,B-3728-OUT;n:type:ShaderForge.SFN_Vector1,id:5604,x:31910,y:33068,varname:node_5604,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:8247,x:32312,y:33034,cmnt:侧面部分遮罩,varname:node_8247,prsc:2|A-149-OUT,B-2774-OUT;n:type:ShaderForge.SFN_Multiply,id:6681,x:31910,y:33235,varname:node_6681,prsc:2|A-8060-OUT,B-1171-OUT;n:type:ShaderForge.SFN_Vector1,id:1171,x:31706,y:33251,varname:node_1171,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:2774,x:32120,y:33235,cmnt:向下部分遮罩,varname:node_2774,prsc:2|A-6681-OUT,B-9796-OUT;n:type:ShaderForge.SFN_Multiply,id:436,x:32801,y:33011,varname:node_436,prsc:2|A-380-RGB,B-8247-OUT;n:type:ShaderForge.SFN_Multiply,id:5346,x:32801,y:33208,varname:node_5346,prsc:2|A-7756-RGB,B-2774-OUT;proporder:5423-4208-380-7756;pass:END;sub:END;*/

Shader "AP01/L07/3ColAmbient_SF" {
    Properties {
        _Occlusion ("Occlusion", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_8060 = i.normalDir.g;
                float node_9796 = 0.0;
                float node_3728 = max(node_8060,node_9796); // 向上部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float node_2774 = max((node_8060*(-1.0)),node_9796); // 向下部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float3 emissive = (_Occlusion_var.rgb*(((_EnvUpCol_var.rgb*node_3728)+(_EnvSideCol_var.rgb*((1.0-node_3728)-node_2774)))+(_EnvDownCol_var.rgb*node_2774)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
