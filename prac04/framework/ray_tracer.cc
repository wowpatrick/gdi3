#include <iostream>

#include "ray_tracer.h"
#include "hemisphere_sampler.h"

RayTracer::RayTracer(RayTracer::Options const& opts)
{
    this->opts = opts;
}

void
RayTracer::trace(BVH const& scene, std::vector<unsigned char>* image)
{
    // Setup viewing parameters.
    int const height = this->opts.height;
    int const width = this->opts.width;
    float const focalLength = this->opts.focalLength;
    Vec3f cameraPosition(0.0f, 0.0f, 2.0f);

    float const ax = focalLength * (width > height ? width : height);
    float const ay = focalLength * (width > height ? width : height);

    // Generate image.
    image->resize(width * height, 0);


    /* TODO Add Supersampling for every pixel */

    // Loop over every pixel
    for (int y = 0; y < height; ++y)
    {
        std::cout << "\rProcessing " << (100 * y / height)
            << "%..." << std::flush;
        for (int x = 0; x < width; ++x)
        {
            int const index = x + y * width;
            float value = 0.0f;
            
            Ray ray;
            ray.position = cameraPosition;
            ray.direction = Vec3f((x + 0.5f) / ax - width / (2.0f * ax),
                (y + 0.5f) / ay - height / (2.0f * ay), 1.0f);
            ray.direction[1] *= -1.0f;  // Invert y-axis for image.
            ray.direction[2] *= -1.0f;  // Look along negative z-axis.
            ray.direction = ray.direction.normalized();


            Intersection intersection;
            scene.intersect(ray, &intersection);
            if (intersection.distance == 0.0f)
                continue;

            Vec3f normal = this->getSmoothNormal(intersection);
            float shading = (this->opts.shading) ?
                this->shading(ray, normal)
                : 1.0f;

            float aoFactor = 1.0f;
            if (this->opts.ambientOcclusion)
                aoFactor = this->ambientOcclusion
                    (scene, intersection.position, normal, index);

            value = shading * aoFactor;
            image->at(index) = static_cast<unsigned char>(value * 255.0f);
        }
    }
    std::cout << std::endl;
}

float
RayTracer::shading(Ray const& ray, Vec3f const& normal)
{
    return std::min(1.0f, std::abs(normal.dot(ray.direction)));
}

float
RayTracer::ambientOcclusion(BVH const& scene,
    Vec3f const& point, Vec3f const& normal, int const pID)
{
    /* TODO  add Ambient Occlusion here*/

    return 1.0f;
}

Vec3f
RayTracer::getSmoothNormal(Intersection const& intersection)
{
    unsigned int v0 = intersection.mesh->faces[intersection.faceID * 3 + 0];
    unsigned int v1 = intersection.mesh->faces[intersection.faceID * 3 + 1];
    unsigned int v2 = intersection.mesh->faces[intersection.faceID * 3 + 2];
    return (intersection.mesh->vnormals[v0] * intersection.bary[0]
        + intersection.mesh->vnormals[v1] * intersection.bary[1]
        + intersection.mesh->vnormals[v2] * intersection.bary[2]).normalized();
}

Vec3f
RayTracer::getFlatNormal(Intersection const& intersection)
{
    unsigned int v0id = intersection.mesh->faces[intersection.faceID * 3 + 0];
    unsigned int v1id = intersection.mesh->faces[intersection.faceID * 3 + 1];
    unsigned int v2id = intersection.mesh->faces[intersection.faceID * 3 + 2];
    Vec3f const& v0 = intersection.mesh->vertices[v0id];
    Vec3f const& v1 = intersection.mesh->vertices[v1id];
    Vec3f const& v2 = intersection.mesh->vertices[v2id];
    return (v1 - v0).cross(v2 - v0).normalized();
}	
