
// ===================================================================
// UE5 材质编辑器 Custom Node - 体积云渲染系统
// 从RenderDoc抓帧还原 - 包含完整纹理输入（t0-t9）
// ===================================================================

// ===================== 输入参数声明 =====================
// 【基础纹理输入 - 需在Custom Node中创建对应的输入引脚】
// t0 - 体积基础密度纹理（Texture3D）
Texture3D VolumeBaseTexture;         // 连接到 TextureObject 参数
SamplerState VolumeBaseSampler;      // 连接到 SamplerSource

// t1 - 场景深度纹理（Texture2D）
Texture2D SceneDepthTexture;         // 使用 SceneTexture:SceneDepth
SamplerState DepthSampler;

// t2 - GBuffer材质ID纹理（Texture2D）
Texture2D MaterialIDTexture;         // 使用 SceneTexture:CustomDepth
SamplerState MaterialIDSampler;

// t3 - 噪声纹理（Texture2D）- 用于抖动采样
Texture2D NoiseTexture;
SamplerState NoiseSampler;

// t4 - 环境遮蔽纹理（Texture2D）
Texture2D AOTexture;
SamplerState AOSampler;

// t5 - 高度场雾密度纹理（Texture2D）
Texture2D HeightFogDensityTexture;
SamplerState HeightFogSampler;

// t6 - 体积光照纹理（Texture3D）
Texture3D VolumetricLightingTexture;
SamplerState VolumetricLightingSampler;

// t7 - 细节噪声纹理（Texture3D）- 用于体积细节
Texture3D DetailNoiseTexture;
SamplerState DetailNoiseSampler;

// t8 - 主体积云密度纹理（Texture3D）
Texture3D MainCloudDensityTexture;
SamplerState MainCloudSampler;

// t9 - 高频细节云纹理（Texture3D）
Texture3D HighFreqCloudTexture;
SamplerState HighFreqCloudSampler;

// 【向量输入】
float3 WorldPosition;                // 世界空间像素位置
float3 CameraWorldPosition;          // 相机世界位置
float3 CameraForward;                // 相机前向量
float2 ScreenUV;                     // 屏幕UV坐标
float2 ViewportSize;                 // 视口尺寸

// 【体积包围盒参数】
float3 VolumeBoxMin;                 // 体积盒最小边界（世界空间）
float3 VolumeBoxMax;                 // 体积盒最大边界（世界空间）

// 【光照参数】
float3 SunDirection;                 // 太阳光方向（归一化）
float3 SunColor;                     // 太阳光颜色
float3 AmbientColor;                 // 环境光颜色

// 【渲染控制参数】
float MaxRayDistance;                // 最大射线距离
int MaxSteps;                        // 最大步进次数（建议16-32）
float StepSizeMultiplier;            // 步长乘数（建议0.5-1.5）
float DensityMultiplier;             // 密度全局乘数（建议0.5-2.0）
float ExtinctionCoefficient;         // 消光系数（建议0.1-0.5）

// 【相位函数参数】
float ForwardScattering;             // 前向散射（Henyey-Greenstein g值）
float BackScattering;                // 后向散射

// 【时间参数】
float GameTime;                      // 游戏时间（用于动画偏移）

// ===================== 工具函数 =====================

// 【1】射线与AABB包围盒求交（精确版）
// 返回：.x = tNear（入点距离），.y = tFar（出点距离）
float2 RayAABBIntersection(float3 rayOrigin, float3 rayDir, float3 boxMin, float3 boxMax)
{
    float3 invRayDir = 1.0 / (rayDir + 0.0001); // 避免除零
    
    // 计算六个面的交点参数t
    float3 t0 = (boxMin - rayOrigin) * invRayDir;
    float3 t1 = (boxMax - rayOrigin) * invRayDir;
    
    // 对每个轴取正确的近远距离
    float3 tmin = min(t0, t1);
    float3 tmax = max(t0, t1);
    
    // 取三个轴的最大近距离和最小远距离
    float tNear = max(max(tmin.x, tmin.y), tmin.z);
    float tFar = min(min(tmax.x, tmax.y), tmax.z);
    
    return float2(tNear, tFar);
}

