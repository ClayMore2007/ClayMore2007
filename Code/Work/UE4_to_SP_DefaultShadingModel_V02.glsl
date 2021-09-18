import lib-sampler.glsl
import lib-vectors.glsl
import lib-sss.glsl
import lib-pbr.glsl
import lib-alpha.glsl
import lib-emissive.glsl
import lib-pom.glsl
import lib-utils.glsl
import lib-defines.glsl

//: param auto channel_basecolor
uniform SamplerSparse basecolor_tex;
//: param auto channel_roughness
uniform SamplerSparse roughness_tex;
//: param auto channel_metallic
uniform SamplerSparse metallic_tex;
//: param auto channel_specularlevel
uniform SamplerSparse specularlevel_tex;


//: param auto channel_user0
uniform SamplerSparse SkyLightTex;

//: param auto channel_user1
uniform SamplerSparse CosRoghnessTex;


//: param custom { 
//:   "default": [1.0, 1.0, 1.0], 
//:   "label": "LightColorLinear", 
//:   "min": 0.0, "max": 1.0,
//:   "group": "MainLight", 
//:    "widget" : "color"}
uniform vec3 lightcolor;

//: param custom { 
//:   "default": 4.5, 
//:   "label": "LightColorIrradiance",
//:   "group": "MainLight", 
//:   "min": 0.0, "max": 1000}
uniform float lightirradiance;

//: param custom { 
//:   "default": [0, -1, -1], 
//:   "label": "LightDir", 
//:   "group": "MainLight", 
//:   "min": -1.0, "max": 1.0}
uniform vec3 lightdir;

struct mainlightstruct
{
  vec3 lightdir;
  vec3 lightcolor;
  float lightirradiance;
};



//: param custom { 
//:   "default": 1.0, 
//:   "label": "DirectionalLightModifiler",
//:   "group": "MainLight", 
//:   "min": 0.0, "max": 10}
uniform float DirectionalLightModifiler;

//: param custom { 
//:   "default": 1.0, 
//:   "label": "EnvLightModifiler",
//:   "group": "MainLight", 
//:   "min": 0.0, "max": 10}
uniform float EnvLightModifiler;

//: param custom { 
//:   "default": 1.0, 
//:   "label": "EmissiveLightModifiler",
//:   "group": "MainLight", 
//:   "min": 0.0, "max": 10}
uniform float EmissiveLightModifiler;


//: param custom{
//:    "default":0.0,
//:    "label": "EnvLightDesaturation",
//:    "group": "MainLight",
//:    "min":0.0,"max":1.0}
uniform float EnvLightDesaturation;

//: param custom { "default": true, "label": "UseDirectionWithEnvironment" }
uniform bool b_RotateDirectionWithEnvironment;

//: param auto environment_exposure
uniform float uniform_environment_exposure;

//: param auto environment_rotation
uniform float uniform_environment_rotation;

struct BxDFcontext
{
    float NoV;
    float NoL;
    float VoL;
    float NoH;
    float VoH;
};


float Pow4(float data)
{
    float a2 = data * data;
    return a2 * a2;
}

float Pow5(float data)
{
    float a2 = data * data;
    float a5 = a2 * a2 * data;
    return a5;
}

float rcp(float data)
{
    return 1.0/ data;
}

vec3 saturate( vec3 data)
{
    return min(  max(vec3(0,0,0), data ), vec3(1,1,1));
}

float saturate( float data)
{
    return min( max( 0, data), 1);
}

float DielectricSpecularToF0(float Specular)
{
    return 0.08 * Specular;
}

vec3 ComputeF0(float Specular, vec3 BaseColor, float Metallic)
{
    return mix( vec3(DielectricSpecularToF0(Specular)), BaseColor, vec3(Metallic));
}


vec3 lerp(vec3 a, vec3 b, vec3 alpha)
{
    return mix(a,b,alpha);
}

vec3 lerp(vec3 a, vec3 b, float alpha)
{
    return mix(a,b, vec3(alpha));
}

