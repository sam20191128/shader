// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34179,y:33025,varname:node_3138,prsc:2|emission-546-OUT;n:type:ShaderForge.SFN_LightVector,id:7911,x:32407,y:32368,varname:node_7911,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1112,x:32621,y:32389,varname:node_1112,prsc:2|A-7911-OUT,B-2435-OUT;n:type:ShaderForge.SFN_Vector1,id:2435,x:32407,y:32526,varname:node_2435,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:5858,x:32811,y:32468,cmnt:rDir,varname:node_5858,prsc:2|A-1112-OUT,B-945-OUT;n:type:ShaderForge.SFN_NormalVector,id:945,x:32621,y:32548,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:4702,x:32811,y:32645,varname:node_4702,prsc:2;n:type:ShaderForge.SFN_Dot,id:5279,x:33015,y:32550,cmnt:r dot v,varname:node_5279,prsc:2,dt:0|A-5858-OUT,B-4702-OUT;n:type:ShaderForge.SFN_Max,id:5651,x:33211,y:32607,varname:node_5651,prsc:2|A-5279-OUT,B-4607-OUT;n:type:ShaderForge.SFN_Vector1,id:4607,x:33015,y:32717,varname:node_4607,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:2606,x:33400,y:32607,varname:node_2606,prsc:2|VAL-5651-OUT,EXP-3146-OUT;n:type:ShaderForge.SFN_Fresnel,id:3659,x:32935,y:32954,varname:node_3659,prsc:2;n:type:ShaderForge.SFN_Power,id:1055,x:33161,y:33067,varname:node_1055,prsc:2|VAL-3659-OUT,EXP-9429-OUT;n:type:ShaderForge.SFN_Slider,id:6012,x:32589,y:33137,ptovrint:False,ptlb:Fresnal Range,ptin:_FresnalRange,varname:node_6012,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;n:type:ShaderForge.SFN_Exp,id:9429,x:32935,y:33138,varname:node_9429,prsc:2,et:0|IN-6012-OUT;n:type:ShaderForge.SFN_Multiply,id:2398,x:33425,y:33161,varname:node_2398,prsc:2|A-1055-OUT,B-4252-OUT;n:type:ShaderForge.SFN_Add,id:3519,x:33678,y:32923,cmnt:高光,varname:node_3519,prsc:2|A-2606-OUT,B-2398-OUT;n:type:ShaderForge.SFN_Multiply,id:4252,x:33161,y:33307,varname:node_4252,prsc:2|A-1541-OUT,B-4958-RGB;n:type:ShaderForge.SFN_Vector1,id:1541,x:32935,y:33325,varname:node_1541,prsc:2,v1:0.5;n:type:ShaderForge.SFN_NormalVector,id:3136,x:32524,y:33379,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:6163,x:32524,y:33544,varname:node_6163,prsc:2;n:type:ShaderForge.SFN_Dot,id:377,x:32734,y:33455,varname:node_377,prsc:2,dt:0|A-3136-OUT,B-6163-OUT;n:type:ShaderForge.SFN_Max,id:3847,x:32935,y:33455,varname:node_3847,prsc:2|A-377-OUT,B-2513-OUT;n:type:ShaderForge.SFN_Vector1,id:2513,x:32734,y:33618,varname:node_2513,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:1686,x:33696,y:33454,cmnt:Lambert,varname:node_1686,prsc:2|A-3847-OUT,B-3263-OUT;n:type:ShaderForge.SFN_Add,id:546,x:33915,y:33127,varname:node_546,prsc:2|A-3519-OUT,B-1686-OUT;n:type:ShaderForge.SFN_Color,id:4958,x:32935,y:33646,ptovrint:False,ptlb:Color(Smooth),ptin:_ColorSmooth,varname:node_4958,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1490196,c2:0.8509805,c3:0.4313726,c4:1;n:type:ShaderForge.SFN_Color,id:2947,x:32935,y:33835,ptovrint:False,ptlb:Color(Rough),ptin:_ColorRough,varname:_node_4958_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.482353,c2:0.1607843,c3:0.0627451,c4:1;n:type:ShaderForge.SFN_Lerp,id:3263,x:33287,y:33736,varname:node_3263,prsc:2|A-4958-RGB,B-2947-RGB,T-632-OUT;n:type:ShaderForge.SFN_TexCoord,id:3734,x:32026,y:34008,varname:node_3734,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_UVTile,id:1502,x:32262,y:34008,varname:node_1502,prsc:2|UVIN-3734-UVOUT,WDT-7770-OUT,HGT-7770-OUT,TILE-7591-OUT;n:type:ShaderForge.SFN_Vector1,id:7591,x:32026,y:34159,varname:node_7591,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:7770,x:32026,y:34259,ptovrint:False,ptlb:Mask Tile,ptin:_MaskTile,varname:node_7770,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Tex2d,id:1497,x:32543,y:34008,ptovrint:False,ptlb:Mask Map,ptin:_MaskMap,varname:node_1497,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:98d9c167879add84090f7fc0f852cd18,ntxv:0,isnm:False|UVIN-1502-UVOUT;n:type:ShaderForge.SFN_Step,id:4066,x:32785,y:34008,varname:node_4066,prsc:2|A-1497-RGB,B-5510-OUT;n:type:ShaderForge.SFN_Slider,id:5510,x:32410,y:34254,ptovrint:False,ptlb:Mask Range,ptin:_MaskRange,varname:node_5510,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4,max:1;n:type:ShaderForge.SFN_Desaturate,id:632,x:32998,y:34008,varname:node_632,prsc:2|COL-4066-OUT;n:type:ShaderForge.SFN_Lerp,id:3146,x:33282,y:34138,varname:node_3146,prsc:2|A-3381-OUT,B-6779-OUT,T-632-OUT;n:type:ShaderForge.SFN_Slider,id:3381,x:32895,y:34196,ptovrint:False,ptlb:SpecPow1,ptin:_SpecPow1,varname:node_3381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:100;n:type:ShaderForge.SFN_Slider,id:6779,x:32895,y:34309,ptovrint:False,ptlb:SpecPow2,ptin:_SpecPow2,varname:node_6779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:100;proporder:4958-2947-1497-5510-7770-6012-3381-6779;pass:END;sub:END;*/

