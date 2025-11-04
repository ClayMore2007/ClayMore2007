# 鸣潮雾效 Shader 逆向分析

## 文件说明

- **mingchao_fog2.hlsl** - 原始 RenderDoc 逆向的完整 UE4 代码(3392行)
- **mingchao_fog2_extracted.hlsl** - 提取的核心雾效算法(简化版)

## 核心技术分析

### 1. 体积雾实现

原始代码使用了多重体积雾技术:

- **3D 体积雾纹理采样** (`t0, t6, t7, t8, t9`)
  - 主体积雾纹理(t0/t8)
  - 体积云纹理(t6) 
  - 体积噪声纹理(t7)
  - 细节雾纹理(t9)

- **射线步进算法**
  - 使用固定步长的光线步进
  - 循环次数: 20-40 步
  - 每步采样雾密度并累积贡献

### 2. 雾效组件

#### A. 高度雾 (Height Fog)
```hlsl
// 指数高度衰减
float heightFactor = exp(-height * heightFalloff);
float fogAmount = 1.0 - exp(-density * viewDistance);
```

#### B. 体积散射 (Volumetric Scattering)
```hlsl
// Henyey-Greenstein 相位函数用于光散射
float phaseHG = (1.0 - g²) / pow(1.0 + g² - 2.0 * g * sunDot, 1.5);
```

#### C. 体积光照 (Volumetric Lighting)
- 使用相位函数计算散射光
- 支持方向光贡献
- 考虑遮挡和阴影

### 3. 优化技术

#### 早期退出 (Early Exit)
```hlsl
if (transmittance < 0.01) break;
```

#### 边缘软化 (Edge Softening)
```hlsl
// 在体积边界进行软化处理
float edgeFade = saturate((edgeFade - 0.4) * 10.0);
```

#### 距离衰减 (Distance Falloff)
```hlsl
float distanceFade = saturate(distance / maxDistance);
distanceFade = distanceFade * distanceFade; // 平方衰减
```

### 4. 特效增强

#### 噪声扰动
- 3D Perlin/Simplex 噪声
- 时间偏移实现雾的流动效果
- 多层次噪声叠加

#### 遮罩系统
- 使用雾遮罩纹理控制区域
- 支持自定义形状的雾区域

## 常量缓冲区结构

### FogConstants (cb4)
主要雾效参数:
- `FogParams[12]` - 雾体积中心位置
- `FogParams[19]` - 雾体积尺寸
- `FogParams[47]` - 体积UV偏移
- `FogParams[51]` - 噪声缩放
- `FogParams[54]` - 相位函数参数(g值)
- `FogParams[55]` - 光照方向
- `FogParams[65]` - 雾密度缩放
- `FogParams[75]` - 高度雾参数
- `FogParams[78]` - 消光系数
- `FogParams[80]` - 深度权重
- `FogParams[82]` - 距离衰减参数
- `FogParams[83]` - 边缘软化参数

## 关键算法流程

```
1. 屏幕空间位置 → 世界空间重建
   ↓
2. 计算光线步进范围(与雾体积相交)
   ↓
3. 射线步进循环:
   - 采样雾密度纹理
   - 计算光照贡献(相位函数)
   - 累积散射光
   - 更新透射率
   ↓
4. 应用噪声扰动
   ↓
5. 应用遮罩和衰减
   ↓
6. 与场景颜色混合
```

## UE4 特有元素(已在提取版中移除)

以下是原始代码中的 UE4 引擎特定代码:

### 移除的内容:
- ✓ 3Dmigoto 注释和声明头
- ✓ 复杂的 GBuffer 解码逻辑
- ✓ UE4 的深度格式转换
- ✓ 材质参数打包/解包
- ✓ 大气散射计算(cb1[150-170])
- ✓ 后处理混合逻辑
- ✓ TAA/运动矢量相关代码
- ✓ 调试输出分支

### 保留的核心:
- ✓ 体积雾射线步进算法
- ✓ Henyey-Greenstein 相位函数
- ✓ 高度雾计算
- ✓ 噪声扰动系统
- ✓ 边缘软化技术

## 使用建议

### 原始文件用途:
- 完整的 UE4 实现参考
- 调试和逆向分析
- 了解完整渲染管线

### 提取文件用途:
- 快速理解核心算法
- 移植到其他引擎
- 学习雾效实现技术
- 自定义修改和优化

## 性能考虑

### 高性能设置:
- 减少光线步进次数(10-20步)
- 降低体积雾纹理分辨率
- 使用粗糙的噪声采样

### 高质量设置:
- 增加光线步进次数(30-40步)
- 高分辨率3D纹理
- 多层次噪声细节

## 相关技术

- **Volumetric Fog** - 体积雾
- **Raymarching** - 射线步进
- **Phase Function** - 相位函数
- **Atmospheric Scattering** - 大气散射
- **Signed Distance Field** - 有向距离场(用于形状定义)

## 参考资料

- Frostbite Engine - Physically Based & Unified Volumetric Rendering
- GPU Pro 7 - Real-Time Volumetric Cloudscapes
- SIGGRAPH 2015 - The Real-time Volumetric Cloudscapes of Horizon: Zero Dawn
