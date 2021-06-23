float iTime;
float2 iMouse;

float random(float2 uv)
{
    // return frac(sin(dot(uv,float2(12.9898,78.233)))*43758.5453213);
    return frac(sin(dot(uv,float2(12.9898,78.2333)))*100000);
}
    


float4 main(float2 st:TEXCOORD0):SV_TARGET
{

    // float a = 1;
    float2 uv = st;
    uv *= 10;
    uv = floor(uv);
    
    float rnd = random(uv);
    float3 color0 = float3(rnd,rnd,rnd);

    return float4(color0,1);
}