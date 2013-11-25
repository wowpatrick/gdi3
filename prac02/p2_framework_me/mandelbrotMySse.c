/*
 * This file contains the implementation of the interface. You can change
 * everything in this file (but it still has to contain the function
 * generateMandelbrot). For example, for a proper SSE implementation of
 * the color mapping, you may want to process multiple pixels at once.
 */
#include "mandelbrot.h"

#include "xmmintrin.h"  // SSE 1
#include "emmintrin.h"  // SSE 2
#include "pmmintrin.h"  // SSE 3
#include "math.h"
#include "stdio.h"
/*
 * Calculates a color mapping for a given iteration number by exploiting the
 * YUV color space. Returns the color as 8-bit unsigned char per channel (RGB).
 *
 * Arguments:
 *	index - Number of iterations that resulted from iterating the Mandelbrot series.
 *	maxIterations - Parameter that was also used for series iteration.
 *
 * Returns:
 *	The associated color as an array of 3 8-bit unsigned char values.
 */
void
colorMapYUV(float index, int maxIterations, unsigned char* color)
{
    // Ausgabe mandelbrotmange (ohne umrechnung der farbwerte)
    if(index == maxIterations) {
        color[0] = 0;
        color[1] = 0;
        color[2] = 0;
    }
    else {

        // Set the value (because we need it two times)
        float indexByMax = (float)index/(float)maxIterations;

        // Given conversion code (index -> YUV)
        double y = 0.2;                                // brightness of the image, black-and-white
        double u = -1 + 2 * (indexByMax);     // chroma, blue-luma
        double v = 0.5 - (indexByMax);        // chrome, red-luma

        // --------------------------------------
        __m128 iV1, iV2, iVres1, iVres2;

        iV1 = _mm_set_ps(0.2f, -1.0f, 0.5f, 0.0f);
        // Test
        if (0.2f != iV1[3] || -1.0f != iV1[2] || 0.5f != iV1[1]) {
            printf("SSE values: %f, %f, %f \n", iV1[3], iV1[2], iV1[1]);
            printf("____\n");
            exit(0);
        }
        
        iV2 = _mm_set_ps(0.0f, 2.0f, 0.0f, 0.0f);
        //Test
        if (0.0f != iV2[3] || 2.0f != iV2[2] || 0.0f != iV2[1]) {
            printf("SSE values: %f, %f, %f \n", iV2[3], iV2[2], iV2[1]);
            printf("____\n");
            exit(0);
        }

        iVres1 = _mm_add_ps(iV1, iV2);
        //Test
        if (0.2f != iVres1[3] || 2.0f != iVres1[2] || 0.5f != iVres1[1]) {
            printf("SSE values: %f, %f, %f \n", iVres1[3], iVres1[2], iVres1[1]);
            printf("____\n");
            exit(0);
        }
        iVres2 = _mm_set_ps(iVres1[3], iVres1[2], iVres1[1], 0.0f);

        // --------------------------------------

        // Conversion according to wikipedia
        double r = (y + (1.28033 * v));
        double g = (y + (-0.21482 * u) + (-0.38059 * v));	
        double b = (y + (2.12798 * u));
        
        // Data alignment
        // float *pRes = (float*) _aligned_malloc(255 * sizeof(float), 16); // _aligned_malloc() is MSVC exclusive http://msdn.microsoft.com/en-us/library/8z34s9c6%28VS.80%29.aspx
        //float *pRes = (float*) *aligned_alloc(255 * sizeof(float), 16); // *aligned_alloc() is the C11 standard (not vendor specific) http://stackoverflow.com/questions/3839922/aligned-malloc-in-gcc
        
        //__m128 *pResSSE = (__m128*) pRes;
        
        // value alignment
        __m128 vec1, vec2, res;
        
        vec1 = _mm_set_ps(255.0f,255.0f,255.0f,255.0f);
        vec2 = _mm_set_ps(r, g, b, 0.0f);
        res = _mm_mul_ps(vec1,vec2);

        // set type for correct value representation
        color[0] = (unsigned char) res[3];
        color[1] = (unsigned char) res[2];
        color[2] = (unsigned char) res[1];
    }
}

/*
 * Executes the complex series for a given parameter c for up to maxIterations
 * and saves the last series component in last.
 *
 * Arguments:
 *  c - Additive component (complex number) for Mandelbrot series.
 *	maxIterations - Maximum number of iterations that are executed to determine a series' boundedness
 *	last - Pointer to a complex float number that can be used for storing the last component in a series - useful for color mapping
 *
 * Returns:
 *	The number of iterations that were executed before the series escaped our
 *	circle or - if the point is part of the Mandelbrot set a special
 *	(user-defined) value.
 */
int
testEscapeSeriesForPoint(complex float c, int maxIterations, complex float * last)
{
    // TODO Insert your implementation here.

	int iteration = 0;
	while (cabs(*last) <= RADIUS && iteration < maxIterations){
		*last = (*last)*(*last) + c;
		iteration ++; 
	}
	if (iteration < maxIterations){
		double mu = log ( log ( cabs(*last)) / log(2)) / log(2);
		iteration = iteration + 1 - mu;
	}

    return iteration;
}

/*
 * Generates an image of a Mandelbrot set.
 */
unsigned char *
generateMandelbrot(
    complex float upperLeft, 
    complex float lowerRight, 
    int maxIterations, 
    int width, 
    int height)
{
    // Allocate image buffer, row-major order, 3 channels.
    unsigned char *image = malloc(height * width * 3);
	double scale = 2 * RADIUS/ fmin(width, height);
	printf("scale: %f", scale);
    // TODO: Generate and color map the image.
    for(int y = 0; y < height; y++) {
		double im_teil = (height / 2 - y) * scale ;
        for(int x = 0; x < width; x++) {
            // TODO: Call testEscapeSeriesForPoint() here.
		double rl_teil = (x - width / 2) * scale;
		
		float _Complex value = rl_teil + im_teil * _Complex_I;

        float _Complex z = 0 + 0 * _Complex_I;
		
		int iteration_needed = testEscapeSeriesForPoint(value, maxIterations, &z); 

            // TODO: Color map the result.
            int offset = (y * width + x) * 3;
            colorMapYUV(iteration_needed, maxIterations, image + offset);
        }
    }

    return image;
}

