#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 nor;
layout(location = 2) in vec2 uv;


layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color
    vec3 color1 = vec3(0.1, 0.4, 0.1);
    vec3 color2 = vec3(0.2, 0.9, 0.2);
    outColor = vec4(mix(color1, color2, uv.y), 1.0);
}
