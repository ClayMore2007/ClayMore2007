
float iTime;


float random(float2 st)
{
    // return frac(sin(dot(uv,float2(12.9898,78.233)))*43758.5453213);
    return frac(sin(dot(st,float2(12.9898,78.2333)))*43758.5453123);
}
    

float noise(float2 st)
{

    float2 i = ceil(st);
    float2 f = frac(st);

    float a = random(i);
    float b = random(i + float2(0,1));
    float c = random(i + float2(1,0));
    float d = random(i + float2(1,1));
    
    float2 u = f*f*(3-2*f); 

    return lerp(a,b,u.x)+
            (c-a)*u.y*(1-u.x)+
            (d-b)*u.x*u.y;
}

float4 main(float2 st:TEXCOORD0):SV_TARGET
{
    float2 uv = st;
    float a = noise(uv);
    return float4(a,a,a,1);
}