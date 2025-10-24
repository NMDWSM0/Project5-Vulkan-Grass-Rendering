#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec3 pos;
} camera;

in gl_PerVertex {
    vec4 gl_Position;
} gl_in[];

// Declare tessellation control shader inputs and outputs
layout(location = 0) in vec4[] inV0;
layout(location = 1) in vec4[] inV1;
layout(location = 2) in vec4[] inV2;
layout(location = 3) in vec4[] inUp;

layout(location = 0) out vec4[] outV0;
layout(location = 1) out vec4[] outV1;
layout(location = 2) out vec4[] outV2;
layout(location = 3) out vec4[] outUp;

const float maxDistance = 32.f;
const float maxLevelV = 16, minLevelV = 4;
const float maxLevelH = 4, minLevelH = 1;

ivec2 getTessLevel(vec3 pos) {
    float dist = distance(pos, camera.pos);
    int levelV = int(round(mix(maxLevelV, minLevelV, clamp(dist / maxDistance, 0.f, 1.f))));
    int levelH = int(round(mix(maxLevelH, minLevelH, clamp(dist / maxDistance, 0.f, 1.f))));
    return ivec2(levelV, levelH);
}

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// Write any shader outputs
    outV0[gl_InvocationID] = inV0[gl_InvocationID];
    outV1[gl_InvocationID] = inV1[gl_InvocationID];
    outV2[gl_InvocationID] = inV2[gl_InvocationID];
    outUp[gl_InvocationID] = inUp[gl_InvocationID];

	// Set level of tesselation
    ivec2 level = getTessLevel(outV0[gl_InvocationID].xyz);
    gl_TessLevelInner[0] = level.y;
    gl_TessLevelInner[1] = level.x;
    gl_TessLevelOuter[0] = level.x;
    gl_TessLevelOuter[1] = level.y;
    gl_TessLevelOuter[2] = level.x;
    gl_TessLevelOuter[3] = level.y;
}
