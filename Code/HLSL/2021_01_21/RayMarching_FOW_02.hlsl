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
        float3 CheckPosition = float3(0,0,0);

        float CamToFogDir = max(CameraPosition.z - cloudSizeZ,0) / clamp(dot(CameraToWorPositionDir*-1,float3(0,0,1)),0.0001,1);
        // float PerStepLength = distance(WorldPosition,CameraPosition)/Step;
        for(int i =0; i < Step; ++i)
        {



            float CheckLength = i * PerStepLength + CamToFogDir;
            if(CheckLength < Depth)
            {
                CheckPosition = CameraPosition + CameraToWorPositionDir * CheckLength;
                if (CheckLength > Depth)
                    break
            }


            
            
            
            if(IfIsInCloud(CheckPosition))
            {
                //density = density + 0.01;
                density += getCloudDensityFromPosition(CheckPosition);
            }
        }
        
        float alpha = 1 - density;
        alpha = clamp(alpha, 0, 1);
        return alpha;
        // density = clamp(density,0,1);
        // return density;
    }

    float3 getCloudDensityFromPosition(float3 WorldPosition)
    {
        float2 uv0 = WorldPosition.xy/cloudSize;
        float2 uv1 = WorldPosition.xy/cloudSize*2;
        float2 uv2 = WorldPosition.xy/cloudSize*4;

        float3 color0  = Texture2DSample(CloudTexture,CloudTextureSampler,uv0);
        float3 color1  = Texture2DSample(CloudTexture,CloudTextureSampler,uv1);
        float3 color2  = Texture2DSample(CloudTexture,CloudTextureSampler,uv2);

        float3 height = float3 (1,1,pow(1-WorldPosition.z/cloudSizeZ,HeightExp));
        
        float3 result = (color0+color1+color2)/3;

        result = result * cloudIndensity * height ;

        return result;
    }


    bool IfIsInCloud(float3 WorldPosition)
    {
        float3 mask = WorldPositionToMaskTextureUV(WorldPosition);
        if(mask.r <1)
        {
            return true;
        }
        return false;
    }

    float3 WorldPositionToMaskTextureUV(float3 WorldPosition)
    {
        float3 UVW  = float3(WorldPosition.x/cloudSizeXY,WorldPosition.y/cloudSizeXY,WorldPosition.z/cloudSizeZ);  // [-1,1]

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
            // UVW.z = (UVW.z+1)/2;
            // float Z = UVW.z;
            // float ScaleAboutHeight = pow(WorldPosition.z/cloudSizeZ,HeightExp);
  

            return maskColor;
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

