struct FOW
{
    float cloudDensityFromThisView()
    {
        // int step = 10;
        float cloudDensity = 0;
        float perStepLength = (tarrgetPos - camPos)/step;

        //[LOOP]
        for (int i = 0; i<maxStep; i++)
        {
            float3 curposition = camPos + camDir * i * perStepLength;
            // float3 curposition = camPos + camDir * currStep * step;
            // if(IfIsInCloud(curposition))
            if(i<maxStep)
            
            {
                // cloudDensity += 0.01;
                cloudDensity += getCloudDensityFromPosition(curposition);
            }
        }
        return cloudDensity;
    }


    float3 getCloudDensityFromPosition(float3 WorldPosition)
    {

        float2 uv0 = WorldPosition.xy/1000;

        // float2 uv1 = WorldPosition.xy/2000;
        // float2 uv2 = WorldPosition.xy/3000;

        // float3 color0 = 1;
        // float3 color1 = 1;
        // float3 color2 = 1;

        float3 color0 = Texture2DSample(CloudTexture,CloudTextureSampler,uv0);
        // float3 color1 = Texture2DSample(CloudTexture,CloudTextureSampler,uv1);
        // float3 color2 = Texture2DSample(CloudTexture,CloudTextureSampler,uv2);

        // float3 result = (color0 + color1 + color2);
        float3 result = color0;
        result = result / 10;

        //float3 result = 0.01;
        return result;

    }

    bool IfIsInCloud(float3 WorldPosition)
    {
        float3 Mask = WorldPositionToMaskTextureUV(WorldPosition);
        if (Mask.r < 0.5) 
        {
            return true;
        }
        return false;

    }
    float3 WorldPositionToMaskTextureUV(float3 WorldPosition)
    {
        float3 uvw0 = WorldPosition.xyz/1000;
        uvw0 = (uvw0+1)/2;

        float3 mask0 = Texture2DSample(MaskTexture,MaskTextureSampler,uvw0);

        return mask0;

    }
};
FOW fow;
return fow.cloudDensityFromThisView();
//-------------------------------------------------------------------------------
//-----------------------------------------------------------------------------


struct FOW
{
    float cloudDensityFromThisView()
    {
        float cloudDensity = 0;
        float perStepLength = distance(camPos,tarrgetPos)/stepNum;

        for(int i=0; i<maxStep; i++)
        {
            float3 curPosition = ((camPos + camDir * i * perStepLength))-camPos*2;
            if(IfIsInCloud(curPosition))
            {
                cloudDensity += getCloudDensityFromPosition(curPosition);
            }
        }
        return cloudDensity;

    }

    float3 getCloudDensityFromPosition(float3 WorldPosition)
    {
        float2 uv = WorldPosition.xy/ cloudSize;
        float3 color = Texture2DSample(CloudTexture,CloudTextureSampler,uv);
        float3 result = color*0.05;
        return result;

    }

    bool IfIsInCloud(float3 WorldPosition)
    {
        float3 mask = WorldPositionToMaskTextureUV(WorldPosition);
        if(mask.r <0.5)
        {
            return true;
        }
        return false;
    }

    float3 WorldPositionToMaskTextureUV(float3 WorldPosition)
    {
        float3 UVW = WorldPosition / cloudSize;
        // float2 uv = WorldPosition.xy / cloudSize;
        UVW.z = (UVW.z+1)/2;
        float3 maskColor = Texture2DSample(MaskTexture,MaskTextureSampler,UVW);
        float3 result = maskColor;
        return result ;
    }
};
FOW fow;
return fow.cloudDensityFromThisView();


//-----------------------------------------------------------------------------------

struct FOW
{
    //Input : float3 WorldPosition
    //Input : Texture MaskTexture
    //Input : float3 cloudSize

