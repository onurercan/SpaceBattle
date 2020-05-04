// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Shader Graphs/ParticleAdditive_HDR" {
Properties {
[HDR]  Color_BF1BE879 ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
[NoScaleOffset]  Texture2D_8F5E6CBE ("MainTexture", 2D) = "white" { }
}
SubShader { 
 Tags { "QUEUE"="Transparent+0" "RenderType"="Transparent" "RenderPipeline"="UniversalPipeline" }
 Pass {
  Name "Pass"
  Tags { "QUEUE"="Transparent+0" "RenderType"="Transparent" "RenderPipeline"="UniversalPipeline" }
  ZWrite Off
  Cull Off
  Blend One One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Color"

Constant Buffer "VGlobals" (64 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct UnityPerDraw_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_LODFade;
    float4 unity_WorldTransformParams;
    float4 unity_LightData;
    float4 unity_LightIndices[2];
    float4 unity_ProbesOcclusion;
    float4 unity_SpecCube0_HDR;
    float4 unity_LightmapST;
    float4 unity_DynamicLightmapST;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
};

struct Mtl_VertexIn
{
    float3 POSITION0 [[ attribute(0) ]] ;
    float4 TEXCOORD0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    output.TEXCOORD0 = input.TEXCOORD0;
    output.TEXCOORD1 = input.COLOR0;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "Texture2D_8F5E6CBE" to slot 0

Constant Buffer "UnityPerMaterial" (16 bytes) on slot 0 {
  Vector4 Color_BF1BE879 at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct UnityPerMaterial_Type
{
    float4 Color_BF1BE879;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(0) ]],
    sampler samplerTexture2D_8F5E6CBE [[ sampler (0) ]],
    texture2d<float, access::sample > Texture2D_8F5E6CBE [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = Texture2D_8F5E6CBE.sample(samplerTexture2D_8F5E6CBE, input.TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * UnityPerMaterial.Color_BF1BE879;
    output.SV_TARGET0 = u_xlat0 * input.TEXCOORD1;
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "Texture2D_8F5E6CBE" to slot 0

Constant Buffer "UnityPerMaterial" (16 bytes) on slot 0 {
  Vector4 Color_BF1BE879 at 0
}
Constant Buffer "$Globals" (64 bytes) {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Vector4 unity_LODFade at 128
  Vector4 unity_WorldTransformParams at 144
  Vector4 unity_LightData at 160
  Vector4 unity_LightIndices[2] at 176
  Vector4 unity_ProbesOcclusion at 208
  Vector4 unity_SpecCube0_HDR at 224
  Vector4 unity_LightmapST at 240
  Vector4 unity_DynamicLightmapST at 256
  Vector4 unity_SHAr at 272
  Vector4 unity_SHAg at 288
  Vector4 unity_SHAb at 304
  Vector4 unity_SHBr at 320
  Vector4 unity_SHBg at 336
  Vector4 unity_SHBb at 352
  Vector4 unity_SHC at 368
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(1) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	vec4 unity_WorldTransformParams;
	vec4 unity_LightData;
	vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
};
in  vec3 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Color_BF1BE879;
};
UNITY_LOCATION(0) uniform  sampler2D Texture2D_8F5E6CBE;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(Texture2D_8F5E6CBE, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * Color_BF1BE879;
    SV_TARGET0 = u_xlat0 * vs_TEXCOORD1;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Global Keywords: DIRLIGHTMAP_COMBINED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Color"

Constant Buffer "VGlobals" (64 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct UnityPerDraw_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_LODFade;
    float4 unity_WorldTransformParams;
    float4 unity_LightData;
    float4 unity_LightIndices[2];
    float4 unity_ProbesOcclusion;
    float4 unity_SpecCube0_HDR;
    float4 unity_LightmapST;
    float4 unity_DynamicLightmapST;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
};

struct Mtl_VertexIn
{
    float3 POSITION0 [[ attribute(0) ]] ;
    float4 TEXCOORD0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    output.TEXCOORD0 = input.TEXCOORD0;
    output.TEXCOORD1 = input.COLOR0;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "Texture2D_8F5E6CBE" to slot 0

Constant Buffer "UnityPerMaterial" (16 bytes) on slot 0 {
  Vector4 Color_BF1BE879 at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct UnityPerMaterial_Type
{
    float4 Color_BF1BE879;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(0) ]],
    sampler samplerTexture2D_8F5E6CBE [[ sampler (0) ]],
    texture2d<float, access::sample > Texture2D_8F5E6CBE [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = Texture2D_8F5E6CBE.sample(samplerTexture2D_8F5E6CBE, input.TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * UnityPerMaterial.Color_BF1BE879;
    output.SV_TARGET0 = u_xlat0 * input.TEXCOORD1;
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: DIRLIGHTMAP_COMBINED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "Texture2D_8F5E6CBE" to slot 0

Constant Buffer "UnityPerMaterial" (16 bytes) on slot 0 {
  Vector4 Color_BF1BE879 at 0
}
Constant Buffer "$Globals" (64 bytes) {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Vector4 unity_LODFade at 128
  Vector4 unity_WorldTransformParams at 144
  Vector4 unity_LightData at 160
  Vector4 unity_LightIndices[2] at 176
  Vector4 unity_ProbesOcclusion at 208
  Vector4 unity_SpecCube0_HDR at 224
  Vector4 unity_LightmapST at 240
  Vector4 unity_DynamicLightmapST at 256
  Vector4 unity_SHAr at 272
  Vector4 unity_SHAg at 288
  Vector4 unity_SHAb at 304
  Vector4 unity_SHBr at 320
  Vector4 unity_SHBg at 336
  Vector4 unity_SHBb at 352
  Vector4 unity_SHC at 368
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(1) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	vec4 unity_WorldTransformParams;
	vec4 unity_LightData;
	vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
};
in  vec3 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Color_BF1BE879;
};
UNITY_LOCATION(0) uniform  sampler2D Texture2D_8F5E6CBE;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(Texture2D_8F5E6CBE, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * Color_BF1BE879;
    SV_TARGET0 = u_xlat0 * vs_TEXCOORD1;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Transparent+0" "RenderType"="Transparent" "RenderPipeline"="UniversalPipeline" }
  Cull Off
  Blend One One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Color"

Constant Buffer "VGlobals" (96 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 0
  Vector4 _ShadowBias at 64
  Vector3 _LightDirection at 80
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _ShadowBias;
    float3 _LightDirection;
};

struct UnityPerDraw_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_LODFade;
    float4 unity_WorldTransformParams;
    float4 unity_LightData;
    float4 unity_LightIndices[2];
    float4 unity_ProbesOcclusion;
    float4 unity_SpecCube0_HDR;
    float4 unity_LightmapST;
    float4 unity_DynamicLightmapST;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
};

struct Mtl_VertexIn
{
    float3 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
    float4 COLOR0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = fma(VGlobals._LightDirection.xyzx.xyz, VGlobals._ShadowBias.xxx, u_xlat0.xyz);
    u_xlat1.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(VGlobals._LightDirection.xyzx.xyz, u_xlat1.xyz);
    u_xlat6 = clamp(u_xlat6, 0.0f, 1.0f);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = u_xlat6 * VGlobals._ShadowBias.y;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat6), u_xlat0.xyz);
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    output.mtl_Position.z = min(u_xlat0.w, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    output.TEXCOORD0 = input.TEXCOORD0;
    output.TEXCOORD1 = input.COLOR0;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentOut
{
    float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (92 bytes) {
  Matrix4x4 unity_MatrixVP at 0
  Vector4 _ShadowBias at 64
  Vector3 _LightDirection at 80
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Vector4 unity_LODFade at 128
  Vector4 unity_WorldTransformParams at 144
  Vector4 unity_LightData at 160
  Vector4 unity_LightIndices[2] at 176
  Vector4 unity_ProbesOcclusion at 208
  Vector4 unity_SpecCube0_HDR at 224
  Vector4 unity_LightmapST at 240
  Vector4 unity_DynamicLightmapST at 256
  Vector4 unity_SHAr at 272
  Vector4 unity_SHAg at 288
  Vector4 unity_SHAb at 304
  Vector4 unity_SHBr at 320
  Vector4 unity_SHBg at 336
  Vector4 unity_SHBb at 352
  Vector4 unity_SHC at 368
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	vec4 unity_WorldTransformParams;
	vec4 unity_LightData;
	vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = u_xlat6 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "DepthOnly"
  Tags { "LIGHTMODE"="DepthOnly" "QUEUE"="Transparent+0" "RenderType"="Transparent" "RenderPipeline"="UniversalPipeline" }
  Cull Off
  Blend One One
  ColorMask 0
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Color"

Constant Buffer "VGlobals" (64 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct UnityPerDraw_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_LODFade;
    float4 unity_WorldTransformParams;
    float4 unity_LightData;
    float4 unity_LightIndices[2];
    float4 unity_ProbesOcclusion;
    float4 unity_SpecCube0_HDR;
    float4 unity_LightmapST;
    float4 unity_DynamicLightmapST;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
};

struct Mtl_VertexIn
{
    float3 POSITION0 [[ attribute(0) ]] ;
    float4 TEXCOORD0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    output.TEXCOORD0 = input.TEXCOORD0;
    output.TEXCOORD1 = input.COLOR0;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentOut
{
    float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (64 bytes) {
  Matrix4x4 unity_MatrixVP at 0
}
Constant Buffer "UnityPerDraw" (384 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Vector4 unity_LODFade at 128
  Vector4 unity_WorldTransformParams at 144
  Vector4 unity_LightData at 160
  Vector4 unity_LightIndices[2] at 176
  Vector4 unity_ProbesOcclusion at 208
  Vector4 unity_SpecCube0_HDR at 224
  Vector4 unity_LightmapST at 240
  Vector4 unity_DynamicLightmapST at 256
  Vector4 unity_SHAr at 272
  Vector4 unity_SHAg at 288
  Vector4 unity_SHAb at 304
  Vector4 unity_SHBr at 320
  Vector4 unity_SHBg at 336
  Vector4 unity_SHBb at 352
  Vector4 unity_SHC at 368
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	vec4 unity_WorldTransformParams;
	vec4 unity_LightData;
	vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
};
in  vec3 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
Fallback "Hidden/Shader Graph/FallbackError"
}