// 【2】边缘淡化因子（软边界）
// 在体积包围盒边缘产生平滑淡出效果
float EdgeFadeFactor(float3 normalizedPos)
{
    // normalizedPos 范围 [0,1]，中心为0.5
    float3 edgeDist = abs(normalizedPos - 0.5) * 2.0; // 转换到 [0,1]
    
    // 距离边缘0.4范围内开始淡化
    float3 fade = saturate((0.6 - edgeDist) * 5.0);
    
    return fade.x * fade.y * fade.z;
}

// 【3】Henyey-Greenstein 相位函数（光散射）
// g: [-1, 1], -1=完全后向散射, 0=各向同性, 1=完全前向散射
float HenyeyGreenstein(float cosTheta, float g)
{
    float g2 = g * g;
    float denominator = 1.0 + g2 - 2.0 * g * cosTheta;
    return (1.0 - g2) / (4.0 * 3.14159265 * pow(abs(denominator), 1.5));
}

// 【4】双Lobe相位函数（更真实的云散射）
float DualLobePhase(float cosTheta, float g0, float g1, float blend)
{
    float phase0 = HenyeyGreenstein(cosTheta, g0);
    float phase1 = HenyeyGreenstein(cosTheta, g1);
    return lerp(phase0, phase1, blend);
}

// 【5】体积纹理采样（带动画偏移）
float SampleVolumeDensity(float3 worldPos, float time)
{
    // 转换到体积纹理UV空间 [0,1]
    float3 uvw = (worldPos - VolumeBoxMin) / (VolumeBoxMax - VolumeBoxMin);
    
    // 边界检查
    if (any(uvw < 0.0) || any(uvw > 1.0))
        return 0.0;
    
    // 基础密度采样（t8 - 主云密度纹理）
    float baseDensity = MainCloudDensityTexture.SampleLevel(MainCloudSampler, uvw, 0).a;
    
    // 细节噪声采样（t7 - 细节纹理），带动画
    float3 detailUVW = uvw * 3.0 + float3(time * 0.01, 0, 0); // 添加风动画
    float detailNoise = DetailNoiseTexture.SampleLevel(DetailNoiseSampler, detailUVW, 0).r;
    
    // 高频细节（t9 - 高频云纹理）
    float3 highFreqUVW = uvw * 8.0;
    float highFreqDetail = HighFreqCloudTexture.SampleLevel(HighFreqCloudSampler, highFreqUVW, 0).g;
    
    // 混合多层细节
    float density = baseDensity;
    density = density - (1.0 - detailNoise) * 0.3;  // 侵蚀效果
    density = density * (0.8 + highFreqDetail * 0.2); // 高频调制
    
    // 重映射密度范围
    density = saturate((density - 0.4) / 0.6);
    
    return density * DensityMultiplier;
}

// 【6】光线步进采样（简化版，用于阴影计算）
float SampleLightEnergy(float3 startPos, float3 lightDir, int numSteps)
{
    float stepSize = 0.5; // 光线步进大小
    float transmittance = 1.0;
    
    for (int i = 0; i < numSteps; i++)
    {
        float3 samplePos = startPos + lightDir * (i * stepSize);
        
        float density = SampleVolumeDensity(samplePos, GameTime);
        
        if (density > 0.001)
        {
            // Beer-Lambert定律
            float opticalDepth = density * stepSize;
            transmittance *= exp(-opticalDepth * ExtinctionCoefficient);
            
            if (transmittance < 0.01)
                break; // 早期退出优化
        }
    }
    
    return transmittance;
}

// ===================== 主渲染函数 =====================

