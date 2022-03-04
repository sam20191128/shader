// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34225,y:33721,varname:node_3138,prsc:2|emission-88-OUT,olwid-7249-OUT,olcol-7979-RGB;n:type:ShaderForge.SFN_Dot,id:4014,x:32253,y:32941,varname:node_4014,prsc:2,dt:0|A-5798-OUT,B-7053-OUT;n:type:ShaderForge.SFN_NormalVector,id:5798,x:32068,y:32838,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7053,x:32068,y:33035,varname:node_7053,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2753,x:32428,y:33000,varname:node_2753,prsc:2|A-4014-OUT,B-2148-OUT;n:type:ShaderForge.SFN_Vector1,id:2148,x:32253,y:33153,varname:node_2148,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:2464,x:32614,y:33110,cmnt:U,varname:node_2464,prsc:2|A-2753-OUT,B-2148-OUT;n:type:ShaderForge.SFN_Append,id:5324,x:32814,y:33159,varname:node_5324,prsc:2|A-2464-OUT,B-7982-OUT;n:type:ShaderForge.SFN_Vector1,id:7982,x:32614,y:33259,cmnt:V,varname:node_7982,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Tex2d,id:916,x:33024,y:33159,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_916,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c7d8acbc0409ba24a9d4a799b818cd5a,ntxv:0,isnm:False|UVIN-5324-OUT;n:type:ShaderForge.SFN_Color,id:7979,x:33850,y:34217,ptovrint:False,ptlb:outline color,ptin:_outlinecolor,varname:node_7979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_NormalVector,id:2801,x:32050,y:33547,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:2208,x:32050,y:33744,varname:node_2208,prsc:2;n:type:ShaderForge.SFN_Add,id:5878,x:32398,y:33361,varname:node_5878,prsc:2|A-9179-XYZ,B-2801-OUT;n:type:ShaderForge.SFN_Vector4Property,id:9179,x:32050,y:33345,ptovrint:False,ptlb:HighlightOffset1,ptin:_HighlightOffset1,varname:node_9179,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Vector4Property,id:1468,x:32050,y:33946,ptovrint:False,ptlb:HighlightOffset2,ptin:_HighlightOffset2,varname:_HighlightOffset2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:6708,x:32388,y:33940,varname:node_6708,prsc:2|A-1468-XYZ,B-2801-OUT;n:type:ShaderForge.SFN_Normalize,id:914,x:32621,y:33361,varname:node_914,prsc:2|IN-5878-OUT;n:type:ShaderForge.SFN_Dot,id:4354,x:32835,y:33361,varname:node_4354,prsc:2,dt:0|A-914-OUT,B-2208-OUT;n:type:ShaderForge.SFN_Normalize,id:772,x:32601,y:33938,varname:node_772,prsc:2|IN-6708-OUT;n:type:ShaderForge.SFN_Dot,id:4904,x:32804,y:33938,varname:node_4904,prsc:2,dt:0|A-772-OUT,B-2208-OUT;n:type:ShaderForge.SFN_If,id:3853,x:33133,y:33464,varname:node_3853,prsc:2|A-4354-OUT,B-3776-OUT,GT-9143-OUT,EQ-688-OUT,LT-688-OUT;n:type:ShaderForge.SFN_Slider,id:3776,x:32621,y:33561,ptovrint:False,ptlb:HightlightRange1,ptin:_HightlightRange1,varname:node_3776,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.6,cur:0.8,max:1;n:type:ShaderForge.SFN_If,id:9231,x:33134,y:33866,varname:node_9231,prsc:2|A-4904-OUT,B-1526-OUT,GT-9143-OUT,EQ-688-OUT,LT-688-OUT;n:type:ShaderForge.SFN_Slider,id:1526,x:32623,y:33843,ptovrint:False,ptlb:HightlightRange2,ptin:_HightlightRange2,varname:_HightlightRange2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.6,cur:0.8,max:1;n:type:ShaderForge.SFN_Vector1,id:9143,x:32760,y:33643,varname:node_9143,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:688,x:32760,y:33730,varname:node_688,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:8218,x:33321,y:33621,varname:node_8218,prsc:2|A-3853-OUT,B-9231-OUT;n:type:ShaderForge.SFN_Clamp01,id:2844,x:33501,y:33621,varname:node_2844,prsc:2|IN-8218-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:33715,y:33334,varname:node_6822,prsc:2|A-916-RGB,B-8356-RGB,T-2844-OUT;n:type:ShaderForge.SFN_Color,id:8356,x:33501,y:33436,ptovrint:False,ptlb:HightlightCol,ptin:_HightlightCol,varname:node_8356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.909804,c2:0.9333334,c3:0.7803922,c4:1;n:type:ShaderForge.SFN_Fresnel,id:3566,x:33518,y:33855,varname:node_3566,prsc:2|EXP-4696-OUT;n:type:ShaderForge.SFN_Vector1,id:4696,x:33321,y:33876,varname:node_4696,prsc:2,v1:3;n:type:ShaderForge.SFN_Color,id:1944,x:33518,y:34015,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:node_1944,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8282,x:33717,y:33909,varname:node_8282,prsc:2|A-3566-OUT,B-1944-RGB;n:type:ShaderForge.SFN_Blend,id:88,x:33944,y:33497,varname:node_88,prsc:2,blmd:6,clmp:True|SRC-6822-OUT,DST-8282-OUT;n:type:ShaderForge.SFN_Slider,id:7249,x:33736,y:34098,ptovrint:False,ptlb:outline width,ptin:_outlinewidth,varname:node_7249,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.02,max:1;proporder:916-7979-9179-1468-3776-1526-8356-1944-7249;pass:END;sub:END;*/

