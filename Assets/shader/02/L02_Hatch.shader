// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34200,y:33152,varname:node_3138,prsc:2|emission-8028-OUT,olwid-6067-OUT,olcol-7979-RGB;n:type:ShaderForge.SFN_Dot,id:4014,x:33347,y:33390,varname:node_4014,prsc:2,dt:0|A-5798-OUT,B-7053-OUT;n:type:ShaderForge.SFN_NormalVector,id:5798,x:33142,y:33319,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7053,x:33142,y:33505,varname:node_7053,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2753,x:33558,y:33470,varname:node_2753,prsc:2|A-4014-OUT,B-6852-RGB;n:type:ShaderForge.SFN_Color,id:7979,x:33895,y:33636,ptovrint:False,ptlb:outline color,ptin:_outlinecolor,varname:node_7979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:6852,x:33347,y:33601,ptovrint:False,ptlb:multiply color,ptin:_multiplycolor,varname:node_6852,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2039216,c2:0.5960785,c3:0.3254902,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:6721,x:32955,y:33021,varname:node_6721,prsc:2,sctp:1;n:type:ShaderForge.SFN_Depth,id:6376,x:32955,y:33163,varname:node_6376,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1694,x:33142,y:33099,varname:node_1694,prsc:2|A-6721-UVOUT,B-6376-OUT;n:type:ShaderForge.SFN_Tex2d,id:3105,x:33326,y:33099,ptovrint:False,ptlb:patterrn,ptin:_patterrn,cmnt:排线 输出单通道即可,varname:node_3105,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:652f741431490d343a08552b1f1fd109,ntxv:3,isnm:False|UVIN-1694-OUT;n:type:ShaderForge.SFN_Step,id:6051,x:33558,y:33239,cmnt:阴影线,varname:node_6051,prsc:2|A-3105-R,B-4014-OUT;n:type:ShaderForge.SFN_Add,id:8028,x:33977,y:33190,varname:node_8028,prsc:2|A-8696-OUT,B-2753-OUT;n:type:ShaderForge.SFN_Color,id:8464,x:33558,y:32849,ptovrint:False,ptlb:dark,ptin:_dark,varname:node_8464,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1490196,c2:0.3490196,c3:0.3686275,c4:1;n:type:ShaderForge.SFN_Color,id:1976,x:33558,y:33050,ptovrint:False,ptlb:light,ptin:_light,varname:_node_8464_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8784314,c2:0.8784314,c3:0.8784314,c4:1;n:type:ShaderForge.SFN_Lerp,id:8696,x:33779,y:32985,varname:node_8696,prsc:2|A-8464-RGB,B-1976-RGB,T-6051-OUT;n:type:ShaderForge.SFN_Slider,id:6067,x:33798,y:33509,ptovrint:False,ptlb:outline width,ptin:_outlinewidth,varname:node_6067,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01,max:1;proporder:7979-3105-6852-8464-1976-6067;pass:END;sub:END;*/

Shader "AP01/L02/Hatch" {
    Properties {
        _outlinecolor ("outline color", Color) = (0,0,0,1)
        _patterrn ("patterrn", 2D) = "bump" {}
        _multiplycolor ("multiply color", Color) = (0.2039216,0.5960785,0.3254902,1)
        _dark ("dark", Color) = (0.1490196,0.3490196,0.3686275,1)
        _light ("light", Color) = (0.8784314,0.8784314,0.8784314,1)
        _outlinewidth ("outline width", Range(0, 1)) = 0.01
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _patterrn; uniform float4 _patterrn_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _multiplycolor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _dark)
                UNITY_DEFINE_INSTANCED_PROP( float4, _light)
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
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _dark_var = UNITY_ACCESS_INSTANCED_PROP( Props, _dark );
                float4 _light_var = UNITY_ACCESS_INSTANCED_PROP( Props, _light );
                float2 node_1694 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*partZ);
                float4 _patterrn_var = tex2D(_patterrn,TRANSFORM_TEX(node_1694, _patterrn)); // 排线 输出单通道即可
                float node_4014 = dot(i.normalDir,lightDirection);
                float4 _multiplycolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _multiplycolor );
                float3 emissive = (lerp(_dark_var.rgb,_light_var.rgb,step(_patterrn_var.r,node_4014))+(node_4014*_multiplycolor_var.rgb));
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
            uniform sampler2D _patterrn; uniform float4 _patterrn_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _multiplycolor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _dark)
                UNITY_DEFINE_INSTANCED_PROP( float4, _light)
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
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
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
