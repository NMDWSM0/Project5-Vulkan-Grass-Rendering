
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// TODO: Declare vertex shader inputs and outputs
layout(location = 0) in vec4 inV0;
layout(location = 1) in vec4 inV1;
layout(location = 2) in vec4 inV2;
layout(location = 3) in vec4 inUp;

layout(location = 0) out vec4 outV0;
layout(location = 1) out vec4 outV1;
layout(location = 2) out vec4 outV2;
layout(location = 3) out vec4 outUp;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
	// TODO: Write gl_Position and any other shader outputs
    vec4 v0 = vec4(inV0.xyz, 1.f);
    gl_Position = (model * v0);
    outV0.xyz = gl_Position.xyz;
    outV0.w = inV0.w;

    vec4 v1 = vec4(inV1.xyz, 1.f);
    outV1.xyz = (model * v1).xyz;
    outV1.w = inV1.w;

    vec4 v2 = vec4(inV2.xyz, 1.f);
    outV2.xyz = (model * v2).xyz;
    outV2.w = inV2.w;

    vec4 up = vec4(inUp.xyz, 0.f);
    outUp.xyz = (model * up).xyz;
    outUp.w = inUp.w;
}
