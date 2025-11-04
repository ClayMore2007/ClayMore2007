// 鸣潮雾效核心算法提取版本
// 从 RenderDoc 逆向的 UE4 代码中提取

// ===== 核心纹理资源 =====
Texture3D<float4> VolumetricFogTexture : register(t0);      // 体积雾纹理
Texture2D<float4> SceneDepthTexture : register(t1);         // 场景深度
Texture2D<float4> GBufferTexture : register(t2);            // GBuffer
Texture2D<float4> NoiseTexture : register(t3);              // 噪声纹理
Texture2D<float4> FogMaskTexture : register(t4);            // 雾遮罩
Texture2D<float4> FogColorTexture : register(t5);           // 雾颜色
Texture3D<float4> VolumetricCloudTexture : register(t6);    // 体积云
Texture3D<float4> VolumetricNoiseTexture : register(t7);    // 体积噪声
Texture3D<float4> FogDensityTexture : register(t8);         // 雾密度
Texture3D<float4> DetailFogTexture : register(t9);          // 细节雾

SamplerState LinearSampler : register(s0);
SamplerState PointSampler : register(s1);
SamplerState BilinearSampler : register(s2);
SamplerState TrilinearSampler : register(s3);

// ===== Constant Buffers =====
cbuffer ViewConstants : register(b0)
{
    // 视图相关常量
    float4 ViewProj[64];           // 视图投影矩阵
    float4 CameraPos;              // 相机位置
    float4 ScreenSize;             // 屏幕尺寸
    // ... 其他视图参数
}

cbuffer ObjectConstants : register(b2)
{
    // 物体变换矩阵
    float4 LocalToWorld[4];
    float4 WorldToLocal[4];
}

cbuffer MaterialConstants : register(b3)
{
    // 材质参数
    float4 BaseColor;
    float4 EmissiveColor;
    // ...
}

cbuffer FogConstants : register(b4)
{
    float4 FogParams[85];          // 雾效参数数组
}

// ===== 核心雾效计算函数 =====

// 计算体积雾密度
float3 ComputeVolumetricFog(float3 worldPos, float3 viewDir, float distance)
{
    // 体积雾采样坐标变换
    float3 volumeUVW = (worldPos - FogParams[12].xyz) / FogParams[19].xyz;
    
    // 采样体积雾纹理
    float4 fogSample = VolumetricFogTexture.SampleLevel(LinearSampler, volumeUVW, 0);
    
    // 雾密度计算
    float fogDensity = fogSample.w;
    float3 fogColor = fogSample.xyz;
    
    // 应用距离衰减
    float distanceFade = saturate(distance / FogParams[82].y);
    distanceFade = distanceFade * distanceFade;
    distanceFade = FogParams[83].z * distanceFade;
    
    // 边缘软化
    float3 volumeBounds = abs(volumeUVW - 0.5) * 2.0;
    float edgeFade = max(volumeBounds.x, max(volumeBounds.y, volumeBounds.z));
    edgeFade = saturate((edgeFade - 0.4) * 10.0);
    edgeFade = 1.0 - edgeFade;
    
    return fogColor * fogDensity * distanceFade * edgeFade;
}

// 体积光线步进
float3 VolumetricRaymarching(float3 startPos, float3 rayDir, float maxDistance, int stepCount)
{
    float3 accumulatedFog = 0;
    float transmittance = 1.0;
    float stepSize = maxDistance / float(stepCount);
    
    for (int i = 0; i < stepCount; i++)
    {
        float currentDist = i * stepSize;
        float3 samplePos = startPos + rayDir * currentDist;
        
        // 采样雾密度
        float3 volumeUVW = (samplePos - FogParams[12].xyz) / FogParams[19].xyz;
        float4 fogSample = FogDensityTexture.SampleLevel(LinearSampler, volumeUVW, 0);
        
        if (fogSample.w > 0)
        {
            // 计算光照贡献
            float3 lightContribution = ComputeFogLighting(samplePos, fogSample.xyz);
            
            // 累积雾效
            float density = fogSample.w * stepSize;
            float extinction = exp(-density);
            
            accumulatedFog += lightContribution * transmittance * (1.0 - extinction);
            transmittance *= extinction;
            
            // 早期退出优化
            if (transmittance < 0.01) break;
        }
    }
    
    return accumulatedFog;
}