float lerp(float a, float b, float alpha)
{
    return mix(a,b,alpha);
}

vec3 Diffuse_Lambert(vec3 DiffuseColor)
{
    return DiffuseColor * 1.0 / M_PI ;
}


void Init(inout BxDFcontext context, vec3 N, vec3 V, vec3 L)
{
    context.NoL = saturate( dot(N, L) );
    context.NoV = dot(N, V);
    context.VoL = dot(V, L);

    float InvLenH = inversesqrt(2 + 2 * context.VoL);
    context.NoH = saturate( (context.NoL + context.NoV) * InvLenH );
    context.VoH = saturate( InvLenH + InvLenH * context.VoL);

    context.NoV = saturate( abs(context.NoV) + 1e-5);
}


float D_GGX(float a2, float NoH)
{
    float d = (NoH * a2 - NoH) * NoH + 1;
    return a2 / (M_PI * d * d);
}

float Vis_SmithJointApprox(float a2, float NoV, float NoL)
{
    float a = sqrt(a2);
    float Vis_SmithV = NoL * (NoV * (1 - a) + a);
	float Vis_SmithL = NoV * (NoL * (1 - a) + a);
	return 0.5f * rcp(Vis_SmithV + Vis_SmithL);
}

vec3 F_Schlick(vec3 SpecularColor, float VoH)
{
    float Fc = Pow5(1 - VoH);					// 1 sub, 3 mul
			//return Fc + (1 - Fc) * SpecularColor;		// 1 add, 3 mad

			// Anything less than 2% is physically impossible and is instead considered to be shadowing
	return saturate(50.0f * SpecularColor.g) * Fc + (1 - Fc) * SpecularColor;
}

vec3 SpecularGGX(float Roughness, vec3 SpecularColor, BxDFcontext Context, float NoL)
{
    float a2 = Pow4(Roughness);
    float Energy = 1.0f;

    float D = D_GGX(a2, Context.NoH) * Energy;
    float Vis = Vis_SmithJointApprox(a2, Context.NoV, NoL);
    vec3 F = F_Schlick(SpecularColor, Context.VoH);

    return (D * Vis) * F;
}


vec3 WorldDirToCubeMapUV(vec3 WorldDir)
{
  WorldDir.xyz = WorldDir.xzy;

  float theta = sin(WorldDir.z); //[-1/2PI , 1/2PI]

	float phi = M_PI /2;
	if (WorldDir.y != 0)
	{
		phi = atan(WorldDir.x / WorldDir.y); //[-1/2PI, 1/2PI]
	}
	else
	{
		phi = WorldDir.x > 0 ? M_PI/2 : -M_PI/2; // [-1/2PI, 1/2PI]
	}

	if (WorldDir.y < 0)
	{
		phi += M_PI;
	}


	float u = phi / (M_PI * 2); // [-1/4 3/4];
	float v = theta / (M_PI);  // [-1/2, 1/2];

	u = 3.0f / 4.0f - u;
	v = 0.5f - v;

  v = 1.0f - v;

  u += 0.5f + uniform_environment_rotation;

  int k = int(u);
  u = u - k;
  return vec3(u,v,0);
}


vec3 GetOffSpecularPeakReflectionDir(vec3 N, vec3 R, float Roughness)
{
    float a = Roughness * Roughness;
    return lerp( N, R, (1 - a) * ( sqrt(1 -a ) + a));
}

float ComputeReflectionCaptureMipFromRoughness( float Roughness, float CubemapMaxMip)
{
    float  LevelFrom1x1 =  1  -  1.2  * log2(Roughness);
	return CubemapMaxMip - 1 - LevelFrom1x1;
}

