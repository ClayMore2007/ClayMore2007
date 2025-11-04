Shader "Custom/EyeLensDDXRefraction"
{
    Properties
    {
        _MainTex ("Background Texture", 2D) = "white" {}
        _RefractionStrength ("Refraction Strength", Range(0, 0.1)) = 0.02
        _ChromaticDispersion ("Chromatic Dispersion", Range(0, 0.05)) = 0.01
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _RefractionStrength;
            float _ChromaticDispersion;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // 使用 DDX/DDY 计算屏幕空间偏导数
                float2 dx = ddx(i.uv);
                float2 dy = ddy(i.uv);

                // 构造视差偏移方向（模拟晶体曲率）
                float2 offsetDir = normalize(dx + dy);
                float2 offset = offsetDir * _RefractionStrength;

                // 色散处理：RGB通道略微偏移
                float3 refractedColor;
                refractedColor.r = tex2D(_MainTex, i.uv + offset * (1.0 + _ChromaticDispersion)).r;
                refractedColor.g = tex2D(_MainTex, i.uv + offset).g;
                refractedColor.b = tex2D(_MainTex, i.uv + offset * (1.0 - _ChromaticDispersion)).b;

                return float4(refractedColor, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Transparent"
}

