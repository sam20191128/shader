// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33924,y:32555,varname:node_3138,prsc:2|emission-515-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:6220,x:32500,y:32341,varname:node_6220,prsc:2;n:type:ShaderForge.SFN_LightVector,id:4265,x:32500,y:32499,varname:node_4265,prsc:2;n:type:ShaderForge.SFN_Dot,id:153,x:32715,y:32401,cmnt:Phong,varname:node_153,prsc:2,dt:0|A-6220-OUT,B-4265-OUT;n:type:ShaderForge.SFN_RemapRange,id:6232,x:32910,y:32401,varname:node_6232,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-153-OUT;n:type:ShaderForge.SFN_Append,id:2378,x:33101,y:32401,varname:node_2378,prsc:2|A-6232-OUT,B-7993-OUT;n:type:ShaderForge.SFN_Slider,id:7993,x:32753,y:32606,ptovrint:False,ptlb:RampType,ptin:_RampType,varname:node_7993,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:9434,x:33294,y:32401,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_9434,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4da2e690869684a468aa0473c54bb0a0,ntxv:0,isnm:False|UVIN-2378-OUT;n:type:ShaderForge.SFN_Slider,id:2821,x:33137,y:32639,ptovrint:False,ptlb:EnvRefInt,ptin:_EnvRefInt,varname:_RampType_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:463,x:33505,y:32469,cmnt:环境反射,varname:node_463,prsc:2|A-9434-RGB,B-2821-OUT;n:type:ShaderForge.SFN_Max,id:4475,x:33281,y:32779,varname:node_4475,prsc:2|A-153-OUT,B-7190-OUT;n:type:ShaderForge.SFN_Vector1,id:7190,x:33101,y:32833,varname:node_7190,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:1284,x:33511,y:32806,cmnt:光源反射,varname:node_1284,prsc:2|VAL-4475-OUT,EXP-406-OUT;n:type:ShaderForge.SFN_Slider,id:406,x:33124,y:32970,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:_EnvRefInt_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:10,cur:30,max:90;n:type:ShaderForge.SFN_Add,id:515,x:33712,y:32655,varname:node_515,prsc:2|A-463-OUT,B-1284-OUT;proporder:9434-7993-2821-406;pass:END;sub:END;*/

Shader "AP01/L06/FakeReflect" {
    Properties {
        _RampTex ("RampTex", 2D) = "white" {}
        _RampType ("RampType", Range(0, 1)) = 0
        _EnvRefInt ("EnvRefInt", Range(0, 1)) = 0
        _SpecularPow ("SpecularPow", Range(10, 90)) = 30
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRefInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_153 = dot(viewReflectDirection,lightDirection); // Phong
                float _RampType_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RampType );
                float2 node_2378 = float2((node_153*0.5+0.5),_RampType_var);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_2378, _RampTex));
                float _EnvRefInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvRefInt );
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float3 emissive = ((_RampTex_var.rgb*_EnvRefInt_var)+pow(max(node_153,0.0),_SpecularPow_var));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRefInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
