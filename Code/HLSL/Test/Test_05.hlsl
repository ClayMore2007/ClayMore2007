float4 main(in float2 uv:TEXCOORD):SV_TARGET
{
    float3 x=(0.2,0.2,0.2);
    return float4 (x,1.0);
}