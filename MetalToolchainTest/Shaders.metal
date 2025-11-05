#include <metal_stdlib>
using namespace metal;

// Simple vertex shader
vertex float4 basic_vertex(
    const device packed_float3* vertex_array [[buffer(0)]],
    unsigned int vid [[vertex_id]])
{
    return float4(vertex_array[vid], 1.0);
}

// Simple fragment shader
fragment float4 basic_fragment()
{
    return float4(1.0, 0.0, 0.0, 1.0); // Red color
}

// Compute shader with some Metal 3.0+ features
kernel void compute_test(
    device float* input [[buffer(0)]],
    device float* output [[buffer(1)]],
    uint id [[thread_position_in_grid]])
{
    output[id] = input[id] * 2.0;
}