void GetMipMapUV( vec2 uv, float mipmap, inout vec2 FrontUv, inout vec2 EndUV)
{
    mipmap = min(7, mipmap);
    mipmap = max(0, mipmap);

    int mipmaplevel = int(mipmap);
    float alpha = mipmap - mipmaplevel;

    vec2 Start = vec2( 0 , 0 );
    vec2 End = vec2(  2.0f/3.0f, 1.0 );



    vec2 PreStart= vec2( 0 , 0 );
    vec2 PreEnd = vec2(  2.0f/3.0f, 1.0 );

    bool bRight = true;

    for(int i =0; i < mipmaplevel + 1; ++i)
    {
        float w = End.x - Start.x;
        float h = End.y - Start.y;

        float halfw = w/2.0f;
        float halfh = h/2.0f;

        float NextStartx = bRight ? End.x : Start.x;
        float NextStarty = bRight ? Start.y : End.y;
         
        vec2 NextStart = vec2( NextStartx, NextStarty);
        vec2 NextEnd = NextStart + vec2(halfw, halfh);

        PreStart = Start.xy;
        PreEnd = End.xy;

        Start = NextStart.xy;
        End = NextEnd.xy;

        bRight = !bRight;
    }


    FrontUv.x = mix(PreStart.x, PreEnd.x, uv.x);
    FrontUv.y = mix(PreStart.y, PreEnd.y, uv.y);
    EndUV.x = mix(Start.x, End.x, uv.x);
    EndUV.y = mix(Start.y, End.y, uv.y);

}

vec3 GetSkyLightReflection(vec3 ReflectionVector, float Roughness)
{
	float AbsoluteSpecularMip = ComputeReflectionCaptureMipFromRoughness(Roughness, 7);
    AbsoluteSpecularMip = min(AbsoluteSpecularMip, 7);
    AbsoluteSpecularMip = max(0, AbsoluteSpecularMip);

    ReflectionVector = normalize(ReflectionVector);
    vec3 uv = WorldDirToCubeMapUV(ReflectionVector);
    //uv.y = 1.0 -uv.y;

    float clampsize = 4.0f;
    uv.x = clamp(uv.x, clampsize/512f, 1.0f - clampsize/512f);

    vec2 uv0 = vec2(0,0);
    vec2 uv1 = vec2(0,0);

    float alpha = AbsoluteSpecularMip - int(AbsoluteSpecularMip);
    GetMipMapUV(uv.rg, AbsoluteSpecularMip, uv0, uv1);

    //uv0.g = 1.0f - uv0.g;
    //uv1.g = 1.0f - uv1.g;

	vec3 Reflection0 = texture(SkyLightTex.tex, uv0.rg, 0).rgb;
	vec3 Reflection1 = texture(SkyLightTex.tex, uv1.rg, 0).rgb;

    vec3 Reflection = Reflection0 * (1- alpha) + Reflection1* alpha;

	return Reflection;
}

vec3 EnvBRDF(vec3 SpecularColor, float roughness, float NoV)
{

    roughness = 1.0f - roughness;

    float size = 5.0f;
    NoV = clamp( NoV, size/ 128f, 1.0f - size/128f);
    roughness = clamp(roughness, size/32, 1.0f- size/32f);

    vec2 AB = texture( CosRoghnessTex.tex, vec2( NoV, roughness ), 0).rg;
	//vec3 GF = SpecularColor * AB.x + saturate( 50.0 * SpecularColor.g ) * AB.y;
	vec3 GF = SpecularColor * AB.x + AB.y;

	return GF;
}

vec3 envIrradiancex4(vec3 dir)
{
  float rot = environment_rotation * M_2PI;
  float crot = cos(rot);
  float srot = sin(rot);
  vec4 shDir = vec4(dir.xzy, 1.0);
  shDir = vec4(
    shDir.x * crot - shDir.y * srot,
    shDir.x * srot + shDir.y * crot,
    shDir.z,
    1.0);
  return max(vec3(0.0), vec3(
      dot(shDir, irrad_mat_red * shDir),
      dot(shDir, irrad_mat_green * shDir),
      dot(shDir, irrad_mat_blue * shDir)
    )) * environment_exposure;

    //Has Add Exposure
}


