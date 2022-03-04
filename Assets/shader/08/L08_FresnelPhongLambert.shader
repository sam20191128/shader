// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34132,y:33150,varname:node_3138,prsc:2|emission-1471-OUT;n:type:ShaderForge.SFN_Max,id:7332,x:32737,y:32887,varname:node_7332,prsc:2|A-153-OUT,B-7039-OUT;n:type:ShaderForge.SFN_Vector1,id:7039,x:32534,y:33053,varname:node_7039,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:2803,x:32972,y:32887,cmnt:Phong,varname:node_2803,prsc:2|VAL-7332-OUT,EXP-6635-OUT;n:type:ShaderForge.SFN_Slider,id:6635,x:32534,y:33164,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_6635,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_ViewReflectionVector,id:6220,x:32319,y:32827,varname:node_6220,prsc:2;n:type:ShaderForge.SFN_LightVector,id:4265,x:32320,y:33063,varname:node_4265,prsc:2;n:type:ShaderForge.SFN_Dot,id:153,x:32534,y:32887,cmnt: l dot vr 等价写法,varname:node_153,prsc:2,dt:0|A-6220-OUT,B-4265-OUT;n:type:ShaderForge.SFN_Append,id:2094,x:33173,y:32887,varname:node_2094,prsc:2|A-2803-OUT,B-8370-OUT;n:type:ShaderForge.SFN_Vector1,id:8370,x:32972,y:33050,varname:node_8370,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Tex2d,id:3199,x:33374,y:32887,ptovrint:False,ptlb:node_3199,ptin:_node_3199,varname:node_3199,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e424ce0276700014ab4efe2ed29a2450,ntxv:0,isnm:False|UVIN-2094-OUT;n:type:ShaderForge.SFN_NormalVector,id:1659,x:32320,y:33301,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3218,x:32535,y:33301,cmnt: l dot vr 等价写法,varname:node_3218,prsc:2,dt:0|A-4265-OUT,B-1659-OUT;n:type:ShaderForge.SFN_Max,id:8644,x:32738,y:33301,cmnt:Lambert,varname:node_8644,prsc:2|A-3218-OUT,B-6710-OUT;n:type:ShaderForge.SFN_Vector1,id:6710,x:32535,y:33492,varname:node_6710,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:7888,x:32944,y:33301,varname:node_7888,prsc:2|A-8644-OUT,B-9599-RGB;n:type:ShaderForge.SFN_Color,id:9599,x:32738,y:33492,ptovrint:False,ptlb:MainCol,ptin:_MainCol,varname:node_9599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Add,id:1471,x:33878,y:33246,varname:node_1471,prsc:2|A-5534-OUT,B-7888-OUT;n:type:ShaderForge.SFN_Fresnel,id:4115,x:32669,y:32487,varname:node_4115,prsc:2|EXP-9553-OUT;n:type:ShaderForge.SFN_Slider,id:9553,x:32297,y:32507,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_9553,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:20;n:type:ShaderForge.SFN_ComponentMask,id:8759,x:32669,y:32650,varname:node_8759,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1659-OUT;n:type:ShaderForge.SFN_Multiply,id:8020,x:32839,y:32566,varname:node_8020,prsc:2|A-4115-OUT,B-8759-OUT;n:type:ShaderForge.SFN_Lerp,id:5534,x:33636,y:32893,varname:node_5534,prsc:2|A-3199-RGB,B-3887-RGB,T-8020-OUT;n:type:ShaderForge.SFN_Color,id:3887,x:33374,y:33104,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:_MainCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:3199-9599-6635-3887-9553;pass:END;sub:END;*/

Shader "AP01/L08/FresnelPhongLambert" {
    Properties {
        _node_3199 ("node_3199", 2D) = "white" {}
        _MainCol ("MainCol", Color) = (0.5,0.5,0.5,1)
        _SpecularPower ("SpecularPower", Range(1, 90)) = 30
        _FresnelCol ("FresnelCol", Color) = (0.5,0.5,0.5,1)
        _FresnelPow ("FresnelPow", Range(0, 20)) = 5
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
            uniform sampler2D _node_3199; uniform float4 _node_3199_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
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
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float2 node_2094 = float2(pow(max(dot(viewReflectDirection,lightDirection),0.0),_SpecularPower_var),0.2);
                float4 _node_3199_var = tex2D(_node_3199,TRANSFORM_TEX(node_2094, _node_3199));
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float4 _MainCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainCol );
                float3 emissive = (lerp(_node_3199_var.rgb,_FresnelCol_var.rgb,(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPow_var)*i.normalDir.g))+(max(dot(lightDirection,i.normalDir),0.0)*_MainCol_var.rgb));
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
            uniform sampler2D _node_3199; uniform float4 _node_3199_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
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