Shader "AP01/L06/Rust" {
    Properties {
        _ColorSmooth ("Color(Smooth)", Color) = (0.1490196,0.8509805,0.4313726,1)
        _ColorRough ("Color(Rough)", Color) = (0.482353,0.1607843,0.0627451,1)
        _MaskMap ("Mask Map", 2D) = "white" {}
        _MaskRange ("Mask Range", Range(0, 1)) = 0.4
        _MaskTile ("Mask Tile", Range(0, 1)) = 0.3
        _FresnalRange ("Fresnal Range", Range(0, 10)) = 10
        _SpecPow1 ("SpecPow1", Range(0, 100)) = 1
        _SpecPow2 ("SpecPow2", Range(0, 100)) = 10
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
            uniform sampler2D _MaskMap; uniform float4 _MaskMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnalRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorSmooth)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorRough)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskTile)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow2)
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
////// Lighting:
////// Emissive:
                float _SpecPow1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow1 );
                float _SpecPow2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow2 );
                float _MaskTile_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskTile );
                float node_7591 = 1.0;
                float2 node_1502_tc_rcp = float2(1.0,1.0)/float2( _MaskTile_var, _MaskTile_var );
                float node_1502_ty = floor(node_7591 * node_1502_tc_rcp.x);
                float node_1502_tx = node_7591 - _MaskTile_var * node_1502_ty;
                float2 node_1502 = (i.uv0 + float2(node_1502_tx, node_1502_ty)) * node_1502_tc_rcp;
                float4 _MaskMap_var = tex2D(_MaskMap,TRANSFORM_TEX(node_1502, _MaskMap));
                float _MaskRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskRange );
                float node_632 = dot(step(_MaskMap_var.rgb,_MaskRange_var),float3(0.3,0.59,0.11));
                float _FresnalRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnalRange );
                float4 _ColorSmooth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorSmooth );
                float4 _ColorRough_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorRough );
                float3 emissive = ((pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),lerp(_SpecPow1_var,_SpecPow2_var,node_632))+(pow((1.0-max(0,dot(normalDirection, viewDirection))),exp(_FresnalRange_var))*(0.5*_ColorSmooth_var.rgb)))+(max(dot(i.normalDir,lightDirection),0.0)*lerp(_ColorSmooth_var.rgb,_ColorRough_var.rgb,node_632)));
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
            uniform sampler2D _MaskMap; uniform float4 _MaskMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnalRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorSmooth)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorRough)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskTile)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow2)
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
