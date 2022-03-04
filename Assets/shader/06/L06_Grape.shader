// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34245,y:32203,varname:node_3138,prsc:2|emission-3954-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:6220,x:32479,y:32341,varname:node_6220,prsc:2;n:type:ShaderForge.SFN_LightVector,id:4265,x:32479,y:32499,varname:node_4265,prsc:2;n:type:ShaderForge.SFN_Dot,id:153,x:32676,y:32424,cmnt:Phong,varname:node_153,prsc:2,dt:0|A-6220-OUT,B-4265-OUT;n:type:ShaderForge.SFN_Max,id:4475,x:32895,y:32466,varname:node_4475,prsc:2|A-153-OUT,B-7190-OUT;n:type:ShaderForge.SFN_Vector1,id:7190,x:32676,y:32614,varname:node_7190,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:1284,x:33341,y:32532,cmnt:光源反射,varname:node_1284,prsc:2|VAL-4475-OUT,EXP-8751-OUT;n:type:ShaderForge.SFN_Slider,id:406,x:32623,y:32772,ptovrint:False,ptlb:SpecularPower1,ptin:_SpecularPower1,varname:_EnvRefInt_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:200;n:type:ShaderForge.SFN_Dot,id:9528,x:32478,y:32046,varname:node_9528,prsc:2,dt:0|A-4561-OUT,B-3725-OUT;n:type:ShaderForge.SFN_NormalVector,id:4561,x:32293,y:31943,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3725,x:32293,y:32140,varname:node_3725,prsc:2;n:type:ShaderForge.SFN_Append,id:8831,x:33161,y:32147,varname:node_8831,prsc:2|A-5198-OUT,B-294-OUT;n:type:ShaderForge.SFN_Tex2d,id:2197,x:33372,y:32147,ptovrint:False,ptlb:SSS_TEX,ptin:_SSS_TEX,varname:_Lut_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:92142b3aae5656245944ab30b688ee19,ntxv:0,isnm:False|UVIN-8831-OUT;n:type:ShaderForge.SFN_RemapRange,id:2885,x:32684,y:32046,varname:node_2885,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9528-OUT;n:type:ShaderForge.SFN_Slider,id:294,x:32758,y:32248,ptovrint:False,ptlb:SSS_intensity,ptin:_SSS_intensity,varname:_SSSPower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Slider,id:8146,x:32623,y:32893,ptovrint:False,ptlb:SpecularPower2,ptin:_SpecularPower2,varname:_SpecularPow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:200;n:type:ShaderForge.SFN_Tex2d,id:2268,x:33372,y:31929,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:_SSS_TEX_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0bd81e12bb2a70645842270e37b626f1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Blend,id:660,x:33636,y:32098,varname:node_660,prsc:2,blmd:7,clmp:True|SRC-2268-R,DST-2197-RGB;n:type:ShaderForge.SFN_Lerp,id:8751,x:33045,y:32696,varname:node_8751,prsc:2|A-406-OUT,B-8146-OUT,T-2268-G;n:type:ShaderForge.SFN_Add,id:3954,x:34023,y:32438,varname:node_3954,prsc:2|A-660-OUT,B-5380-OUT;n:type:ShaderForge.SFN_Multiply,id:2798,x:33640,y:32528,varname:node_2798,prsc:2|A-1284-OUT,B-2268-G;n:type:ShaderForge.SFN_Multiply,id:5380,x:33835,y:32607,varname:node_5380,prsc:2|A-2798-OUT,B-9832-OUT;n:type:ShaderForge.SFN_Vector1,id:9832,x:33640,y:32708,varname:node_9832,prsc:2,v1:5;n:type:ShaderForge.SFN_LightAttenuation,id:1069,x:32684,y:31889,varname:node_1069,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5198,x:32915,y:32028,varname:node_5198,prsc:2|A-1069-OUT,B-2885-OUT;proporder:2268-2197-294-406-8146;pass:END;sub:END;*/

Shader "AP01/L06/Grape" {
    Properties {
        _BaseColor ("BaseColor", 2D) = "white" {}
        _SSS_TEX ("SSS_TEX", 2D) = "white" {}
        _SSS_intensity ("SSS_intensity", Range(0, 1)) = 0.3
        _SpecularPower1 ("SpecularPower1", Range(0, 200)) = 2
        _SpecularPower2 ("SpecularPower2", Range(0, 200)) = 0
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
            uniform sampler2D _SSS_TEX; uniform float4 _SSS_TEX_ST;
            uniform sampler2D _BaseColor; uniform float4 _BaseColor_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SSS_intensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower2)
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _BaseColor_var = tex2D(_BaseColor,TRANSFORM_TEX(i.uv0, _BaseColor));
                float _SSS_intensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SSS_intensity );
                float2 node_8831 = float2((attenuation*(dot(i.normalDir,lightDirection)*0.5+0.5)),_SSS_intensity_var);
                float4 _SSS_TEX_var = tex2D(_SSS_TEX,TRANSFORM_TEX(node_8831, _SSS_TEX));
                float _SpecularPower1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower1 );
                float _SpecularPower2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower2 );
                float3 emissive = (saturate((_SSS_TEX_var.rgb/(1.0-_BaseColor_var.r)))+((pow(max(dot(viewReflectDirection,lightDirection),0.0),lerp(_SpecularPower1_var,_SpecularPower2_var,_BaseColor_var.g))*_BaseColor_var.g)*5.0));
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
            uniform sampler2D _SSS_TEX; uniform float4 _SSS_TEX_ST;
            uniform sampler2D _BaseColor; uniform float4 _BaseColor_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SSS_intensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower2)
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
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