Shader "AP01/L02/HighLights" {
    Properties {
        _RampTex ("RampTex", 2D) = "white" {}
        _outlinecolor ("outline color", Color) = (0,0,0,1)
        _HighlightOffset1 ("HighlightOffset1", Vector) = (0,0,0,0)
        _HighlightOffset2 ("HighlightOffset2", Vector) = (0,0,0,0)
        _HightlightRange1 ("HightlightRange1", Range(0.6, 1)) = 0.8
        _HightlightRange2 ("HightlightRange2", Range(0.6, 1)) = 0.8
        _HightlightCol ("HightlightCol", Color) = (0.909804,0.9333334,0.7803922,1)
        _FresnelCol ("FresnelCol", Color) = (1,1,1,1)
        _outlinewidth ("outline width", Range(0, 1)) = 0.02
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset2)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HightlightCol)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_2148 = 0.5;
                float2 node_5324 = float2(((dot(i.normalDir,lightDirection)*node_2148)+node_2148),0.1);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_5324, _RampTex));
                float4 _HightlightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightCol );
                float4 _HighlightOffset1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighlightOffset1 );
                float _HightlightRange1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightRange1 );
                float node_3853_if_leA = step(dot(normalize((_HighlightOffset1_var.rgb+i.normalDir)),lightDirection),_HightlightRange1_var);
                float node_3853_if_leB = step(_HightlightRange1_var,dot(normalize((_HighlightOffset1_var.rgb+i.normalDir)),lightDirection));
                float node_688 = 0.0;
                float node_9143 = 1.0;
                float4 _HighlightOffset2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighlightOffset2 );
                float _HightlightRange2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightRange2 );
                float node_9231_if_leA = step(dot(normalize((_HighlightOffset2_var.rgb+i.normalDir)),lightDirection),_HightlightRange2_var);
                float node_9231_if_leB = step(_HightlightRange2_var,dot(normalize((_HighlightOffset2_var.rgb+i.normalDir)),lightDirection));
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float3 emissive = saturate((1.0-(1.0-lerp(_RampTex_var.rgb,_HightlightCol_var.rgb,saturate(max(lerp((node_3853_if_leA*node_688)+(node_3853_if_leB*node_9143),node_688,node_3853_if_leA*node_3853_if_leB),lerp((node_9231_if_leA*node_688)+(node_9231_if_leB*node_9143),node_688,node_9231_if_leA*node_9231_if_leB)))))*(1.0-(pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)*_FresnelCol_var.rgb))));
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset2)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HightlightCol)
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
