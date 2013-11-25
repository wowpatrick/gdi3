/*
 * This file contains the implementation of the interface. You can change
 * everything in this file (but it still has to contain the function
 * generateMandelbrot). For example, for a proper SSE implementation of
 * the color mapping, you may want to process multiple pixels at once.
 */
#include "mandelbrot.h"
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
colorMapYUV(int index, int maxIterations, unsigned char* color)
{

        // Given conversion code (index -> YUV)
        float y = 0.2;
        float u = -1 + 2 * ((float)index/maxIterations);
        float v = 0.5 - ((float)index/maxIterations);

        // Conversion according to wikipedia
	float r = 255 * (y + (1.28033 * v));
        float g = 255 * (y + (-0.21482 * u) + (-0.38059 * v));
        float b = 255 *(y + (2.12798 * u));

        // set type for correct value representation
        color[0] = (index == maxIterations) ? 0 : (unsigned char) r;
        color[1] = (index == maxIterations) ? 0 : (unsigned char) g;
        color[2] = (index == maxIterations) ? 0 : (unsigned char) b;

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
testEscapeSeriesForPoint(complex float c, int maxIterations, complex float *last)
{
	int iteration = 0;
	while (cabs(*last) <= RADIUS && iteration < maxIterations){
		*last = (*last)*(*last) + c;
		iteration ++;
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
	float CxMin = crealf(INITIAL_UPPERLEFT);
	float CxMax = crealf(INITIAL_LOWERRIGHT);
	float CyMin = cimagf(INITIAL_LOWERRIGHT);
	float CyMax = cimagf(INITIAL_UPPERLEFT);

    for(int y = 0; y < height; y++) {
		float im_teil = CyMin + y * (CyMax-CyMin)/ height;
        for(int x = 0; x < width; x++) {
		float rl_teil = CxMin + x * (CxMax-CxMin)/ width;
		float _Complex c = rl_teil + im_teil * _Complex_I;
		float _Complex z = 0 + 0 * _Complex_I;

		int iteration_needed =  testEscapeSeriesForPoint(c, maxIterations, &z); 

		if (iteration_needed < maxIterations){
			float mu = log ( log ( cabs(z)) / log(2)) / log(2);
			iteration_needed = iteration_needed + 1 - mu;
		}

		int offset = (y * width + x) * 3;
		colorMapYUV(iteration_needed, maxIterations, image + offset);
        }
    }

    return image;
}

