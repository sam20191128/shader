// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34241,y:32662,varname:node_3138,prsc:2|emission-9075-OUT;n:type:ShaderForge.SFN_Slider,id:4249,x:32939,y:32942,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_4249,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Tex2d,id:4483,x:32741,y:32702,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_4483,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2db422f013c37b4e9d26b6605513ab8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:7527,x:32939,y:32702,cmnt:nDirWS 简单连法,varname:node_7527,prsc:2,tffrom:2,tfto:0|IN-4483-RGB;n:type:ShaderForge.SFN_Fresnel,id:6955,x:33387,y:32807,varname:node_6955,prsc:2|NRM-7527-XYZ,EXP-4249-OUT;n:type:ShaderForge.SFN_Multiply,id:5975,x:33730,y:32627,varname:node_5975,prsc:2|A-5288-RGB,B-6955-OUT;n:type:ShaderForge.SFN_Multiply,id:9075,x:33992,y:32763,varname:node_9075,prsc:2|A-5975-OUT,B-3560-OUT;n:type:ShaderForge.SFN_ViewVector,id:2389,x:32741,y:32452,varname:node_2389,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3266,x:32944,y:32452,cmnt:-vDir,varname:node_3266,prsc:2|A-2389-OUT,B-8331-OUT;n:type:ShaderForge.SFN_Vector1,id:8331,x:32741,y:32595,varname:node_8331,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:1710,x:33162,y:32452,varname:node_1710,prsc:2|A-3266-OUT,B-7527-XYZ;n:type:ShaderForge.SFN_Cubemap,id:5288,x:33483,y:32451,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_5288,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:d51cd34544212c54fad1d1ed41ff1d59,pvfc:0|DIR-1710-OUT,MIP-5144-OUT;n:type:ShaderForge.SFN_Slider,id:5144,x:33143,y:32634,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:_FresnelPow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:7;n:type:ShaderForge.SFN_Slider,id:3560,x:33611,y:32959,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:_CubemapMip_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:5;proporder:4483-5288-5144-4249-3560;pass:END;sub:END;*/

Shader "AP01/L09/Cubemap_SF" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 1
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 0.2
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
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _Cubemap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_7527 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDirWS 简单连法
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((texCUBElod(_Cubemap,float4(reflect((viewDirection*(-1.0)),node_7527.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_7527.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
