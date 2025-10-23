#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec3 pos;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 nor;
layout(location = 2) in vec2 uv;

layout(location = 0) out vec4 outColor;

const vec3 lightDir = normalize(vec3(1.4, 2.5, 2.0));

void main() {
    // TODO: Compute fragment color
    vec3 color1 = vec3(0.1, 0.4, 0.1);
    vec3 color2 = vec3(0.2, 0.9, 0.2);
    vec3 albedo = mix(color1, color2, uv.y);
    vec3 diffuse = 0.5f * albedo * max(abs(dot(lightDir, nor)), 0.f); // double-sided grass
    vec3 ambient = albedo * 0.5f;
    outColor = vec4(diffuse + ambient, 1.0);
}
