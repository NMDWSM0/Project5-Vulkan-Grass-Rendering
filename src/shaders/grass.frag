#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec3 pos;
} camera;

// Declare fragment shader inputs
layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 nor;
layout(location = 2) in vec2 uv;

layout(location = 0) out vec4 outColor;

const vec3 lightDir = normalize(vec3(1.4, 2.5, 2.0));

void main() {
    // Compute fragment color
    vec3 color1 = vec3(0.25, 0.4, 0.1);
    vec3 color2 = vec3(0.5, 0.9, 0.2);
    vec3 albedo = mix(color1, color2, mix(uv.y * uv.y, uv.y, sqrt(2.f * abs(uv.x - 0.5))));
    vec3 viewDir = normalize(camera.pos - pos);

    vec3 diffuse = 0.5f * albedo * abs(dot(lightDir, nor)); // double-sided grass

    vec3 ambient = albedo * 0.4f;
    
    vec3 halfDir = normalize(viewDir + lightDir);
    float specularCoeff = 0.4f * smoothstep(0.5f, 0.8f, uv.y);
    vec3 specular = specularCoeff * pow(abs(dot(halfDir, nor)), 32.f) * vec3(1, 1, 1);

    outColor = vec4(diffuse + ambient + specular, 1.0);
}
