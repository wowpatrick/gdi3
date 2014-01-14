#ifndef RAY_TRACER_H
#define RAY_TRACER_H

#include <vector>

#include "mesh.h"
#include "ray.h"
#include "triangle.h"
#include "bvh.h"

class RayTracer
{
public:
    // Structure with basic options for raytracer
    // - width : image witdh
    // - focalLength      : focal length of virtual camera
    // - nSuperSamples  : Number of Samples !per pixel!
    //                      Runtime basically explodes if you turn this too high
    // - smoothShading    : switch to turn on/off smooth shading
    // - ambientOcclusion : switch to turn on/off ambient occlusion
    // - aoMaxDistance    : Ambient Occlusion distance
    //                      Should be about 10% of the max scene dimension
    // - aoNumSamples     : Number of samples for each ambient occlusion
    //                      evaluation
    struct Options
    {
        int width;
        int height;
        float focalLength;
        int nSuperSamples;
        bool shading;
        bool ambientOcclusion;
        float aoMaxDistance;
        int aoNumSamples;
    };

public:
    // Constructor with options argument
    RayTracer(Options const& opts);
    
    // Traces the scene contained in a BVH sturcture and
    // writes the result into the 'image' vector
    void trace(BVH const& scene, std::vector<unsigned char>* image);

private:
    // compute shading as angle between ray direction and normal
    float shading(Ray const& ray, Vec3f const& normal);
    
    // compute actual ambient occlusion
    float ambientOcclusion(BVH const& scene,
        Vec3f const& point, Vec3f const& normal, int const pID);
    
    // compute smooth normal at a specific intersection point.
    // This is interpolated between the surrounding vertex normals
    // and depends on the actual intersection point inside the triangle.
    Vec3f getSmoothNormal(Intersection const& intersection);
    
    // compute flat normal at a specific intersection point.
    // This is the same normal for a whole triangle, no matter where
    // the ray actually hits.
    Vec3f getFlatNormal(Intersection const& intersection);

private:
    Options opts;
};

#endif // RAY_TRACER_H

