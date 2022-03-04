// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "liangzi"
{
	Properties
	{
		_AIpha("AIpha", Range( 0 , 1)) = 1
		_ScreenTexTlingOffset("ScreenTexTlingOffset", Vector) = (1,1,0,0)
		_ScreenTex("ScreenTex", 2D) = "white" {}
		_ScreenColor("ScreenColor", Color) = (0.1084906,0.3161126,1,0)
		_Panner("Panner", Vector) = (0,0,1,1)
		_FresnelMask("FresnelMask", Vector) = (1,5,1,0)
		_OutlineFresnel("OutlineFresnel", Vector) = (1,5,1,0)
		_AldeboColor("AldeboColor", Color) = (0,0,0,0)
		_AlphaAdd("AlphaAdd", Float) = 0.25
		_Fresnel1_Power("Fresnel1_Power", Float) = 0
		_Fresnel1_Mul("Fresnel1_Mul", Float) = 0
		_OutLineColor("OutLineColor", Color) = (0,0,0,0)
		_OutLineFresnelScale("OutLineFresnelScale", Float) = 0
		_VertexPosMaskColor("VertexPosMaskColor", Color) = (0,0,0,0)
		_VertexPosXYZ_Scale("VertexPosXYZ_ Scale", Vector) = (0,1,0,0)
		_VertexPosOffset("VertexPosOffset", Float) = 0
		_VertexPosMaskSmooth("VertexPosMaskSmooth", Vector) = (-0.8,-1,1,5)

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform sampler2D _ScreenTex;
			uniform float4 _Panner;
			uniform float4 _ScreenTexTlingOffset;
			uniform float4 _ScreenColor;
			uniform float4 _AldeboColor;
			uniform float4 _FresnelMask;
			uniform float4 _OutlineFresnel;
			uniform float4 _OutLineColor;
			uniform float _OutLineFresnelScale;
			uniform float4 _VertexPosMaskSmooth;
			uniform float4 _VertexPosMaskColor;
			uniform float4 _VertexPosXYZ_Scale;
			uniform float _VertexPosOffset;
			uniform float _AIpha;
			uniform float _Fresnel1_Power;
			uniform float _Fresnel1_Mul;
			uniform float _AlphaAdd;
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float mulTime15 = _Time.y * _Panner.z;
				float2 appendResult16 = (float2(_Panner.x , _Panner.y));
				float4 screenPos = i.ase_texcoord1;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 appendResult7 = (float4(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g , 0.0 , 0.0));
				float2 appendResult11 = (float2(_ScreenTexTlingOffset.x , _ScreenTexTlingOffset.y));
				float2 appendResult12 = (float2(_ScreenTexTlingOffset.z , _ScreenTexTlingOffset.w));
				float2 panner13 = ( mulTime15 * appendResult16 + (appendResult7*float4( appendResult11, 0.0 , 0.0 ) + float4( appendResult12, 0.0 , 0.0 )).xy);
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float fresnelNdotV17 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode17 = ( 0.0 + _FresnelMask.x * pow( 1.0 - fresnelNdotV17, _FresnelMask.y ) );
				float temp_output_20_0 = saturate( ( fresnelNode17 * _FresnelMask.z ) );
				float4 lerpResult22 = lerp( ( tex2D( _ScreenTex, panner13 ).r * _ScreenColor * _Panner.w ) , _AldeboColor , temp_output_20_0);
				float fresnelNdotV37 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode37 = ( 0.0 + _OutlineFresnel.x * pow( 1.0 - fresnelNdotV37, _OutlineFresnel.y ) );
				float smoothstepResult38 = smoothstep( _OutlineFresnel.z , _OutlineFresnel.w , fresnelNode37);
				float fresnelNdotV54 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode54 = ( 0.0 + _VertexPosMaskSmooth.z * pow( 1.0 - fresnelNdotV54, _VertexPosMaskSmooth.w ) );
				float smoothstepResult46 = smoothstep( _VertexPosMaskSmooth.x , _VertexPosMaskSmooth.y , ( ( ( _VertexPosXYZ_Scale.x * i.ase_normal.x ) + ( _VertexPosXYZ_Scale.y * i.ase_normal.y ) + ( _VertexPosXYZ_Scale.z * i.ase_normal.z ) ) + _VertexPosOffset ));
				float dotResult28 = dot( ase_worldNormal , ase_worldViewDir );
				float4 appendResult4 = (float4(( lerpResult22 + ( saturate( smoothstepResult38 ) * _OutLineColor * _OutLineFresnelScale ) + ( fresnelNode54 * _VertexPosMaskColor * saturate( smoothstepResult46 ) ) ).rgb , saturate( ( _AIpha * ( ( temp_output_20_0 + ( pow( dotResult28 , _Fresnel1_Power ) * _Fresnel1_Mul ) ) + _AlphaAdd ) ) )));
				
				
				finalColor = appendResult4;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18900
2560;7;2560;1379;694.2859;477.1147;1;True;True
Node;AmplifyShaderEditor.NormalVertexDataNode;44;-896.6945,-467.3109;Inherit;True;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;10;-1796.52,249.6279;Inherit;False;Property;_ScreenTexTlingOffset;ScreenTexTlingOffset;1;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;6;-1757.669,-24.95577;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;52;-878.7572,-717.1954;Inherit;False;Property;_VertexPosXYZ_Scale;VertexPosXYZ_ Scale;14;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;29;-1849.566,1330.816;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;27;-1870.479,1138.574;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;19;-1836.754,847.7944;Inherit;False;Property;_FresnelMask;FresnelMask;5;0;Create;True;0;0;0;False;0;False;1,5,1,0;1.49,2.67,1.3,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;32;-1568.067,1401.772;Inherit;False;Property;_Fresnel1_Power;Fresnel1_Power;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;14;-1305.814,453.5039;Inherit;False;Property;_Panner;Panner;4;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0.16,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;28;-1585.336,1169.817;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;17;-1554.265,706.6357;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-569.4861,-739.3668;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;12;-1491.108,365.3816;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-570.2943,-494.9934;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;7;-1486.042,1.082537;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-569.1107,-618.775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;11;-1493.897,228.4051;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;15;-1100.273,419.6007;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;16;-1092.59,275.4927;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1228.408,1452.954;Inherit;False;Property;_Fresnel1_Mul;Fresnel1_Mul;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;9;-1264.282,84.01151;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;1,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;30;-1288.895,1173.782;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-1153.964,901.2728;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-540.7845,-363.0051;Inherit;False;Property;_VertexPosOffset;VertexPosOffset;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;36;-1610.104,1785.168;Inherit;False;Property;_OutlineFresnel;OutlineFresnel;6;0;Create;True;0;0;0;False;0;False;1,5,1,0;1,5,1,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;53;-380.7573,-642.1954;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;20;-968.4329,844.5038;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;13;-862.9598,117.9073;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-204.8881,-532.0531;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-966.6841,1185.414;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;37;-1323.929,1628.205;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;47;-213.8881,-303.0532;Inherit;False;Property;_VertexPosMaskSmooth;VertexPosMaskSmooth;16;0;Create;True;0;0;0;False;0;False;-0.8,-1,1,5;-0.23,-1.02,3.72,2.46;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-581.5,-114.5;Inherit;False;Property;_ScreenColor;ScreenColor;3;0;Create;True;0;0;0;False;0;False;0.1084906,0.3161126,1,0;0.1084906,0.3161126,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-607.8375,1212.308;Inherit;False;Property;_AlphaAdd;AlphaAdd;8;0;Create;True;0;0;0;False;0;False;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;38;-959.8467,1832.806;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-709.8497,933.1409;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-644.5,83.5;Inherit;True;Property;_ScreenTex;ScreenTex;2;0;Create;True;0;0;0;False;0;False;-1;None;b488ec8f54734794080457e9e24ce887;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;46;102.1121,-423.0532;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-650.7084,2287.051;Inherit;False;Property;_OutLineFresnelScale;OutLineFresnelScale;12;0;Create;True;0;0;0;False;0;False;0;4.04;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;21;-364.9118,375.9909;Inherit;False;Property;_AldeboColor;AldeboColor;7;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;57;426.1997,-421.0785;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-365.8493,1192.57;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-204.8197,94.74862;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;41;-651.1849,2085.613;Inherit;False;Property;_OutLineColor;OutLineColor;11;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-364.5011,960.9611;Float;False;Property;_AIpha;AIpha;0;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;39;-633.2831,1826.729;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;56;130.3713,44.37223;Inherit;False;Property;_VertexPosMaskColor;VertexPosMaskColor;13;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;54;106.1649,-152.1613;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-33.33089,1102.577;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;22;5.112262,370.1251;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;639.7318,-97.79762;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-316.565,1934.139;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;897.6829,498.4307;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;26;214.7989,1036.439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;1241.051,507.7332;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;1850.952,648.4861;Float;False;True;-1;2;ASEMaterialInspector;100;1;liangzi;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;28;0;27;0
WireConnection;28;1;29;0
WireConnection;17;2;19;1
WireConnection;17;3;19;2
WireConnection;49;0;52;1
WireConnection;49;1;44;1
WireConnection;12;0;10;3
WireConnection;12;1;10;4
WireConnection;51;0;52;3
WireConnection;51;1;44;3
WireConnection;7;0;6;1
WireConnection;7;1;6;2
WireConnection;50;0;52;2
WireConnection;50;1;44;2
WireConnection;11;0;10;1
WireConnection;11;1;10;2
WireConnection;15;0;14;3
WireConnection;16;0;14;1
WireConnection;16;1;14;2
WireConnection;9;0;7;0
WireConnection;9;1;11;0
WireConnection;9;2;12;0
WireConnection;30;0;28;0
WireConnection;30;1;32;0
WireConnection;18;0;17;0
WireConnection;18;1;19;3
WireConnection;53;0;49;0
WireConnection;53;1;50;0
WireConnection;53;2;51;0
WireConnection;20;0;18;0
WireConnection;13;0;9;0
WireConnection;13;2;16;0
WireConnection;13;1;15;0
WireConnection;45;0;53;0
WireConnection;45;1;48;0
WireConnection;31;0;30;0
WireConnection;31;1;33;0
WireConnection;37;2;36;1
WireConnection;37;3;36;2
WireConnection;38;0;37;0
WireConnection;38;1;36;3
WireConnection;38;2;36;4
WireConnection;34;0;20;0
WireConnection;34;1;31;0
WireConnection;1;1;13;0
WireConnection;46;0;45;0
WireConnection;46;1;47;1
WireConnection;46;2;47;2
WireConnection;57;0;46;0
WireConnection;24;0;34;0
WireConnection;24;1;25;0
WireConnection;2;0;1;1
WireConnection;2;1;3;0
WireConnection;2;2;14;4
WireConnection;39;0;38;0
WireConnection;54;2;47;3
WireConnection;54;3;47;4
WireConnection;23;0;5;0
WireConnection;23;1;24;0
WireConnection;22;0;2;0
WireConnection;22;1;21;0
WireConnection;22;2;20;0
WireConnection;55;0;54;0
WireConnection;55;1;56;0
WireConnection;55;2;57;0
WireConnection;40;0;39;0
WireConnection;40;1;41;0
WireConnection;40;2;42;0
WireConnection;43;0;22;0
WireConnection;43;1;40;0
WireConnection;43;2;55;0
WireConnection;26;0;23;0
WireConnection;4;0;43;0
WireConnection;4;3;26;0
WireConnection;0;0;4;0
ASEEND*/
//CHKSM=5B2FA8CE1C8D0004D68C53A4F5D749CCDED4E012