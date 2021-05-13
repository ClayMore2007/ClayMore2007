struct FOW
{
    //input float maxStep
    //input float perStepLength
    //input float3 camPos
    //input float3 camDir


    float cloudDensity()
    {
        float density = 0;
        int step = maxStep;
        step = max(1,step);
        for(int i=0; i<step; i++)
        {
            float3 newPosition = camPos+ camDir * i * perStepLength;
            if(ifIsInBox(newPosition))
            // if(i<maxStep)
            {
                density = density + 0.01;
            }
        }
        float alpha = 1-density;
        alpha = clamp(alpha,0,1);

        return alpha;

    }

    bool ifIsInBox(float3 WorldPosition)
    {
        float BoxSize = box(WorldPosition);

        if(BoxSize <1 )
        {
            return true;
        }
        return false ;
    }

    float box(float3 WorldPosition)
    {
        // float3 boxCenter = float3(0,0,0);
        float boxWidth = 2000;
        float3 boxUVW = WorldPosition / boxWidth;
        float3 absBoxUVW = abs(boxUVW);

        float maxBoxValue = max(absBoxUVW.x,absBoxUVW.y);
        maxBoxValue = max(maxBoxValue,absBoxUVW.z);

        if (maxBoxValue <=1)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
};
FOW fow;
return fow.cloudDensity();