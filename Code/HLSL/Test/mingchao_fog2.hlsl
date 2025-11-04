// ---- Created with 3Dmigoto v1.3.16 on Mon Nov  3 16:50:44 2025
Texture3D<float4> t9 : register(t9);

Texture3D<float4> t8 : register(t8);

Texture3D<float4> t7 : register(t7);

Texture3D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture3D<float4> t0 : register(t0);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb4 : register(b4)
{
  float4 cb4[85];
}

cbuffer cb3 : register(b3)
{
  float4 cb3[39];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[25];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[171];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[250];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD10,
  float4 v1 : TEXCOORD11,
  float4 v2 : SV_Position0,
  uint v3 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0,
  out float4 o1 : SV_Target1,
  out float oDepth : SV_DEPTH)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = -cb0[130].xy + v2.xy;
  r0.zw = r0.xy * cb0[131].zw + float2(-0.5,-0.5);
  r1.xy = v2.ww * r0.zw;
  r1.z = v2.w;
  r1.xyz = float3(2,-2,1) * r1.xyz;
  r2.xyzw = cb0[45].xyzw * v2.yyyy;
  r2.xyzw = v2.xxxx * cb0[44].xyzw + r2.xyzw;
  r2.xyzw = v2.zzzz * cb0[46].xyzw + r2.xyzw;
  r2.xyzw = cb0[47].xyzw + r2.xyzw;
  r2.xyz = r2.xyz / r2.www;
  r0.z = dot(-r2.xyz, -r2.xyz);
  r0.z = rsqrt(r0.z);
  r3.xyz = -r2.xyz * r0.zzz;
  r4.xyz = cb2[23].yyy * cb2[1].xyz;
  r4.xyz = cb2[23].xxx * cb2[0].xyz + r4.xyz;
  r4.xyz = cb2[23].zzz * cb2[2].xyz + r4.xyz;
  r4.xyz = cb2[3].xyz + r4.xyz;
  r4.xyz = -cb4[12].xyz + r4.xyz;
  r5.x = dot(cb4[13].xyz, r4.xyz);
  r5.y = dot(cb4[15].xyz, r4.xyz);
  r5.z = dot(cb4[17].xyz, r4.xyz);
  r4.xyz = r5.xyz / cb4[19].xyz;
  r5.xyz = cb2[24].yyy * cb2[1].xyz;
  r5.xyz = cb2[24].xxx * cb2[0].xyz + r5.xyz;
  r5.xyz = cb2[24].zzz * cb2[2].xyz + r5.xyz;
  r5.xyz = cb2[3].xyz + r5.xyz;
  r5.xyz = -cb4[12].xyz + r5.xyz;
  r6.x = dot(cb4[13].xyz, r5.xyz);
  r6.y = dot(cb4[15].xyz, r5.xyz);
  r6.z = dot(cb4[17].xyz, r5.xyz);
  r5.xyz = r6.xyz / cb4[19].xyz;
  r6.xyz = -cb4[12].xyz + cb0[67].xyz;
  r7.x = dot(cb4[13].xyz, r6.xyz);
  r7.y = dot(cb4[15].xyz, r6.xyz);
  r7.z = dot(cb4[17].xyz, r6.xyz);
  r6.xyz = r7.xyz / cb4[19].xyz;
  r0.zw = r1.xy / r1.zz;
  r0.zw = r0.zw * cb0[66].xy + cb0[66].wz;
  r1.xyzw = t2.SampleLevel(s2_s, r0.zw, 0).xyzw;
  r1.w = 255 * r1.w;
  r1.w = round(r1.w);
  r1.w = (uint)r1.w;
  r1.w = (int)r1.w & 15;
  r1.w = cmp((int)r1.w == 10);
  r1.xyz = saturate(r1.xyz);
  r1.xyz = float3(16777215,65535,255) * r1.xyz;
  r1.xyz = round(r1.xyz);
  r1.xyz = (uint3)r1.xyz;
  bitmask.y = ((~(-1 << 8)) << 0) & 0xffffffff;  r1.y = (((uint)r1.z << 0) & bitmask.y) | ((uint)r1.y & ~bitmask.y);
  bitmask.x = ((~(-1 << 16)) << 0) & 0xffffffff;  r1.x = (((uint)r1.y << 0) & bitmask.x) | ((uint)r1.x & ~bitmask.x);
  r1.x = (uint)r1.x;
  r1.x = 5.96046519e-08 * r1.x;
  r1.x = r1.w ? r1.x : 0;
  r1.y = r1.x * cb0[65].x + cb0[65].y;
  r1.x = r1.x * cb0[65].z + -cb0[65].w;
  r1.x = 1 / r1.x;
  r1.x = r1.y + r1.x;
  r0.z = t1.SampleLevel(s2_s, r0.zw, 0).x;
  r0.w = r0.z * cb0[65].x + cb0[65].y;
  r0.z = r0.z * cb0[65].z + -cb0[65].w;
  r0.z = 1 / r0.z;
  r0.z = r0.w + r0.z;
  r0.z = min(r1.x, r0.z);
  r0.w = dot(-r3.xyz, -r3.xyz);
  r0.w = sqrt(r0.w);
  r1.xyz = -r3.xyz / r0.www;
  r0.w = dot(cb0[18].xyz, cb0[18].xyz);
  r0.w = sqrt(r0.w);
  r7.xyz = cb0[18].xyz / r0.www;
  r0.w = dot(r1.xyz, r7.xyz);
  r0.z = r0.z / r0.w;
  r1.x = dot(cb4[13].xyz, r3.xyz);
  r1.y = dot(cb4[15].xyz, r3.xyz);
  r1.z = dot(cb4[17].xyz, r3.xyz);
  r1.xyz = r1.xyz / cb4[19].xyz;
  r0.w = dot(-r1.xyz, -r1.xyz);
  r0.w = sqrt(r0.w);
  r1.x = r0.z * r0.w;
  r7.x = dot(cb4[13].xyz, -r3.xyz);
  r7.y = dot(cb4[15].xyz, -r3.xyz);
  r7.z = dot(cb4[17].xyz, -r3.xyz);
  r1.yzw = r7.xyz / cb4[19].xyz;
  r3.w = dot(r1.yzw, r1.yzw);
  r3.w = sqrt(r3.w);
  r1.yzw = r1.yzw / r3.www;
  r7.xyz = -r6.xyz + r4.xyz;
  r8.xyz = -r6.xyz + r5.xyz;
  r7.xyz = r7.xyz / r1.yzw;
  r8.xyz = r8.xyz / r1.yzw;
  r9.xyz = min(r8.xyz, r7.xyz);
  r3.w = max(r9.x, r9.y);
  r3.w = max(r3.w, r9.z);
  r7.xyw = max(r8.xyz, r7.xyz);
  r4.w = min(r7.x, r7.y);
  r4.w = min(r4.w, r7.w);
  r3.w = min(r3.w, r1.x);
  r4.w = min(r4.w, r1.x);
  r6.w = cmp(r3.w < r4.w);
  r7.x = cmp(0 < r4.w);
  r6.w = r6.w ? r7.x : 0;
  r7.x = cmp(0 < r3.w);
  r7.y = r4.w + -r3.w;
  r7.x = r7.x ? r7.y : r4.w;
  r6.w = r6.w ? r7.x : 0;
  r6.w = cmp(r6.w < 0.00100000005);
  if (r6.w != 0) discard;
  r7.xy = cb0[154].xx + r0.xy;
  r7.xy = (uint2)r7.xy;
  r6.w = (uint)r7.y << 1;
  r6.w = (int)r6.w + (int)r7.x;
  r6.w = (uint)r6.w % 5;
  r6.w = (uint)r6.w;
  r0.xy = float2(0.015625,0.015625) * r0.xy;
  r0.x = t3.SampleBias(s3_s, r0.xy, cb0[145].y).x;
  r0.x = r6.w + r0.x;
  r0.x = cb4[77].w * r0.x;
  r7.xyw = cb0[144].zzz * cb4[75].xxx + cb4[23].xyz;
  r9.xyz = saturate(float3(10,10,10) * cb3[14].xyz);
  r10.xyz = r9.xyz * float3(-2,-2,-2) + float3(3,3,3);
  r9.xyz = r9.xyz * r9.xyz;
  r9.xyz = r10.xyz * r9.xyz;
  r10.xyz = float3(-0,-0,-1) + -cb3[13].xyz;
  r9.xyz = r9.xyz * r10.xyz + float3(0,0,1);
  r0.y = dot(r9.xyz, r9.xyz);
  r0.y = sqrt(r0.y);
  r10.xyz = r9.xyz / r0.yyy;
  r11.x = dot(cb4[13].xyz, r10.xyz);
  r11.y = dot(cb4[15].xyz, r10.xyz);
  r11.z = dot(cb4[17].xyz, r10.xyz);
  r10.xyz = r11.xyz / cb4[19].xyz;
  r0.y = dot(r10.xyz, r10.xyz);
  r0.y = sqrt(r0.y);
  r10.xyz = r10.xyz / r0.yyy;
  r0.y = dot(r9.xyz, r3.xyz);
  r6.w = cb4[75].y + -cb4[75].z;
  r0.y = -cb4[75].z + r0.y;
  r6.w = 1 / r6.w;
  r0.y = saturate(r6.w * r0.y);
  r6.w = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r6.w * r0.y;
  r3.w = max(0, r3.w);
  r0.x = 0.166666999 * r0.x;
  r6.w = dot(r1.yzw, r10.xyz);
  r8.zw = -cb4[54].xy * cb4[54].xy + float2(1,1);
  r9.xy = cb4[54].xy * cb4[54].xy + float2(1,1);
  r9.z = dot(r6.ww, cb4[54].xx);
  r9.x = r9.x + -r9.z;
  r9.x = log2(abs(r9.x));
  r9.x = 1.5 * r9.x;
  r9.x = exp2(r9.x);
  r9.x = 12.566 * r9.x;
  r8.z = r8.z / r9.x;
  r6.w = dot(r6.ww, -cb4[54].yy);
  r6.w = r9.y + -r6.w;
  r6.w = log2(abs(r6.w));
  r6.w = 1.5 * r6.w;
  r6.w = exp2(r6.w);
  r6.w = 12.566 * r6.w;
  r6.w = r8.w / r6.w;
  r6.w = 0.5 * r6.w;
  r6.w = r8.z * 0.5 + r6.w;
  r6.w = r6.w * cb4[54].w + cb4[54].z;
  r9.xyz = float3(0.5,0.5,0.5) * cb4[64].xyz;
  r10.y = r0.x * r9.x + r3.w;
  r11.xyzw = float4(500,500,-500,-500) / cb4[50].xyxy;
  r10.x = cmp(r4.w < r10.y);
  if (r10.x == 0) {
    r12.xyz = r1.yzw * r10.yyy + r6.xyz;
    r13.xy = r11.zw;
    r13.z = r4.z;
    r14.xyz = -r13.xyz + r12.xyz;
    r15.xy = r11.xy;
    r15.z = r5.z;
    r13.xyz = r15.xyz + -r13.xyz;
    r13.xyz = r14.xyz / r13.xyz;
    r13.xyz = cb0[144].zzz * cb4[47].xyz + r13.xyz;
    r13.xyzw = t8.SampleLevel(s0_s, r13.xyz, 0).xyzw;
    r14.xyz = cmp(r5.xyz < r12.xyz);
    r15.xyz = cmp(r12.xyz < r4.xyz);
    r3.w = (int)r14.x | (int)r15.x;
    r3.w = (int)r14.y | (int)r3.w;
    r3.w = (int)r15.y | (int)r3.w;
    r3.w = (int)r14.z | (int)r3.w;
    r3.w = (int)r15.z | (int)r3.w;
    if (r3.w == 0) {
      r3.w = cmp(0 < r13.w);
      if (r3.w != 0) {
        r14.xyz = cb4[51].xyz * r12.xyz;
        r14.xyz = r14.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r14.xyz = t7.Sample(s7_s, r14.xyz).xyz;
        r8.z = dot(cb4[52].xyz, float3(1,1,1));
        r15.xyz = cb4[52].xyz / r8.zzz;
        r8.z = dot(r14.xyz, r15.xyz);
        r8.w = 1 + -r13.w;
        r9.w = r8.w * r8.w;
        r8.w = r9.w * r8.w;
        r8.z = 1 + -r8.z;
        r8.z = r8.z * r8.w;
        r8.z = -r8.z * cb4[77].z + r13.w;
        r8.z = max(0, r8.z);
        r8.z = cb4[79].w * r8.z;
        r8.z = 0.300000012 * r8.z;
      } else {
        r8.z = 0;
      }
      r3.w = r3.w ? r8.z : 0;
    } else {
      r3.w = 0;
    }
    r8.z = cmp(0 < r3.w);
    if (r8.z != 0) {
      r8.z = saturate(r10.y / cb4[82].y);
      r8.z = r8.z * r8.z;
      r8.z = cb4[83].z * r8.z;
      r12.xyz = r12.xyz + -r4.xyz;
      r14.xyz = r5.xyz + -r4.xyz;
      r12.xyz = r12.xyz / r14.xyz;
      r12.xy = float2(-0.5,-0.5) + r12.xy;
      r12.xy = float2(-0.400000006,-0.400000006) + abs(r12.xy);
      r12.xy = float2(10,10) * r12.xy;
      r12.xy = max(float2(0,0), r12.xy);
      r12.xy = float2(1,1) + -r12.xy;
      r8.w = r12.x * r12.y;
      r8.z = r8.z * r8.w;
      r8.w = dot(cb4[55].xyz, r13.xyz);
      r9.w = log2(r12.z);
      r9.w = cb4[80].x * r9.w;
      r9.w = exp2(r9.w);
      r8.w = cb4[81].w * r8.w;
      r10.w = r8.w * r9.w;
      r8.w = -r8.w * r9.w + r9.w;
      r8.w = r0.y * r8.w + r10.w;
      r9.w = cb4[65].x * r3.w;
      r9.w = r9.w * r9.x;
      r9.w = r9.w * r6.w;
      r8.w = r9.w * r8.w;
      r12.x = r8.w * r8.z;
      r3.w = r3.w * r9.x;
      r3.w = cb4[78].y * r3.w;
      r3.w = -1.44269502 * r3.w;
      r3.w = exp2(r3.w);
      r3.w = -1 + r3.w;
      r3.w = r8.z * r3.w + 1;
      r13.y = 1 + -r3.w;
      r13.x = r13.y * r10.y;
      r8.z = cmp(r3.w < 0.00999999978);
      r3.w = r8.z ? 0 : r3.w;
      r12.yz = r12.xx;
    } else {
      r13.xy = float2(0,0);
      r3.w = 1;
      r12.xyz = float3(0,0,0);
      r8.z = 0;
    }
    r8.w = cb4[64].x * 0.5 + r10.y;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r13.xy = float2(0,0);
    r3.w = 1;
    r12.xyz = float3(0,0,0);
    r8.z = -1;
  }
  r8.z = (int)r10.x | (int)r8.z;
  if (r8.z == 0) {
    r8.w = cmp(r4.w < r10.y);
    r9.w = r10.y + -r4.w;
    r9.w = cb4[64].x * 0.5 + -r9.w;
    r10.w = -0.00100000005 + r4.w;
    r10.w = r8.z ? r10.y : r10.w;
    r9.w = r8.z ? r9.x : r9.w;
    r12.w = cmp((int)r8.z == 0);
    r10.y = r8.w ? r10.w : r10.y;
    r10.z = r8.w ? r9.w : r9.x;
    r10.x = r8.w ? r12.w : 0;
    if (r8.z == 0) {
      r14.xyz = r1.yzw * r10.yyy + r6.xyz;
      r15.xy = r11.zw;
      r15.z = r4.z;
      r16.xyz = -r15.xyz + r14.xyz;
      r17.xy = r11.xy;
      r17.z = r5.z;
      r15.xyz = r17.xyz + -r15.xyz;
      r15.xyz = r16.xyz / r15.xyz;
      r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
      r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
      r16.xyz = cmp(r5.xyz < r14.xyz);
      r17.xyz = cmp(r14.xyz < r4.xyz);
      r8.w = (int)r16.x | (int)r17.x;
      r8.w = (int)r16.y | (int)r8.w;
      r8.w = (int)r17.y | (int)r8.w;
      r8.w = (int)r16.z | (int)r8.w;
      r8.w = (int)r17.z | (int)r8.w;
      if (r8.w == 0) {
        r8.w = cmp(0 < r15.w);
        if (r8.w != 0) {
          r16.xyz = cb4[51].xyz * r14.xyz;
          r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
          r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
          r9.w = dot(cb4[52].xyz, float3(1,1,1));
          r17.xyz = cb4[52].xyz / r9.www;
          r9.w = dot(r16.xyz, r17.xyz);
          r10.w = 1 + -r15.w;
          r12.w = r10.w * r10.w;
          r10.w = r12.w * r10.w;
          r9.w = 1 + -r9.w;
          r9.w = r9.w * r10.w;
          r9.w = -r9.w * cb4[77].z + r15.w;
          r9.w = max(0, r9.w);
          r9.w = cb4[79].w * r9.w;
          r9.w = 0.300000012 * r9.w;
        } else {
          r9.w = 0;
        }
        r8.w = r8.w ? r9.w : 0;
      } else {
        r8.w = 0;
      }
      r9.w = cmp(0 < r8.w);
      if (r9.w != 0) {
        r9.w = saturate(r10.y / cb4[82].y);
        r9.w = r9.w * r9.w;
        r9.w = cb4[83].z * r9.w;
        r14.xyz = r14.xyz + -r4.xyz;
        r16.xyz = r5.xyz + -r4.xyz;
        r14.xyz = r14.xyz / r16.xyz;
        r13.zw = float2(-0.5,-0.5) + r14.xy;
        r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
        r13.zw = float2(10,10) * r13.zw;
        r13.zw = max(float2(0,0), r13.zw);
        r13.zw = float2(1,1) + -r13.zw;
        r10.w = r13.z * r13.w;
        r9.w = r10.w * r9.w;
        r10.w = dot(cb4[55].xyz, r15.xyz);
        r12.w = log2(r14.z);
        r12.w = cb4[80].x * r12.w;
        r12.w = exp2(r12.w);
        r10.w = cb4[81].w * r10.w;
        r13.z = r10.w * r12.w;
        r10.w = -r10.w * r12.w + r12.w;
        r10.w = r0.y * r10.w + r13.z;
        r12.w = cb4[65].x * r8.w;
        r12.w = r12.w * r10.z;
        r12.w = r12.w * r3.w;
        r12.w = r12.w * r6.w;
        r10.w = r12.w * r10.w;
        r12.xyz = r10.www * r9.www + r12.xyz;
        r8.w = r8.w * r10.z;
        r8.w = cb4[78].y * r8.w;
        r8.w = -1.44269502 * r8.w;
        r8.w = exp2(r8.w);
        r8.w = -1 + r8.w;
        r8.w = r9.w * r8.w + 1;
        r9.w = r8.w * r3.w;
        r8.w = -r3.w * r8.w + r3.w;
        r13.y = r13.y + r8.w;
        r13.x = r8.w * r10.y + r13.x;
        r8.w = cmp(r9.w < 0.00999999978);
        r10.w = r8.w ? 0 : r9.w;
        r3.w = r10.x ? r9.w : r10.w;
        r8.w = (int)r10.x | (int)r8.w;
      } else {
        r8.w = 0;
      }
      r9.w = r10.y + r10.z;
      r10.y = r8.w ? r10.y : r9.w;
    } else {
      r8.w = -1;
    }
    r8.z = (int)r8.z | (int)r8.w;
  } else {
    r10.z = r9.x;
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r16.xyz = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r16.xyz = t7.Sample(s7_s, r16.xyz).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r17.xyz = cb4[52].xyz / r8.www;
        r8.w = dot(r16.xyz, r17.xyz);
        r9.w = 1 + -r15.w;
        r10.w = r9.w * r9.w;
        r9.w = r10.w * r9.w;
        r8.w = 1 + -r8.w;
        r8.w = r8.w * r9.w;
        r8.w = -r8.w * cb4[77].z + r15.w;
        r8.w = max(0, r8.w);
        r8.w = cb4[79].w * r8.w;
        r8.w = 0.300000012 * r8.w;
      } else {
        r8.w = 0;
      }
      r8.z = r8.z ? r8.w : 0;
    } else {
      r8.z = 0;
    }
    r8.w = cmp(0 < r8.z);
    if (r8.w != 0) {
      r8.w = saturate(r10.y / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r13.zw = float2(-0.5,-0.5) + r14.xy;
      r13.zw = float2(-0.400000006,-0.400000006) + abs(r13.zw);
      r13.zw = float2(10,10) * r13.zw;
      r13.zw = max(float2(0,0), r13.zw);
      r13.zw = float2(1,1) + -r13.zw;
      r9.w = r13.z * r13.w;
      r8.w = r9.w * r8.w;
      r9.w = dot(cb4[55].xyz, r15.xyz);
      r10.w = log2(r14.z);
      r10.w = cb4[80].x * r10.w;
      r10.w = exp2(r10.w);
      r9.w = cb4[81].w * r9.w;
      r12.w = r9.w * r10.w;
      r9.w = -r9.w * r10.w + r10.w;
      r9.w = r0.y * r9.w + r12.w;
      r10.w = cb4[65].x * r8.z;
      r10.w = r10.w * r10.z;
      r10.w = r10.w * r3.w;
      r10.w = r10.w * r6.w;
      r9.w = r10.w * r9.w;
      r12.xyz = r9.www * r8.www + r12.xyz;
      r8.z = r8.z * r10.z;
      r8.z = cb4[78].y * r8.z;
      r8.z = -1.44269502 * r8.z;
      r8.z = exp2(r8.z);
      r8.z = -1 + r8.z;
      r8.z = r8.w * r8.z + 1;
      r8.w = r8.z * r3.w;
      r8.z = -r3.w * r8.z + r3.w;
      r13.y = r13.y + r8.z;
      r13.x = r8.z * r10.y + r13.x;
      r8.z = cmp(r8.w < 0.00999999978);
      r9.w = r8.z ? 0 : r8.w;
      r3.w = r10.x ? r8.w : r9.w;
      r8.z = (int)r10.x | (int)r8.z;
    } else {
      r8.z = 0;
    }
    r8.w = r10.y + r10.z;
    r10.y = r8.z ? r10.y : r8.w;
  } else {
    r8.z = -1;
  }
  if (r8.z == 0) {
    r8.z = cmp(r4.w < r10.y);
    r8.w = r10.y + -r4.w;
    r14.y = r10.z + -r8.w;
    r14.x = -0.00100000005 + r4.w;
    r14.z = -1;
    r10.xyz = r8.zzz ? r14.zxy : r10.xyz;
    r14.xyz = r1.yzw * r10.yyy + r6.xyz;
    r15.xy = r11.zw;
    r15.z = r4.z;
    r16.xyz = -r15.xyz + r14.xyz;
    r17.xy = r11.xy;
    r17.z = r5.z;
    r15.xyz = r17.xyz + -r15.xyz;
    r15.xyz = r16.xyz / r15.xyz;
    r15.xyz = cb0[144].zzz * cb4[47].xyz + r15.xyz;
    r15.xyzw = t8.SampleLevel(s0_s, r15.xyz, 0).xyzw;
    r16.xyz = cmp(r5.xyz < r14.xyz);
    r17.xyz = cmp(r14.xyz < r4.xyz);
    r8.z = (int)r16.x | (int)r17.x;
    r8.z = (int)r16.y | (int)r8.z;
    r8.z = (int)r17.y | (int)r8.z;
    r8.z = (int)r16.z | (int)r8.z;
    r8.z = (int)r17.z | (int)r8.z;
    if (r8.z == 0) {
      r8.z = cmp(0 < r15.w);
      if (r8.z != 0) {
        r16.xyz = cb4[51].xyz * r14.xyz;
        r7.xyw = r16.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r7.xyw;
        r7.xyw = t7.Sample(s7_s, r7.xyw).xyz;
        r8.w = dot(cb4[52].xyz, float3(1,1,1));
        r16.xyz = cb4[52].xyz / r8.www;
        r7.x = dot(r7.xyw, r16.xyz);
        r7.y = 1 + -r15.w;
        r7.w = r7.y * r7.y;
        r7.y = r7.w * r7.y;
        r7.x = 1 + -r7.x;
        r7.x = r7.x * r7.y;
        r7.x = -r7.x * cb4[77].z + r15.w;
        r7.x = max(0, r7.x);
        r7.x = cb4[79].w * r7.x;
        r7.x = 0.300000012 * r7.x;
      } else {
        r7.x = 0;
      }
      r7.x = r8.z ? r7.x : 0;
    } else {
      r7.x = 0;
    }
    r7.y = cmp(0 < r7.x);
    if (r7.y != 0) {
      r7.y = saturate(r10.y / cb4[82].y);
      r7.y = r7.y * r7.y;
      r7.y = cb4[83].z * r7.y;
      r14.xyz = r14.xyz + -r4.xyz;
      r16.xyz = r5.xyz + -r4.xyz;
      r14.xyz = r14.xyz / r16.xyz;
      r8.zw = float2(-0.5,-0.5) + r14.xy;
      r8.zw = float2(-0.400000006,-0.400000006) + abs(r8.zw);
      r8.zw = float2(10,10) * r8.zw;
      r8.zw = max(float2(0,0), r8.zw);
      r8.zw = float2(1,1) + -r8.zw;
      r7.w = r8.z * r8.w;
      r7.y = r7.y * r7.w;
      r7.w = dot(cb4[55].xyz, r15.xyz);
      r8.z = log2(r14.z);
      r8.z = cb4[80].x * r8.z;
      r8.z = exp2(r8.z);
      r7.w = cb4[81].w * r7.w;
      r8.w = r7.w * r8.z;
      r7.w = -r7.w * r8.z + r8.z;
      r7.w = r0.y * r7.w + r8.w;
      r8.z = cb4[65].x * r7.x;
      r8.z = r8.z * r10.z;
      r8.z = r8.z * r3.w;
      r8.z = r8.z * r6.w;
      r7.w = r8.z * r7.w;
      r12.xyz = r7.www * r7.yyy + r12.xyz;
      r7.x = r7.x * r10.z;
      r7.x = cb4[78].y * r7.x;
      r7.x = -1.44269502 * r7.x;
      r7.x = exp2(r7.x);
      r7.x = -1 + r7.x;
      r7.x = r7.y * r7.x + 1;
      r7.y = r7.x * r3.w;
      r7.x = -r3.w * r7.x + r3.w;
      r13.y = r13.y + r7.x;
      r13.x = r7.x * r10.y + r13.x;
      r7.x = cmp(r7.y < 0.00999999978);
      r7.w = r7.x ? 0 : r7.y;
      r3.w = r10.x ? r7.y : r7.w;
      r7.x = (int)r10.x | (int)r7.x;
    } else {
      r7.x = 0;
    }
    r7.y = r10.y + r10.z;
    r10.y = r7.x ? r10.y : r7.y;
  }
  r7.xy = cb4[64].yz * float2(0.5,0.5) + -r9.xy;
  r7.x = r0.x * abs(r7.x) + r10.y;
  r14.x = -0.00100000005 + r4.w;
  r10.yzw = r5.xyz + -r4.xyz;
  r15.xy = r11.zw;
  r15.z = r4.z;
  r11.z = r5.z;
  r11.xyz = r11.xyz + -r15.xyz;
  r14.z = -1;
  r16.xyz = r12.xyz;
  r5.z = cb4[65].y;
  r17.x = r7.x;
  r18.xy = r13.xy;
  r18.z = r3.w;
  r17.y = r9.y;
  r17.z = r10.x;
  r7.w = 0;
  r8.z = 20;
  while (true) {
    r8.w = cmp((int)r8.z >= 40);
    if (r8.w != 0) break;
    if (r17.z != 0) {
      break;
    }
    r8.w = cmp(r4.w < r17.x);
    r9.x = r17.x + -r4.w;
    r14.y = r17.y + -r9.x;
    r17.xyz = r8.www ? r14.xyz : r17.xyz;
    r19.xyz = r1.yzw * r17.xxx + r6.xyz;
    r20.xyz = r19.xyz + -r15.xyz;
    r20.xyz = r20.xyz / r11.xyz;
    r20.xyz = cb0[144].zzz * cb4[47].xyz + r20.xyz;
    r20.xyzw = t9.SampleLevel(s0_s, r20.xyz, r7.w).xyzw;
    r8.w = cmp(0 < r20.w);
    if (r8.w != 0) {
      r8.w = saturate(r17.x / cb4[82].y);
      r8.w = r8.w * r8.w;
      r8.w = cb4[83].z * r8.w;
      r19.xyz = r19.xyz + -r4.xyz;
      r19.xyz = r19.xyz / r10.yzw;
      r9.xw = float2(-0.5,-0.5) + r19.xy;
      r9.xw = float2(-0.400000006,-0.400000006) + abs(r9.xw);
      r9.xw = float2(10,10) * r9.xw;
      r9.xw = max(float2(0,0), r9.xw);
      r9.xw = float2(1,1) + -r9.xw;
      r9.x = r9.x * r9.w;
      r8.w = r9.x * r8.w;
      r9.x = dot(cb4[55].xyz, r20.xyz);
      r9.w = log2(r19.z);
      r9.w = cb4[80].x * r9.w;
      r9.w = exp2(r9.w);
      r9.x = cb4[81].w * r9.x;
      r11.w = r9.x * r9.w;
      r9.x = -r9.x * r9.w + r9.w;
      r9.x = r0.y * r9.x + r11.w;
      r9.w = r20.w * r5.z;
      r9.w = r9.w * r17.y;
      r9.w = r9.w * r18.z;
      r9.w = r9.w * r6.w;
      r9.x = r9.x * r9.w;
      r19.xyz = r9.xxx * r8.www + r16.xyz;
      r9.x = r20.w * r17.y;
      r9.x = cb4[78].y * r9.x;
      r9.x = -1.44269502 * r9.x;
      r9.x = exp2(r9.x);
      r9.x = -1 + r9.x;
      r8.w = r8.w * r9.x + 1;
      r9.x = r18.z * r8.w;
      r8.w = -r18.z * r8.w + r18.z;
      r9.w = r18.y + r8.w;
      r8.w = r8.w * r17.x + r18.x;
      if (r17.z != 0) {
        r16.xyz = r19.xyz;
        r18.x = r8.w;
        r18.yz = r9.wx;
        break;
      }
      r11.w = cmp(r9.x < 0.00999999978);
      if (r11.w != 0) {
        r16.xyz = r19.xyz;
        r18.x = r8.w;
        r18.y = r9.w;
        r18.z = 0;
        break;
      } else {
        r18.z = r9.x;
      }
      r16.xyz = r19.xyz;
      r18.x = r8.w;
      r18.y = r9.w;
    }
    r8.w = r17.x + r17.y;
    r9.x = cmp((int)r8.z == 29);
    r9.w = r0.x * abs(r7.y) + r8.w;
    r5.z = r9.x ? cb4[65].z : r5.z;
    r17.x = r9.x ? r9.w : r8.w;
    r17.y = r9.x ? r9.z : r17.y;
    r7.w = r9.x ? 1 : r7.w;
    r8.z = (int)r8.z + 1;
  }
  r7.xyw = r1.yzw * r4.www + r6.xyz;
  r8.zw = r7.xy + -r4.xy;
  r8.zw = r8.zw / r10.yz;
  r0.y = t5.Sample(s5_s, r8.zw).x;
  r9.xyz = float3(-0,-0,-2) + r4.xyz;
  r10.xyz = r9.xyz + -r6.xyz;
  r10.xyz = r10.xyz / r1.yzw;
  r4.xy = min(r10.xy, r8.xy);
  r3.w = max(r4.x, r4.y);
  r4.x = min(r10.z, r7.z);
  r3.w = max(r4.x, r3.w);
  r3.w = min(r3.w, r1.x);
  r3.w = max(0, r3.w);
  r4.x = cmp(0.00100000005 < r0.y);
  r4.y = cmp(r1.w < 0);
  r4.x = r4.y ? r4.x : 0;
  if (r4.x != 0) {
    r12.xyz = cb0[144].zzz * cb4[74].www + cb4[21].xyz;
    r4.x = saturate(r4.w / cb4[82].y);
    r4.x = r4.x * r4.x;
    r4.x = cb4[83].z * r4.x;
    r7.xyw = r7.xyw + -r15.xyz;
    r7.xyw = r7.xyw / r11.xyz;
    r7.xyw = cb0[144].zzz * cb4[47].xyz + r7.xyw;
    r7.xyw = t9.SampleLevel(s0_s, r7.xyw, 0).xyz;
    r4.w = dot(cb4[55].xyz, r7.xyw);
    r4.w = -1 + r4.w;
    r4.x = r4.x * r4.w + 1;
    r7.xy = max(r10.xy, r8.xy);
    r4.w = min(r7.x, r7.y);
    r5.z = max(r10.z, r7.z);
    r4.w = min(r5.z, r4.w);
    r4.w = min(r4.w, r1.x);
    r5.z = r4.w + -r3.w;
    r7.y = 0.100000001 * r5.z;
    r7.x = r7.y * r0.x + r3.w;
    r8.xyz = cb4[78].www * cb4[50].xyz;
    r10.xyz = cb0[144].zzz * cb4[49].xyz + r12.xyz;
    r0.x = cmp(r4.w < r7.x);
    if (r0.x == 0) {
      r11.xyz = r1.yzw * r7.xxx + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r5.w = r15.z;
      r13.xyz = -r9.xyz + r5.xyw;
      r12.xyz = r12.zxy / r13.zxy;
      r13.xy = cmp(r5.xy < r11.xy);
      r14.xyz = cmp(r11.xyz < r9.xyz);
      r5.w = (int)r13.x | (int)r14.x;
      r5.w = (int)r13.y | (int)r5.w;
      r5.w = (int)r14.y | (int)r5.w;
      r7.w = cmp(r4.z < r11.z);
      r5.w = (int)r5.w | (int)r7.w;
      r5.w = (int)r14.z | (int)r5.w;
      if (r5.w == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.w = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.wwww;
        r5.w = dot(r11.xyzw, r13.xyzw);
        r5.w = cb4[83].x * 0.100000001 + r5.w;
      } else {
        r5.w = 0;
      }
      r7.w = cb4[82].w * r0.y;
      r5.w = r7.w * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r7.w = r11.x * r11.y;
      r5.w = r7.w * r5.w;
      r7.w = cmp(0 < r5.w);
      r12.x = saturate(r12.x);
      r8.w = log2(r12.x);
      r8.w = cb4[80].w * r8.w;
      r8.w = exp2(r8.w);
      r9.w = cb4[82].z * r5.w;
      r10.w = min(cb4[81].y, r7.y);
      r9.w = r10.w * r9.w;
      r9.w = r9.w * r18.z;
      r9.w = r9.w * r6.w;
      r9.w = r9.w * r4.x;
      r11.xyz = r8.www * r9.www + r16.xyz;
      r5.w = r5.w * r7.y;
      r5.w = cb4[78].y * r5.w;
      r5.w = -1.44269502 * r5.w;
      r5.w = exp2(r5.w);
      r8.w = r18.z * r5.w;
      r5.w = -r18.z * r5.w + r18.z;
      r12.y = r18.y + r5.w;
      r12.x = r5.w * r7.x + r18.x;
      r5.w = cmp(r8.w < 0.00999999978);
      r12.z = r5.w ? 0 : r8.w;
      r16.xyz = r7.www ? r11.xyz : r16.xyz;
      r18.xyz = r7.www ? r12.xyz : r18.xyz;
      r5.w = r5.w ? r7.w : 0;
      r7.w = r5.z * 0.100000001 + r7.x;
      r7.x = r5.w ? r7.x : r7.w;
    } else {
      r5.w = -1;
    }
    r0.x = (int)r0.x | (int)r5.w;
    if (r0.x == 0) {
      if (r0.x == 0) {
        r5.w = cmp(r4.w < r7.x);
        r7.w = r7.x + -r4.w;
        r11.z = r5.z * 0.100000001 + -r7.w;
        r11.y = -0.00100000005 + r4.w;
        r7.yz = r5.ww ? r11.zy : r7.yx;
        r11.xyz = r1.yzw * r7.zzz + r6.xyz;
        r12.xyz = r11.xyz + -r9.xyz;
        r15.xy = r5.xy;
        r13.xyz = r15.xyz + -r9.xyz;
        r12.xyz = r12.zxy / r13.zxy;
        r13.xy = cmp(r5.xy < r11.xy);
        r14.xyz = cmp(r11.xyz < r9.xyz);
        r5.z = (int)r13.x | (int)r14.x;
        r5.z = (int)r13.y | (int)r5.z;
        r5.z = (int)r14.y | (int)r5.z;
        r7.w = cmp(r4.z < r11.z);
        r5.z = (int)r5.z | (int)r7.w;
        r5.z = (int)r14.z | (int)r5.z;
        if (r5.z == 0) {
          r11.xyz = r11.xyz * r8.xyz;
          r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
          r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
          r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
          r13.xyzw = cb4[63].xyzw / r5.zzzz;
          r5.z = dot(r11.xyzw, r13.xyzw);
          r5.z = cb4[83].x * 0.100000001 + r5.z;
        } else {
          r5.z = 0;
        }
        r7.w = cb4[82].w * r0.y;
        r5.z = r7.w * r5.z;
        r11.xy = float2(-0.5,-0.5) + r12.yz;
        r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
        r11.xy = float2(10,10) * r11.xy;
        r11.xy = max(float2(0,0), r11.xy);
        r11.xy = float2(1,1) + -r11.xy;
        r7.w = r11.x * r11.y;
        r5.z = r7.w * r5.z;
        r7.w = cmp(0 < r5.z);
        r12.x = saturate(r12.x);
        r8.w = log2(r12.x);
        r8.w = cb4[80].w * r8.w;
        r8.w = exp2(r8.w);
        r9.w = cb4[82].z * r5.z;
        r10.w = min(cb4[81].y, r7.y);
        r9.w = r10.w * r9.w;
        r9.w = r9.w * r18.z;
        r9.w = r9.w * r6.w;
        r9.w = r9.w * r4.x;
        r11.xyz = r8.www * r9.www + r16.xyz;
        r5.z = r5.z * r7.y;
        r5.z = cb4[78].y * r5.z;
        r5.z = -1.44269502 * r5.z;
        r5.z = exp2(r5.z);
        r8.w = r18.z * r5.z;
        r5.z = -r18.z * r5.z + r18.z;
        r12.y = r18.y + r5.z;
        r12.x = r5.z * r7.z + r18.x;
        r5.z = cmp(r8.w < 0.00999999978);
        r9.w = r5.z ? 0 : r8.w;
        r12.z = r5.w ? r8.w : r9.w;
        r5.z = (int)r5.w | (int)r5.z;
        r16.xyz = r7.www ? r11.xyz : r16.xyz;
        r18.xyz = r7.www ? r12.xyz : r18.xyz;
        r5.z = r5.z ? r7.w : 0;
        r5.w = r7.z + r7.y;
        r7.x = r5.z ? r7.z : r5.w;
      } else {
        r5.z = -1;
      }
      r0.x = (int)r0.x | (int)r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.z = r7.y + -r5.z;
      r11.y = -0.00100000005 + r4.w;
      r7.yz = r0.xx ? r11.zy : r7.yx;
      r11.xyz = r1.yzw * r7.zzz + r6.xyz;
      r12.xyz = r11.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r13.xyz = r15.xyz + -r9.xyz;
      r12.xyz = r12.zxy / r13.zxy;
      r5.zw = cmp(r5.xy < r11.xy);
      r13.xyz = cmp(r11.xyz < r9.xyz);
      r5.z = (int)r5.z | (int)r13.x;
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.y | (int)r5.z;
      r5.w = cmp(r4.z < r11.z);
      r5.z = (int)r5.w | (int)r5.z;
      r5.z = (int)r13.z | (int)r5.z;
      if (r5.z == 0) {
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r11.xyzw = t6.Sample(s6_s, r11.xyz).xyzw;
        r5.z = dot(cb4[63].xyzw, float4(1,1,1,1));
        r13.xyzw = cb4[63].xyzw / r5.zzzz;
        r5.z = dot(r11.xyzw, r13.xyzw);
        r5.z = cb4[83].x * 0.100000001 + r5.z;
      } else {
        r5.z = 0;
      }
      r5.w = cb4[82].w * r0.y;
      r5.z = r5.z * r5.w;
      r11.xy = float2(-0.5,-0.5) + r12.yz;
      r11.xy = float2(-0.400000006,-0.400000006) + abs(r11.xy);
      r11.xy = float2(10,10) * r11.xy;
      r11.xy = max(float2(0,0), r11.xy);
      r11.xy = float2(1,1) + -r11.xy;
      r5.w = r11.x * r11.y;
      r5.z = r5.z * r5.w;
      r5.w = cmp(0 < r5.z);
      r12.x = saturate(r12.x);
      r7.w = log2(r12.x);
      r7.w = cb4[80].w * r7.w;
      r7.w = exp2(r7.w);
      r8.w = cb4[82].z * r5.z;
      r9.w = min(cb4[81].y, r7.y);
      r8.w = r9.w * r8.w;
      r8.w = r8.w * r18.z;
      r8.w = r8.w * r6.w;
      r8.w = r8.w * r4.x;
      r11.xyz = r7.www * r8.www + r16.xyz;
      r5.z = r5.z * r7.y;
      r5.z = cb4[78].y * r5.z;
      r5.z = -1.44269502 * r5.z;
      r5.z = exp2(r5.z);
      r7.w = r18.z * r5.z;
      r5.z = -r18.z * r5.z + r18.z;
      r12.y = r18.y + r5.z;
      r12.x = r5.z * r7.z + r18.x;
      r5.z = cmp(r7.w < 0.00999999978);
      r8.w = r5.z ? 0 : r7.w;
      r12.z = r0.x ? r7.w : r8.w;
      r0.x = (int)r0.x | (int)r5.z;
      r16.xyz = r5.www ? r11.xyz : r16.xyz;
      r18.xyz = r5.www ? r12.xyz : r18.xyz;
      r0.x = r0.x ? r5.w : 0;
      r5.z = r7.z + r7.y;
      r7.x = r0.x ? r7.z : r5.z;
    } else {
      r0.x = -1;
    }
    if (r0.x == 0) {
      r0.x = cmp(r4.w < r7.x);
      r5.z = r7.x + -r4.w;
      r11.y = r7.y + -r5.z;
      r11.x = -0.00100000005 + r4.w;
      r5.zw = r0.xx ? r11.xy : r7.xy;
      r7.xyz = r1.yzw * r5.zzz + r6.xyz;
      r11.xyz = r7.xyz + -r9.xyz;
      r15.xy = r5.xy;
      r12.xyz = r15.xyz + -r9.xyz;
      r11.xyz = r11.zxy / r12.zxy;
      r5.xy = cmp(r5.xy < r7.xy);
      r9.xyz = cmp(r7.xyz < r9.xyz);
      r1.w = (int)r5.x | (int)r9.x;
      r1.w = (int)r5.y | (int)r1.w;
      r1.w = (int)r9.y | (int)r1.w;
      r4.z = cmp(r4.z < r7.z);
      r1.w = (int)r1.w | (int)r4.z;
      r1.w = (int)r9.z | (int)r1.w;
      if (r1.w == 0) {
        r7.xyz = r8.xyz * r7.xyz;
        r7.xyz = r7.xyz * float3(0.00100000005,0.00100000005,0.00100000005) + r10.xyz;
        r7.xyzw = t6.Sample(s6_s, r7.xyz).xyzw;
        r1.w = dot(cb4[63].xyzw, float4(1,1,1,1));
        r8.xyzw = cb4[63].xyzw / r1.wwww;
        r1.w = dot(r7.xyzw, r8.xyzw);
        r1.w = cb4[83].x * 0.100000001 + r1.w;
      } else {
        r1.w = 0;
      }
      r0.y = cb4[82].w * r0.y;
      r0.y = r1.w * r0.y;
      r4.zw = float2(-0.5,-0.5) + r11.yz;
      r4.zw = float2(-0.400000006,-0.400000006) + abs(r4.zw);
      r4.zw = float2(10,10) * r4.zw;
      r4.zw = max(float2(0,0), r4.zw);
      r4.zw = float2(1,1) + -r4.zw;
      r1.w = r4.z * r4.w;
      r0.y = r1.w * r0.y;
      r1.w = cmp(0 < r0.y);
      r11.x = saturate(r11.x);
      r4.z = log2(r11.x);
      r4.z = cb4[80].w * r4.z;
      r4.z = exp2(r4.z);
      r4.w = cb4[82].z * r0.y;
      r5.x = min(cb4[81].y, r5.w);
      r4.w = r5.x * r4.w;
      r4.w = r4.w * r18.z;
      r4.w = r4.w * r6.w;
      r4.x = r4.w * r4.x;
      r4.xzw = r4.zzz * r4.xxx + r16.xyz;
      r0.y = r0.y * r5.w;
      r0.y = cb4[78].y * r0.y;
      r0.y = -1.44269502 * r0.y;
      r0.y = exp2(r0.y);
      r5.x = r18.z * r0.y;
      r0.y = -r18.z * r0.y + r18.z;
      r7.y = r18.y + r0.y;
      r7.x = r0.y * r5.z + r18.x;
      r0.y = cmp(r5.x < 0.00999999978);
      r0.y = r0.y ? 0 : r5.x;
      r7.z = r0.x ? r5.x : r0.y;
      r16.xyz = r1.www ? r4.xzw : r16.xyz;
      r18.xyz = r1.www ? r7.xyz : r18.xyz;
    }
  }
  r0.x = cmp(r18.y == 0.000000);
  r0.y = r18.x / r18.y;
  r0.x = r0.x ? r1.x : r0.y;
  r1.xy = r1.yz * r3.ww + r6.xy;
  r1.xy = -cb4[30].xy + r1.xy;
  r1.zw = cb4[56].xy + -cb4[30].xy;
  r1.xy = r1.xy / r1.zw;
  r0.y = t4.Sample(s4_s, r1.xy).x;
  r0.y = 1 + -r0.y;
  r0.y = r4.y ? r0.y : 0;
  r0.y = max(r18.z, r0.y);
  r1.x = dot(cb0[189].xyz, float3(0.300000012,0.589999974,0.109999999));
  r1.xyz = -cb0[189].xyz + r1.xxx;
  r1.xyz = cb4[83].www * r1.xyz + cb0[189].xyz;
  r1.xyz = cb4[68].xyz * r1.xyz;
  r4.xyz = float3(1.20000005,1.20000005,1.20000005) * r1.xyz;
  r5.xyz = saturate(float3(3.33333325,3.33333325,3.33333325) * cb3[14].xyz);
  r6.xyz = r5.xyz * float3(-2,-2,-2) + float3(3,3,3);
  r5.xyz = r5.xyz * r5.xyz;
  r5.xyz = r6.xyz * r5.xyz;
  r6.xyz = cb4[70].xyz * cb3[14].xyz + -r4.xyz;
  r4.xyz = r5.xyz * r6.xyz + r4.xyz;
  r1.xyz = r16.xyz * r4.xyz + r1.xyz;
  r4.xyz = -cb3[38].xyz + cb3[37].xyz;
  r4.xyz = r16.xyz * r4.xyz + cb3[38].xyz;
  r4.xyz = r4.xyz + -r1.xyz;
  r1.xyz = cb3[11].zzz * r4.xyz + r1.xyz;
  r4.xyz = cb4[71].xyz + -r1.xyz;
  r1.xyz = cb4[84].xxx * r4.xyz + r1.xyz;
  r0.y = 1 + -r0.y;
  r4.w = saturate(cb4[84].y * r0.y);
  r0.x = r0.x / r0.w;
  r5.yzw = -r3.xyz * r0.xxx;
  r0.y = cmp(0.5 < cb1[160].w);
  r6.yzw = float3(1,1,-1) * r5.yzw;
  r6.x = -cb0[67].z;
  r5.x = cb0[67].z;
  r5.xyzw = r0.yyyy ? r6.yzxw : r5.yzxw;
  r0.w = 1 + -cb1[154].x;
  r1.w = -cb1[159].y + cb0[67].z;
  r3.w = cb1[159].z + -cb1[159].y;
  r1.w = saturate(r1.w / r3.w);
  r6.xy = -cb1[160].xy + cb1[153].zx;
  r6.xy = r1.ww * r6.xy + cb1[160].xy;
  r3.w = 65536 + r6.y;
  r3.w = min(3.40282347e+38, r3.w);
  r3.w = min(r5.z, r3.w);
  r6.z = r5.z + -r3.w;
  r5.z = r6.z + r5.w;
  r5.w = dot(r5.xyz, r5.xyz);
  r6.z = rsqrt(r5.w);
  r6.w = r6.z * r5.w;
  r7.xyz = r6.zzz * r5.xyz;
  r5.x = cmp(6000000 >= r6.w);
  r5.x = r5.x ? 1.000000 : 0;
  r5.y = r5.w * r6.z + -2000000;
  r5.y = saturate(-1.24999997e-06 * r5.y);
  r7.w = -cb1[159].w + cb1[153].y;
  r1.w = r1.w * r7.w + cb1[159].w;
  r1.w = r1.w + -r6.x;
  r1.w = r5.y * r1.w + r6.x;
  r1.w = 0.00100000005 * r1.w;
  r5.y = max(0.00999999978, cb1[153].w);
  r6.x = r5.y * r6.z;
  r3.w = r6.x * r5.z + r3.w;
  r5.z = -r6.x * r5.z + r5.z;
  r5.y = -r5.y * r6.z + 1;
  r6.x = r5.y * r5.y;
  r5.y = r6.x * r5.y;
  r6.x = r5.y * r6.w;
  r7.w = r5.w * r6.z + -cb1[152].z;
  r3.w = r3.w + -r6.y;
  r3.w = r3.w * r1.w;
  r3.w = max(-127, r3.w);
  r3.w = exp2(-r3.w);
  r3.w = cb1[152].w * r3.w;
  r3.w = 0.00100000005 * r3.w;
  r1.w = r5.z * r1.w;
  r1.w = max(-127, r1.w);
  r5.z = exp2(-r1.w);
  r5.z = 1 + -r5.z;
  r5.z = r5.z / r1.w;
  r1.w = cmp(0.00999999978 < abs(r1.w));
  r1.w = r1.w ? r5.z : 0.693147182;
  r1.w = r3.w * r1.w;
  r3.w = r1.w * r6.x;
  r5.zw = r5.ww * r6.zz + -cb1[158].xw;
  r6.x = cb1[158].y + -cb1[158].x;
  r5.z = saturate(r5.z / r6.x);
  r5.z = log2(r5.z);
  r5.z = cb1[158].z * r5.z;
  r5.z = exp2(r5.z);
  r6.xyz = cb1[156].xyz + -cb1[155].xyz;
  r6.xyz = r5.zzz * r6.xyz + cb1[155].xyz;
  r5.z = saturate(r5.w / cb1[159].x);
  r5.x = r5.x * r5.z;
  r5.z = log2(cb1[152].w);
  r5.z = 0.300000012 * r5.z;
  r5.z = exp2(r5.z);
  r8.xyz = cb1[151].xyz * cb0[167].xyz;
  r8.xyz = cb1[152].xxx * r8.xyz;
  r5.w = cmp(6 < cb1[161].x);
  r8.w = cmp(cb1[161].x < 18);
  r5.w = r5.w ? r8.w : 0;
  r9.xyz = r5.www ? cb0[163].xyz : cb0[164].xyz;
  r10.xyz = float3(1,1,-1) * r9.xyz;
  r9.xyz = r0.yyy ? r10.xyz : r9.xyz;
  r5.w = dot(r9.xyz, r7.xyz);
  r5.w = r5.w * 0.5 + 0.5;
  r7.x = abs(r7.z) * cb1[152].y + -cb1[152].y;
  r7.x = cb1[161].y * r7.x + cb1[152].y;
  r7.y = r5.w * r5.w;
  r7.y = r7.y * r7.y;
  r7.y = saturate(r7.y * r5.w);
  r5.w = r5.w * 37.5102005 + -37.5102005;
  r5.w = r5.w * r7.x;
  r5.w = 1.44269502 * r5.w;
  r5.w = exp2(r5.w);
  r5.w = min(1, r5.w);
  r5.w = r5.w * r7.y;
  r1.w = r1.w * r7.w;
  r1.w = exp2(-r1.w);
  r1.w = min(1, r1.w);
  r1.w = 1 + -r1.w;
  r5.y = r5.y * r6.w + -500000;
  r5.y = saturate(1.99999999e-06 * r5.y);
  r1.w = max(r5.y, r1.w);
  r1.w = r5.w * r1.w;
  r3.w = exp2(-r3.w);
  r3.w = min(1, r3.w);
  r0.w = max(r3.w, r0.w);
  r3.w = saturate(cb1[152].x);
  r5.y = r3.w * -r1.w + 1;
  r5.y = r5.y * r0.w;
  r5.x = -r5.x * r5.z + 1;
  r5.x = max(0, r5.x);
  r5.w = min(r5.y, r5.x);
  r7.xyz = cb0[249].xxx * -cb1[157].xyz + cb1[157].xyz;
  r7.xyz = r7.xyz + -r6.xyz;
  r6.xyz = r0.www * r7.xyz + r6.xyz;
  r0.w = saturate(cb1[152].x * r1.w);
  r7.xyz = r8.xyz * float3(0.0795774683,0.0795774683,0.0795774683) + -r6.xyz;
  r6.xyz = r0.www * r7.xyz + r6.xyz;
  r0.w = 1 + -r5.w;
  r5.xyz = r6.xyz * r0.www;
  r0.w = cmp(0 < cb0[159].w);
  if (r0.w != 0) {
    r6.xyz = float3(1,1,-1) * r2.xyz;
    r6.w = cb0[67].z;
    r2.w = cb0[67].z;
    r6.xyzw = r0.yyyy ? r6.xyzw : r2.xyzw;
    r0.y = 1 + -cb1[164].y;
    r0.w = 65536 + r6.w;
    r0.w = min(r6.w, r0.w);
    r1.w = r6.w + -r0.w;
    r6.z = r6.z + r1.w;
    r1.w = dot(r6.xyz, r6.xyz);
    r2.w = rsqrt(r1.w);
    r7.x = r2.w * r1.w;
    r7.yzw = r6.xyz * r2.www;
    r6.x = cmp(6000000 >= r7.x);
    r6.x = r6.x ? 1.000000 : 0;
    r6.y = r1.w * r2.w + -2000000;
    r6.y = saturate(-1.24999997e-06 * r6.y);
    r8.w = cb1[163].z + -cb1[163].w;
    r6.y = r6.y * r8.w + cb1[163].w;
    r6.y = 0.00100000005 * r6.y;
    r8.w = max(0.00999999978, cb1[164].x);
    r9.w = r8.w * r2.w;
    r0.w = r9.w * r6.z + r0.w;
    r6.z = -r9.w * r6.z + r6.z;
    r8.w = -r8.w * r2.w + 1;
    r9.w = r8.w * r8.w;
    r8.w = r9.w * r8.w;
    r9.w = r8.w * r7.x;
    r10.x = r1.w * r2.w + -cb1[152].z;
    r0.w = r0.w + -r6.w;
    r0.w = r6.y * r0.w;
    r0.w = max(-127, r0.w);
    r0.w = exp2(-r0.w);
    r0.w = cb1[163].y * r0.w;
    r0.w = 0.00100000005 * r0.w;
    r6.y = r6.y * r6.z;
    r6.y = max(-127, r6.y);
    r6.z = exp2(-r6.y);
    r6.z = 1 + -r6.z;
    r6.z = r6.z / r6.y;
    r6.y = cmp(0.00999999978 < abs(r6.y));
    r6.y = r6.y ? r6.z : 0.693147182;
    r0.w = r6.y * r0.w;
    r6.y = r0.w * r9.w;
    r6.zw = r1.ww * r2.ww + -cb1[168].xw;
    r1.w = cb1[168].y + -cb1[168].x;
    r1.w = saturate(r6.z / r1.w);
    r1.w = log2(r1.w);
    r1.w = cb1[168].z * r1.w;
    r1.w = exp2(r1.w);
    r10.yzw = cb1[166].xyz + -cb1[165].xyz;
    r10.yzw = r1.www * r10.yzw + cb1[165].xyz;
    r1.w = saturate(r6.w / cb1[169].x);
    r1.w = r6.x * r1.w;
    r2.w = log2(cb1[163].y);
    r2.w = 0.300000012 * r2.w;
    r2.w = exp2(r2.w);
    r6.x = dot(r9.xyz, r7.yzw);
    r6.x = r6.x * 0.5 + 0.5;
    r6.z = abs(r7.w) * cb1[152].y + -cb1[152].y;
    r6.z = cb1[161].y * r6.z + cb1[152].y;
    r6.w = r6.x * r6.x;
    r6.w = r6.w * r6.w;
    r6.w = saturate(r6.w * r6.x);
    r6.x = r6.x * 37.5102005 + -37.5102005;
    r6.x = r6.x * r6.z;
    r6.x = 1.44269502 * r6.x;
    r6.x = exp2(r6.x);
    r6.x = min(1, r6.x);
    r6.x = r6.x * r6.w;
    r0.w = r0.w * r10.x;
    r0.w = exp2(-r0.w);
    r0.w = min(1, r0.w);
    r0.w = 1 + -r0.w;
    r6.z = r8.w * r7.x + -500000;
    r6.z = saturate(1.99999999e-06 * r6.z);
    r0.w = max(r6.z, r0.w);
    r0.w = r6.x * r0.w;
    r6.x = exp2(-r6.y);
    r6.x = min(1, r6.x);
    r0.y = max(r6.x, r0.y);
    r3.w = r3.w * -r0.w + 1;
    r3.w = r3.w * r0.y;
    r1.w = -r1.w * r2.w + 1;
    r1.w = max(0, r1.w);
    r6.w = min(r3.w, r1.w);
    r7.xyz = cb1[167].xyz + -r10.yzw;
    r7.xyz = r0.yyy * r7.xyz + r10.yzw;
    r0.y = saturate(cb1[152].x * r0.w);
    r8.xyz = r8.xyz * float3(0.0795774683,0.0795774683,0.0795774683) + -r7.xyz;
    r7.xyz = r0.yyy * r8.xyz + r7.xyz;
    r0.y = 1 + -r6.w;
    r6.xyz = r7.xyz * r0.yyy;
    r6.xyzw = r6.xyzw + -r5.xyzw;
    r5.xyzw = cb0[159].wwww * r6.xyzw + r5.xyzw;
  }
  r0.y = cmp(0 < cb1[170].w);
  if (r0.y != 0) {
    r3.xyz = -r3.xyz * r0.xxx + cb0[67].xyz;
    r6.xyz = cb0[5].xyw * r3.yyy;
    r3.xyw = r3.xxx * cb0[4].xyw + r6.xyz;
    r3.xyz = r3.zzz * cb0[6].xyw + r3.xyw;
    r3.xyz = cb0[7].xyw + r3.xyz;
    r0.yw = r3.xy / r3.zz;
    r6.xy = r0.yw * float2(0.5,-0.5) + float2(0.5,0.5);
    r0.y = r3.z * cb0[218].x + cb0[218].y;
    r0.y = log2(r0.y);
    r0.y = cb0[218].z * r0.y;
    r6.z = cb0[217].z * r0.y;
    r3.xyzw = t0.SampleLevel(s1_s, r6.xyz, 0).xyzw;
    r5.xyz = r5.xyz * r3.www + r3.xyz;
    r5.w = r3.w * r5.w;
  }
  r4.xyz = max(float3(0,0,0), r1.xyz);
  r0.y = cmp(0 < cb0[142].x);
  if (r0.y != 0) {
    r1.xyz = -cb0[70].xyz + r2.xyz;
    r2.xyz = -cb2[5].xyz + r1.xyz;
    r3.xyz = float3(1,1,1) + cb2[19].xyz;
    r2.xyz = cmp(r3.xyz < abs(r2.xyz));
    r0.y = (int)r2.y | (int)r2.x;
    r0.y = (int)r2.z | (int)r0.y;
    r0.w = dot(r1.xyz, float3(0.577000022,0.577000022,0.577000022));
    r0.w = 0.00200000009 * r0.w;
    r0.w = frac(r0.w);
    r0.w = cmp(0.5 < r0.w);
    r1.yzw = r0.www ? float3(0,1,1) : float3(1,1,0);
    r1.x = 1;
    r4.xyzw = r0.yyyy ? r1.yzwx : r4.xyzw;
    o0.w = r4.w;
  } else {
    o0.w = r4.w;
  }
  r1.xyz = r4.xyz * r5.www + r5.xyz;
  r0.y = dot(r1.xyz, float3(0.298999995,0.587000012,0.114));
  r2.xyz = r0.yyy + -r1.xyz;
  r1.xyz = cb0[248].www * r2.xyz + r1.xyz;
  r1.xyz = cb0[247].xyz * r1.xyz;
  r1.xyz = min(float3(0,0,0), -r1.xyz);
  o0.xyz = -r1.xyz;
  r0.x = 9.99999975e-06 * r0.x;
  o1.x = min(65504, r0.x);
  r0.x = 9.99999975e-06 * r0.z;
  o1.y = min(65504, r0.x);
  o1.zw = float2(0,0);
  oDepth = 0;
  return;
}