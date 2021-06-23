//PCF

//

float shadow = 0;
float textureSize = 1.0/512*dither;

for(int x = -1; x<=1; ++x)
{
    for(int y = -1; y<=1; ++y)
    {
        float pcfDepth = Texture2DSample(shadowDepth,shadowDepthSampler,sampleCoord.xy + float2(x,y)*textureSize).r /1000;
        //float pcfDepth = shadowDepth.SampleLevel(shadowDepthSampler, 0, 0).r /1000;
        
        shadow += (shadoww - 0.001) > pcfDepth ? 0.0 : 1.0 ;

    }
}

shadow /= 9.0;
return shadow;