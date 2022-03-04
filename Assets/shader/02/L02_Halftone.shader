// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34353,y:33335,varname:node_3138,prsc:2|emission-9265-OUT,olwid-6067-OUT,olcol-7979-RGB;n:type:ShaderForge.SFN_Dot,id:4014,x:33347,y:33390,varname:node_4014,prsc:2,dt:0|A-5798-OUT,B-7053-OUT;n:type:ShaderForge.SFN_NormalVector,id:5798,x:33142,y:33319,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7053,x:33142,y:33505,varname:node_7053,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2753,x:33547,y:33470,varname:node_2753,prsc:2|A-4014-OUT,B-6876-OUT;n:type:ShaderForge.SFN_Color,id:7979,x:33938,y:33937,ptovrint:False,ptlb:outline color,ptin:_outlinecolor,varname:node_7979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:6721,x:32955,y:33021,varname:node_6721,prsc:2,sctp:1;n:type:ShaderForge.SFN_Multiply,id:1694,x:33142,y:33099,varname:node_1694,prsc:2|A-6721-UVOUT,B-1593-OUT;n:type:ShaderForge.SFN_Slider,id:6067,x:33824,y:33810,ptovrint:False,ptlb:outline width,ptin:_outlinewidth,varname:node_6067,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01,max:1;n:type:ShaderForge.SFN_Slider,id:1593,x:32798,y:33214,ptovrint:False,ptlb:node_1593,ptin:_node_1593,varname:node_1593,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:100;n:type:ShaderForge.SFN_Frac,id:4615,x:33339,y:33099,varname:node_4615,prsc:2|IN-1694-OUT;n:type:ShaderForge.SFN_RemapRange,id:699,x:33554,y:33099,varname:node_699,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-4615-OUT;n:type:ShaderForge.SFN_Length,id:6131,x:33732,y:33099,cmnt:圆点 程序纹理,varname:node_6131,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:6876,x:33347,y:33603,cmnt:投影,varname:node_6876,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:3798,x:33745,y:33470,cmnt:重新映射 反向,varname:node_3798,prsc:2,frmn:1,frmx:0,tomn:-0.5,tomx:2|IN-2753-OUT;n:type:ShaderForge.SFN_Power,id:2973,x:33903,y:33297,cmnt:黑色消失白色留着,varname:node_2973,prsc:2|VAL-6131-OUT,EXP-3798-OUT;n:type:ShaderForge.SFN_Round,id:9265,x:34097,y:33297,cmnt:非白即黑,varname:node_9265,prsc:2|IN-2973-OUT;proporder:7979-6067-1593;pass:END;sub:END;*/

Shader "AP01/L02/Halftone" {
    Properties {
        _outlinecolor ("outline color", Color) = (0,0,0,1)
        _outlinewidth ("outline width", Range(0, 1)) = 0.01
        _node_1593 ("node_1593", Range(1, 100)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _outlinecolor)
                UNITY_DEFINE_INSTANCED_PROP( float, _outlinewidth)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _outlinewidth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _outlinewidth );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_outlinewidth_var,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _outlinecolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _outlinecolor );
                return fixed4(_outlinecolor_var.rgb,0);
            }
            ENDCG
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_1593)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float _node_1593_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_1593 );
                float node_9265 = round(pow(length((frac((float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*_node_1593_var))*1.0+-0.5)),((dot(i.normalDir,lightDirection)*attenuation)*-2.5+2.0))); // 非白即黑
                float3 emissive = float3(node_9265,node_9265,node_9265);
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_1593)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
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
