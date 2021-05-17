float box(  float2 st, float2 size, float smoothEdges)
{
    size = 0.5 - size * 0.5;
    float2 aa = float2(smoothEdges * 0.5,smoothEdges * 0.5);
    float2 uv = smoothstep(size,size+aa,st);
    uv *= smoothstep(size,size+aa,float2(1,1)-st);
    return uv.x*uv.y;
}

float2x2 rotate(float angle )
{
    return float2x2(
        cos(angle),-sin(angle),
        sin(angle),cos(angle)
    );
}

float2x2 scale(float2 scale)
{
    return float2x2(
        scale.x,0.0,
        0.0,scale.y
    );
}

float iTime;

float4 main(float2 uv:TEXCOORD0):SV_TARGET
{


    float2 aa = float2 (0.5,0.5);
    float bb = 0.01;
    uv -= float2(0.5,0.5);
    float2x2 Irotate = rotate(sin(iTime*0.01)*3.14);
    float2x2 Iscale = scale(sin(iTime*.01));
    uv = mul(Irotate,uv);
    uv = mul(Iscale,uv);
    uv += float2(0.5,0.5);

    float a = box(uv,aa,bb);

    float3 color0 = float3 (0.2,0.2,0.2);
    float3 color1 = float3 (0.3,0.3,0.3);
    float3 finalColor = lerp(color0,color1,a);

    return float4(finalColor,1);
}