Shader "Fog"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _FogStart("Fog StartPos", Float) = 1.0
        _FogEnd("Fog EndPos", Float) = 100.0
        _FogColor("Fog Color", Color) = (1,0,0,1)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float _FogStart;
            float _FogEnd;
            fixed4 _FogColor;
            sampler2D _MainTex;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float fogData : TEXCOORD1;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                // 计算物体到相机的距离。UnityObjectToViewPos：顶点到相机位置的向量；length():求向量的长度
                float z = length(UnityObjectToViewPos(v.vertex).xyz);
                // 计算雾化系数
                o.fogData = (_FogEnd - z) / (_FogEnd - _FogStart);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                // 插值得到雾化后的颜色
                return lerp(_FogColor, col, i.fogData);
                return col;
            }
            ENDCG
        }
    }
}