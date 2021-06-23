//高斯模糊  / Gaussian Blurn


float3 BlurColor = Texture2DSample(Tex,TexSampler,UV)*0.147761;

BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(-Shift,-Shift)/ Resolution)*0.0947416;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(0,-Shift)/ Resolution)*0.118318;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(Shift,-Shift)/ Resolution)*0.0947416;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(-Shift,0)/ Resolution)*0.118318;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(Shift,0)/ Resolution)*0.118318;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(-Shift,Shift)/ Resolution)*0.0947416;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(0,Shift)/ Resolution)*0.118318;
BlurColor += Texture2DSample(Tex,TexSampler,UV+ float2(Shift,Shift)/ Resolution)*0.0947416;

return BlurColor;