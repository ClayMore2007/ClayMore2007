
//input UV
//input Tex

float percent = 1.0;
float3 TexColor = Texture2DSample(Tex,TexSampler,UV);
float3 L = float3(0.3,0.59,0.11);
float3 OutputColor = TexColor*(1.0-percent) + dot(TexColor,L)*percent;
return OutputColor; 