vec3 RotateDirWithEnvRotation(vec3 dir)
{
    float rot = -environment_rotation * M_2PI;
    float crot = cos(rot);
    float srot = sin(rot);

    vec3 shDir = dir;

    shDir = vec3(
        shDir.x * crot - shDir.z * srot,
        shDir.y,
        shDir.x * srot + shDir.z * crot);

    vec3 result = vec3(shDir.xyz);
    return result;
}

vec3 ACESToneMapping(vec3 color, float adapted_lum)
{
	const float A = 2.51f;
	const float B = 0.03f;
	const float C = 2.43f;
	const float D = 0.59f;
	const float E = 0.14f;

	color *= adapted_lum;
	return (color * (A * color + B)) / (color * (C * color + D) + E);
}




void shade(V2F inputs) {

    mainlightstruct mainlight;

    mainlight.lightcolor = lightcolor;
    mainlight.lightdir = normalize(lightdir);
    mainlight.lightirradiance = lightirradiance;

    if(b_RotateDirectionWithEnvironment)
    {
        mainlight.lightdir = normalize(RotateDirWithEnvRotation(mainlight.lightdir));
    }

    BxDFcontext context;

    // Fetch material parameters, and conversion to the specular/roughness model
    vec3 baseColor = getBaseColor(basecolor_tex, inputs.sparse_coord);

    float roughness = getRoughness(roughness_tex, inputs.sparse_coord);
    //roughness less than 0.02 is meanless
    roughness = max(0.02, roughness);
    

    float metallic = getMetallic(metallic_tex, inputs.sparse_coord);
    float specularLevel = getSpecularLevel(specularlevel_tex, inputs.sparse_coord);

    vec3 specularColor = ComputeF0(specularLevel, baseColor, metallic );
    vec3 diffuseColor = baseColor - baseColor * metallic;

    LocalVectors local = computeLocalFrame(inputs);
    //vec3 worldspacenormal = computeWSNormal(inputs.sparse_coord, inputs.tangent, inputs.bitangent, inputs.normal);


    vec3 N = local.normal;
    vec3 V = local.eye;
    vec3 L = -mainlight.lightdir;


    Init(context, N, V, L);

    alphaKill(inputs.sparse_coord);

    float occlusion = getAO(inputs.sparse_coord) * getShadowFactor();

    vec3 diffuse = mainlight.lightirradiance * mainlight.lightcolor * context.NoL * Diffuse_Lambert(diffuseColor);
    vec3 specular = mainlight.lightirradiance * mainlight.lightcolor * context.NoL * SpecularGGX(roughness, specularColor, context, context.NoL);

    diffuse = max(vec3(0.0), diffuse) * uniform_environment_exposure * DirectionalLightModifiler;
    specular = max(vec3(0.0), specular) * uniform_environment_exposure * DirectionalLightModifiler;

    vec3 LuminanceFactors = vec3(0.3,0.59,0.11);

    vec3 envIrradiancex4_New = envIrradiancex4(N) * (1.0 - EnvLightDesaturation) + dot(envIrradiancex4(N),LuminanceFactors) * EnvLightDesaturation;

    vec3 IBLDiffuse = envIrradiancex4_New * diffuseColor * occlusion;

    diffuse += IBLDiffuse * EnvLightModifiler;


    vec3 IBLSpecular = pbrComputeSpecular(local, specularColor, roughness);
    IBLSpecular = IBLSpecular * (1.0 - EnvLightDesaturation) + dot(IBLSpecular,LuminanceFactors) * EnvLightDesaturation;
    
    specular += IBLSpecular * EnvLightModifiler;


    vec3 emissivecolor = pbrComputeEmissive(emissive_tex, inputs.sparse_coord) * environment_exposure * EmissiveLightModifiler;

    vec3 totalL = emissivecolor + diffuse + specular;

    emissiveColorOutput(totalL);

   
}