    //Input : float3 CameraPosition
    //Input : float3 CameraToWorPositionDir
    //Input : float PerStepLength
    //Input : float MaxStep
    //Input : float PerStepDensity
    float cloudDensityFromThisView()
    {
        float density = 0;
        int Step = MaxStep;
        Step = max(1, Step);

        float CamToFogDir = max((CameraPosition.z-cloudSizeZ)/saturate(dot(CameraToWorPositionDir,float3(0,0,1))),0);
        // float PerStepLength = distance(WorldPosition,CameraPosition)/Step;
        for(int i =0; i < Step; ++i)
        {
            
            float3 CheckPosition = CameraPosition + CameraToWorPositionDir * (i * PerStepLength + CamToFogDir);
              
            if(IfIsInCloud(CheckPosition))
            {
                //density = density + 0.01;
                density += getCloudDensityFromPosition(CheckPosition);
            }
        }
        
        // float alpha = 1 - density;
        // alpha = clamp(alpha, 0, 1);
        // return alpha;
        density = clamp(density,0,1);
        return density;
    }

    float3 getCloudDensityFromPosition(float3 WorldPosition)
    {
        float2 uv0 = WorldPosition.xy/cloudSize;
        float2 uv1 = WorldPosition.xy/cloudSize*2;
        float2 uv2 = WorldPosition.xy/cloudSize*4;

        float3 color0  = Texture2DSample(CloudTexture,CloudTextureSampler,uv0);
        float3 color1  = Texture2DSample(CloudTexture,CloudTextureSampler,uv1);
        float3 color2  = Texture2DSample(CloudTexture,CloudTextureSampler,uv2);

        float3 result = (color0+color1+color2)/3;
        result = result * cloudIndensity;
        return result;
    }


    bool IfIsInCloud(float3 WorldPosition)
    {
        float3 mask = WorldPositionToMaskTextureUV(WorldPosition);
        if(mask.r <0.5)
        {
            return true;
        }
        return false;
    }

    float3 WorldPositionToMaskTextureUV(float3 WorldPosition)
    {
        float3 UVW  = WorldPosition/cloudSizeZ;  // [-1,1]

        float3 absUVW = abs(UVW);

        // if(UVW.x >=-1 && UVW.x<=1
        //     &&UVW.y >=-1 && UVW.y <=1
        //     &&UVW.z >=-1 && UVW.z <=1)
        // {
        // }

        float maxvalue = max(absUVW.x, absUVW.y);
        maxvalue = max(maxvalue, absUVW.z);

        if(maxvalue <=1)
        {
            float2 UV = (UVW.xy + 1 )/2;
            float3 maskColor = Texture2DSample(MaskTexture, MaskTextureSampler, UV);
            float Z = UVW.z;
            float ScaleAboutHeight = FogHeightGradient(Z);

            return maskColor * ScaleAboutHeight;
        }else
        {
             return 1;
        }
    }

    float FogHeightGradient(float WorldPositionZ)
    {
        float heightGradient = pow((1-WorldPositionZ),HeightExp);
        return heightGradient;
    }

    // bool Check(float3 Center, float3 HalfSize)
    // {
    //     for(int i=0,i<8; ++i)
    //     {
    //         float3 TargetPos = GetVeretxPositionAtIndex(Center, HalfSize,i);

    //     }

    // }

    // static float3 HalfSizeDir[8] ={
    //     float3(1,1,1),
    //     float3(1,1,-1),
    //     float3(1,-1,1),
    //     float3(1,-1,-1),
    //     float3(-1,1,1),
    //     float3(-1,1,-1),
    //     float3(-1,-1,1),
    //     float3(-1,-1,-1)
    // }


    // float3 GetVeretxPositionAtIndex(float3 Center, float3 HalfSize, int index)
    // {
    //     float3 TrueHalfSize =     HalfSize *   HalfSizeDir[index];

    //     return GetVertexPosition(Center, TrueHalfSize);
    // }

    // float3 GetVertexPosition(float3 Center, float3 HalfSize)
    // {
    //     float3 Pos = Center + HalfSize;

    //     return Pos;
    // }
};

FOW fow;
return fow.cloudDensityFromThisView();

