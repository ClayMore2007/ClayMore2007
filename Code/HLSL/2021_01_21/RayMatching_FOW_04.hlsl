struct Fow
{
    //Input float3 WorldPosition
    //Input float3 CameraPosition
    //Input float3 CameraToWordPositionDir
    //Input float InStepCount
    //Input float InPerStepSize

    //Input Texture FowTexture
    //Input Texture LastFowTexture
    //Input Texture PTexture

    //Input float3 FowCenter                    //FowTextureDes Center
    //Input float3 FowHalfSize

    //Input float3 FogBoxCenter                 //FogBoxCenter
    //Input float3 FogBoxHalfSize               //FogBoxHalfSize

    //Input float PFogDensity
    //Input float FogDensityPerSample

    //Input float BlendAlpha
    float GetFogDensity()
    {
        int StepCount = (int)InStepCount;
        float PerStepLength = InPerStepSize;

        float TotalFogDensity = 0;
        
        

        float3 IntersectPosition = ComputeRayIntersectPosition(CameraPosition, CameraToWordPositionDir);

        float DepthViewlinear = dot((WorldPosition - IntersectPosition),CameraToWordPositionDir);

        int MaxStep = (int)(DepthViewlinear/PerStepLength);

        for(int i = 0; i < StepCount; ++i)
        {
            float3 CheckPoint = IntersectPosition + CameraToWordPositionDir * i * PerStepLength;
            bool bIn = ComputeWorldPositionInCloudBox(CheckPoint);
            float3 NormalizeUVW = ComputeUVWIntargetPosition(CheckPoint);
            float FogComtribution = ComputeFogDensityFromNormalizeUVW(NormalizeUVW);

            FogComtribution = i > MaxStep ? 0 : FogComtribution;

            TotalFogDensity += bIn ? FogComtribution : 0;
        }
        
        return TotalFogDensity;
    }

    // bool IsInBox(float3 WorldPosition)
    // {
    //     float3 UVW = (WorldPosition - FowCenter)/FowHalfSize;
    //     float3 NormalizeUVW = (UVW + 1)/2;
    //     float3 absUVW = abs(UVW);

    //     float maxvalue = max(absUVW.x, absUVW.y);
    //     maxvalue = max(absUVW.z, maxvalue);
        
    //     if(maxvalue <= 1)
    //     {
    //         return true;
    //     }
    //     return false;
    // }

    float3 ComputeRayIntersectPosition(float3 CameraPosition, float3 CameraToPosDir)
    {
        float TargetLength = 1000000;
        float3 RayOrigin = CameraPosition;
        float3 RayEnd = RayOrigin + CameraToPosDir * TargetLength;

        float3 BoxMin = FogBoxCenter - FogBoxHalfSize;
        float3 BoxMax = FogBoxCenter + FogBoxHalfSize;

        float2 Intersect = LineBoxIntersect(RayOrigin, RayEnd, BoxMin, BoxMax);

        float3 IntersectPosition = RayOrigin + (RayEnd - RayOrigin) * Intersect.x;
        return IntersectPosition;
    }

    bool ComputeWorldPositionInCloudBox(float3 WorldPosition)
    {
        float3 Delta = WorldPosition - FogBoxCenter;
        float3 UVW = Delta / FogBoxHalfSize;
        float3 absUVW = abs(UVW);

        float maxvalue = max(absUVW.x, absUVW.y);
        maxvalue = max(absUVW.z, maxvalue);
        return maxvalue <= 1.0;
    }

    float3 ComputeUVWIntargetPosition(float3 WolrdPosition)
    {
        float3 Delta = WolrdPosition - FowCenter;
        float3 UVW = Delta / FowHalfSize;     //-1, 1

        float3 absUVW = abs(UVW);
        float maxuvw = max(absUVW.x, absUVW.y);
        maxuvw = max(maxuvw, absUVW.z);

        float3 NormalizedUVW = (UVW + 1) /2;
        //In = maxuvw <=1;

        return NormalizedUVW;
    }

    float ComputeFogDensityFromNormalizeUVW(float3 NormalizedUVW)
    {
        
        float InputNoise01 = Noise01.Sample(Noise01Sampler,NormalizedUVW.rg * 10.0).r;
        float InputNoise02 = Noise01.Sample(Noise01Sampler,NormalizedUVW.rg * 8.0).r;
        float InputNoise03 = Noise01.Sample(Noise01Sampler,NormalizedUVW.rg * 3.0).r;


        NormalizedUVW.rg = saturate(InputNoise01*0.008 - InputNoise02*0.008 + NormalizedUVW.rg);

        float CurrentTexturevalue =  FowTexture.Sample(FowTextureSampler, NormalizedUVW.rg).r;
        float LastTexturevalue = LastFowTexture.Sample(LastFowTextureSampler, NormalizedUVW.rg).r;
        float PTexturevalue = PTexture.Sample(PTextureSampler, NormalizedUVW.rg).r;


        float NoiseModifiler = 1.0;

        //float scale1 = asdfasdfasd * NormalizedUVW.z // HegithModifyer;
        //

        //float Noise1 = NoiseTexture.Sample(NormalizedUVW.xy * scale1 + offset1).r;
        //float Noise2 = NoiseTexture.Sample(NormalizedUVW.xy * scale2 + offset2).r;
        //float Noise3 = NoiseTexture.Sample(NormalizedUVW.xy * scale3 + offset3).r;

        //float Total = Noise1 + Noise2 + Noise3;
        //Total = Total / 3;
        //float NoiseModifiler = Total;

        float LightPower = lerp(CurrentTexturevalue, LastTexturevalue, BlendAlpha);

        LightPower += PTexturevalue * PFogDensity;
        LightPower += InputNoise03*0.5;


        float FogContribution = clamp(1 - LightPower, 0, 1) * FogDensityPerSample * NoiseModifiler ;
        // return LightPower;
        
        
        FogContribution *= pow(3*(1-NormalizedUVW.z),3);


        return FogContribution;
    }

};Fow f;
return f.GetFogDensity();