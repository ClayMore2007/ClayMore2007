struct Fow
{

    //Input float3 CameraPosition
    //Input float3 CameraToWordPositionDir
    //Input float InStepCount;
    //Input float InPerStepSize;

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
        for(int i = 0; i < StepCount; ++i)
        {
            float3 CheckPoint = IntersectPosition + CameraToWordPositionDir * i * PerStepLength;
            bool bIn = ComputeWorldPositionInCloudBox(CheckPoint);
            float3 NormalizeUVW = ComputeUVWIntargetPosition(CheckPoint);
            float FogComtribution = ComputeFogDensityFromNormalizeUVW(NormalizeUVW);



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


        float CurrentTexturevalue =  FowTexture.Sample(FowTextureSampler, NormalizedUVW.rg).r;
        float LastTexturevalue = LastFowTexture.Sample(LastFowTextureSampler, NormalizedUVW.rg).r;
        float PTexturevalue = PTexture.Sample(PTextureSampler, NormalizedUVW.rg).r;


        // float NoiseModifiler = 1.0;

        //float scale1 = asdfasdfasd * NormalizedUVW.z // HegithModifyer;
        //

        //float Noise1 = NoiseTexture.Sample(NormalizedUVW.xy * scale1 + offset1).r;
        //float Noise2 = NoiseTexture.Sample(NormalizedUVW.xy * scale2 + offset2).r;
        //float Noise3 = NoiseTexture.Sample(NormalizedUVW.xy * scale3 + offset3).r;

        //float Total = Noise1 + Noise2 + Noise3;
        //Total = Total / 3;
        //float NoiseModifiler = Total;

        NormalizedUVW.z = 0.5;
        float scale1 =  NormalizedUVW.z;
        // float scale2 =  NormalizedUVW.z;
        // float scale3 =  NormalizedUVW.z;

        float2 offset1 = float2(0,0);
        float2 offset2 = float2(0,0);
        float2 offset3 = float2(0,0);
        
        float Noise1 = NoiseTexture.Sample(NoiseTextureSampler,NormalizedUVW.xyz * scale1 + offset1).r;
        // float Noise2 = NoiseTexture.Sample(NoiseTextureSampler,NormalizedUVW.xy * scale2 + offset2).r;
        // float Noise3 = NoiseTexture.Sample(NoiseTextureSampler,NormalizedUVW.xy * scale3 + offset3).r;
        // float Total = Noise1 + Noise2 + Noise3;
        // Total = Total/3;
        float Total = Noise1;
        float NoiseModifiler = Total;

        float LightPower = lerp(CurrentTexturevalue, LastTexturevalue, BlendAlpha);
        LightPower += PTexturevalue * PFogDensity;


        // float FogContribution = clamp(1 - LightPower, 0, 1) * FogDensityPerSample * NoiseModifiler ;
        float FogContribution = NoiseModifiler * FogDensityPerSample;
        // return LightPower;

        return FogContribution;
    }

};Fow f;
return f.GetFogDensity();