float3 RenderVolumetricClouds()
{
    // ===== 1. 初始化射线 =====
    float3 rayOrigin = CameraWorldPosition;
    float3 rayDir = normalize(WorldPosition - CameraWorldPosition);
    
    // ===== 2. 读取场景深度（t1） =====
    float sceneDepth = SceneDepthTexture.SampleLevel(DepthSampler, ScreenUV, 0).r;
    // 转换深度到世界空间距离（需根据UE5深度编码调整）
    float maxDistance = min(sceneDepth * 100000.0, MaxRayDistance); // 示例转换
    
    // ===== 3. 计算射线与体积包围盒的交点 =====
    float2 boxIntersection = RayAABBIntersection(rayOrigin, rayDir, VolumeBoxMin, VolumeBoxMax);
    float tNear = max(boxIntersection.x, 0.0);
    float tFar = min(boxIntersection.y, maxDistance);
    
    // 未击中包围盒，返回零
    if (tNear >= tFar || tFar <= 0.0)
        return float3(0, 0, 0);
    
    // ===== 4. 抖动采样（t3 - 噪声纹理） =====
    float2 noiseUV = ScreenUV * ViewportSize * 0.015625; // 缩放到噪声空间
    float jitter = NoiseTexture.SampleLevel(NoiseSampler, noiseUV, 0).r;
    
    // ===== 5. 计算步进参数 =====
    float rayLength = tFar - tNear;
    float stepSize = rayLength / float(MaxSteps);
    stepSize *= StepSizeMultiplier;
    
    // 应用抖动避免条带伪影
    tNear += jitter * stepSize;
    
    // ===== 6. 光线步进主循环 =====
    float3 accumulatedLight = float3(0, 0, 0);
    float transmittance = 1.0;
    
    // 光照方向的点积（用于相位函数）
    float cosTheta = dot(rayDir, SunDirection);
    
    for (int step = 0; step < MaxSteps; step++)
    {
        // 早期退出优化
        if (transmittance < 0.01)
            break;
        
        // 当前采样位置
        float t = tNear + step * stepSize;
        if (t > tFar)
            break;
        
        float3 samplePos = rayOrigin + rayDir * t;
        
        // ===== 采样密度 =====
        float density = SampleVolumeDensity(samplePos, GameTime);
        
        if (density > 0.001)
        {
            // ===== 计算边缘淡化 =====
            float3 normalizedPos = (samplePos - VolumeBoxMin) / (VolumeBoxMax - VolumeBoxMin);
            float edgeFade = EdgeFadeFactor(normalizedPos);
            density *= edgeFade;
            
            // ===== 计算光照 =====
            // 采样太阳光到达当前点的能量
            float lightEnergy = SampleLightEnergy(samplePos, SunDirection, 6);
            
            // 应用Beer-Lambert定律计算透射率变化
            float stepExtinction = exp(-density * ExtinctionCoefficient * stepSize);
            
            // 相位函数（散射方向性）
            float phase = DualLobePhase(cosTheta, ForwardScattering, BackScattering, 0.5);
            
            // 内散射光照
            float3 scatteredLight = SunColor * lightEnergy * density * phase;
            
            // 环境光照（多次散射近似）
            float3 ambient = AmbientColor * density * 0.5;
            
            // 总光照
            float3 totalLight = scatteredLight + ambient;
            
            // ===== 累积光照（体积渲染方程） =====
            // In-Scattering: 射入视线的光
            accumulatedLight += transmittance * (1.0 - stepExtinction) * totalLight;
            
            // 更新透射率
            transmittance *= stepExtinction;
        }
    }
    
    // ===== 7. 额外功能：体积光照查询（t6） =====
    // 如果需要使用预计算的体积光照（例如点光源、聚光灯）
    // float3 volumeLightUVW = (samplePos - VolumeBoxMin) / (VolumeBoxMax - VolumeBoxMin);
    // float3 volumeLighting = VolumetricLightingTexture.SampleLevel(VolumetricLightingSampler, volumeLightUVW, 0).rgb;
    // accumulatedLight += volumeLighting * density * transmittance;
    
    // ===== 8. 高度雾混合（t5） =====
    float heightFogDensity = HeightFogDensityTexture.SampleLevel(HeightFogSampler, ScreenUV, 0).r;
    if (heightFogDensity > 0.001)
    {
        // 简化的高度雾计算
        float fogAmount = heightFogDensity * (1.0 - transmittance);
        accumulatedLight += SunColor * fogAmount * 0.2;
    }
    
    return accumulatedLight;
}

// ===================== Custom Node 返回 =====================
// 最终输出：RGB = 体积云颜色贡献
return RenderVolumetricClouds();
