Shader "Grass"
{
    Properties
    {
        _Color ("Main Color", Color) = (0.5,0.5,0.5,1)
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Ramp ("Toon Ramp (RGB)", 2D) = "gray" {}
        _Speed ("MoveSpeed", Range(20,50)) = 25 //摇摆的速度
        _Rigidness("Rigidness", Range(1,50)) = 25 //较低使它看起来更“液体”较高使它看起来很刚性
        _SwayMax("Sway Max", Range(0, 0.1)) = .005 //摇摆的距离
        _YOffset("Y offset", float) = 0.0 //y偏移，在此以下是没有动画
        _MaxWidth("Max Displacement Width", Range(0, 2)) = 0.1 //溶解线的宽度
        _Radius("Radius", Range(0,5)) = 1 //溶解线的宽度
    }

    SubShader
    {
        Tags
        {
            "RenderType"="Opaque" "DisableBatching" = "True" //禁用批处理使我们能够保留对象空间
        }
        LOD 200
        Blend SrcAlpha OneMinusSrcAlpha

        CGPROGRAM
        #pragma surface surf ToonRamp vertex:vert addshadow keepalpha //在顶点动画后应用阴影

        sampler2D _Ramp;

        //使用基于纹理渐变的自定义照明功能
        //光线方向与法线之间的角度
        #pragma lighting ToonRamp exclude_path:prepass
        inline half4 LightingToonRamp(SurfaceOutput s, half3 lightDir, half atten)
        {
            #ifndef USING_DIRECTIONAL_LIGHT
            lightDir = normalize(lightDir);
            #endif

            half d = dot(s.Normal, lightDir) * 0.5 + 0.5;
            half3 ramp = tex2D(_Ramp, float2(d, d)).rgb;

            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * ramp * (atten * 2);
            c.a = s.Alpha;
            return c;
        }

        uniform sampler2D _MainTex;
        uniform float4 _Color;
        uniform float _Radius;

        uniform float _Speed;
        uniform float _SwayMax;
        uniform float _YOffset;
        uniform float _Rigidness;
        uniform float _MaxWidth;

        uniform float _PositionArray; //几个物体
        uniform float3 _Positions[100]; //每个物体的位置

        struct Input
        {
            float2 uv_MainTex : TEXCOORD0;
        };

        void vert(inout appdata_full v) //
        {
            //基本摇摆运动
            float3 wpos = mul(unity_ObjectToWorld, v.vertex).xyz; // world position 世界位置
            float x = sin(wpos.x / _Rigidness + (_Time.x * _Speed)) * (v.vertex.y - _YOffset) * 5; // x axis movements x轴运动
            float z = sin(wpos.z / _Rigidness + (_Time.x * _Speed)) * (v.vertex.y - _YOffset) * 5; // z axis movements z轴运动
            v.vertex.x += (step(0, v.vertex.y - _YOffset) * x * _SwayMax); // apply the movement if the vertex's y above the YOffset 如果顶点的y高于YOffset，则应用移动
            v.vertex.z += (step(0, v.vertex.y - _YOffset) * z * _SwayMax);

            //数组中每个位置的相互作用半径移动
            for (int i = 0; i < _PositionArray; i++)
            {
                float3 dis = distance(_Positions[i], wpos); // distance for radius 半径距离
                float3 radius = 1 - saturate(dis / _Radius); // in world radius based on objects interaction radius 根据对象交互半径在世界半径中
                float3 sphereDisp = wpos - _Positions[i]; // position comparison 位置比较
                sphereDisp *= radius; // position multiplied by radius for falloff 位置乘以半径以衰减
                //v.vertex.xz += clamp(sphereDisp.xz * step(_YOffset, v.vertex.y), -_MaxWidth,_MaxWidth);// vertex movement based on falloff and clamped 基于衰减和钳位的顶点运动
                v.vertex.xzy += sphereDisp.xzy * v.vertex.y;
            }
        }

        void surf(Input IN, inout SurfaceOutput o)
        {
            half4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    Fallback "Diffuse"
}