// 计算雾的光照
float3 ComputeFogLighting(float3 worldPos, float3 fogColor)
{
    // 方向光贡献
    float3 lightDir = normalize(FogParams[55].xyz);
    float sunDot = dot(lightDir, normalize(worldPos - CameraPos.xyz));
    
    // Henyey-Greenstein 相位函数
    float g = FogParams[54].x;
    float g2 = g * g;
    float phaseHG = (1.0 - g2) / pow(1.0 + g2 - 2.0 * g * sunDot, 1.5);
    phaseHG /= 12.566; // 4π
    
    // 散射颜色
    float3 scatterColor = fogColor * FogParams[65].x * phaseHG;
    
    return scatterColor;
}

// 高度雾计算
float ComputeHeightFog(float3 worldPos, float viewDistance)
{
    float height = worldPos.z - FogParams[75].y;
    float heightFalloff = FogParams[75].z;
    
    // 指数高度衰减
    float heightFactor = exp(-height * heightFalloff);
    heightFactor = saturate(heightFactor);
    
    // 距离密度
    float density = FogParams[65].x * heightFactor;
    
    // 计算透射率
    float fogAmount = 1.0 - exp(-density * viewDistance);
    
    return fogAmount;
}

// 噪声扰动
float3 ApplyFogNoise(float3 worldPos, float time)
{
    // 3D 噪声扰动
    float3 noiseUVW = worldPos * FogParams[51].xyz * 0.001 + float3(time, 0, 0);
    float3 noise = VolumetricNoiseTexture.Sample(TrilinearSampler, noiseUVW).xyz;
    
    // 噪声权重
    float noiseWeight = FogParams[52].x;
    
    return noise * noiseWeight;
}

// ===== 主着色器 =====
struct PSInput
{
    float4 Position : SV_Position;
    float2 TexCoord : TEXCOORD0;
};

struct PSOutput
{
    float4 Color : SV_Target0;
    float4 Velocity : SV_Target1;
    float Depth : SV_DEPTH;
};

PSOutput main(PSInput input)
{
    PSOutput output;
    
    // 1. 重建世界空间位置
    float depth = SceneDepthTexture.Sample(PointSampler, input.TexCoord).x;
    float3 viewRay = ReconstructViewRay(input.TexCoord);
    float3 worldPos = CameraPos.xyz + viewRay * depth;
    
    // 2. 计算雾效
    float viewDistance = length(worldPos - CameraPos.xyz);
    float3 viewDir = normalize(worldPos - CameraPos.xyz);
    
    // 体积雾
    float3 volumeFog = ComputeVolumetricFog(worldPos, viewDir, viewDistance);
    
    // 高度雾
    float heightFog = ComputeHeightFog(worldPos, viewDistance);
    
    // 噪声扰动
    float3 fogNoise = ApplyFogNoise(worldPos, FogParams[0].x);
    
    // 3. 混合雾效
    float3 finalFog = volumeFog + fogNoise;
    float fogOpacity = saturate(heightFog + volumeFog.x);
    
    // 4. 输出
    output.Color = float4(finalFog, fogOpacity);
    output.Velocity = float2(0, 0);
    output.Depth = depth;
    
    return output;
}

// ===== 辅助函数 =====
float3 ReconstructViewRay(float2 uv)
{
    // 从屏幕UV重建视图射线
    float2 ndc = uv * 2.0 - 1.0;
    ndc.y = -ndc.y;
    
    // 反投影
    float4 viewPos = mul(float4(ndc, 1, 1), InverseProjection);
    return viewPos.xyz / viewPos.w;
}
