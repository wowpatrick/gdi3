// Wei-Hung Hsu		1771312
// David Möller		1697593
// Patrick Dorrington	1945025


#include "mandelbrot.h"
#include <xmmintrin.h>
#include <stdlib.h>




// Sqare of a complex number
float _Complex
cSqr(float _Complex a)
{
    float real = crealf(a);
    float imag = cimagf(a);
    return (real*real-imag*imag) + (2*real*imag) * _Complex_I;
}

// Adding two complex numbers
float _Complex
cAdd(float _Complex a, float _Complex b)
{
    float reala = crealf(a);
    float imaga = cimagf(a);

    float realb = crealf(b);
    float imagb = cimagf(b);

    return (reala + realb) + (imaga + imagb) * _Complex_I;
}

// Absolute value of a complex number
float cBetrag(float _Complex a)
{
    float real = crealf(a);
    float imag = cimagf(a);
    return  sqrt(real*real+imag*imag);
}




void
colorMapYUV(int *index, int maxIterations, unsigned char* color)
{

	// initialization of index and max iterations
	__m128 index_m128 = _mm_set_ps((float)index[3], (float)index[2], (float)index[1], (float)index[0]);
	float maxIterationf = (float) maxIterations;
	__m128 maxIteration_m128 = _mm_load1_ps(&maxIterationf);

	// mask used to cover black pixel
	__m128 mask = _mm_cmpeq_ps(index_m128, maxIteration_m128);
	__m128 zero = _mm_setzero_ps();
	__m128 neg_mask = _mm_cmpeq_ps (mask, zero);

	// calculation of yuv
	float yuv_constant [4] = {2.0, 1.0, 0.5, 0.2};
	__m128 q_m128 = _mm_load1_ps(yuv_constant);
	__m128 q1_m128 = _mm_load1_ps(yuv_constant + 1);
	__m128 q2_m128 = _mm_load1_ps(yuv_constant + 2);

	__m128 y_m128 = _mm_load1_ps(yuv_constant + 3);
	__m128 u_m128 = _mm_sub_ps(_mm_mul_ps(_mm_div_ps(index_m128, maxIteration_m128), q_m128), q1_m128);
	__m128 v_m128 = _mm_sub_ps(q2_m128, _mm_div_ps(index_m128, maxIteration_m128));

	// calculation of rgb
	float rgb_constant [5] = {1.28033, 255.0, -0.21482, -0.38059, 2.12798};
	__m128 a_m128 = _mm_load1_ps(rgb_constant);
	__m128 a1_m128 = _mm_load1_ps(rgb_constant + 1);
	__m128 a2_m128 = _mm_load1_ps(rgb_constant + 2);
	__m128 a3_m128 = _mm_load1_ps(rgb_constant + 3);
	__m128 a4_m128 = _mm_load1_ps(rgb_constant + 4);

	// r = 255 * (y + (1.28033 * v))
	__m128 r_m128 = _mm_mul_ps(a1_m128,_mm_add_ps(y_m128,_mm_mul_ps(a_m128,v_m128)));
	r_m128 = _mm_and_ps (neg_mask, r_m128);
	// g = 255 * (y + (-0.21482 * u) + (-0.38059 * v));
	__m128 g_m128 = _mm_mul_ps(a1_m128,_mm_add_ps(_mm_mul_ps(a3_m128, v_m128),_mm_add_ps(y_m128, _mm_mul_ps(a2_m128, u_m128))));
	g_m128 = _mm_and_ps (neg_mask, g_m128);
	// b = 255 * (y + (2.12798 * u))
	__m128 b_m128 = _mm_mul_ps(a1_m128,_mm_add_ps(y_m128,_mm_mul_ps(a4_m128, u_m128)));
	b_m128 = _mm_and_ps (neg_mask, b_m128);

	float red [4] = {0};
	float green [4] = {0};
	float blue [4] = {0};

	_mm_storeu_ps (red,  r_m128);
	_mm_storeu_ps (green,g_m128);
	_mm_storeu_ps (blue, b_m128);

	for (int i = 0; i < 4; i++){
		color [i*3]   =  (unsigned char) red[i];
		color [i*3+1] =  (unsigned char) green[i];
		color [i*3+2] =  (unsigned char) blue[i];
	}

}




int* testEscapeSeriesForPoint(complex float *c, int maxIterations, complex float *last) {

	int iteration [4] = {0,0,0,0};
	int* pIteration = iteration;

	/* ASSEMBLER CONDITION
	float radius = RADIUS;
	__m128 radius_m128 = _mm_load1_ps(&radius);
	float maxIterationsf = (float) maxIterations;
	__m128 maxIterations_m128 = _mm_load1_ps(&maxIterationsf);
	__m128 r_last_m128 =  _mm_set_ps(crealf(last[3]), crealf(last[2]), crealf(last[1]), crealf(last[0]));
	__m128 im_last_m128 = _mm_set_ps(cimagf(last[3]), cimagf(last[2]), cimagf(last[1]), cimagf(last[0]));
	__m128 abs_last_m128 = _mm_sqrt_ps(_mm_add_ps(_mm_mul_ps(r_last_m128, r_last_m128), _mm_mul_ps(im_last_m128, im_last_m128)));
	__m128 condition1_m128 = _mm_cmple_ps(abs_last_m128, radius_m128);
	__m128 iteration_m128 =  _mm_load_ps(pIteration);
	__m128 condition2_m128 = _mm_cmplt_ps(iteration_m128, maxIterations_m128);
	__m128 full_condition_m128 = _mm_and_ps(condition1_m128, condition2_m128);
	float condition [4] = {0};
	_mm_storeu_ps (condition, full_condition_m128);
	*/

	// using SSE to calculate 4 iterations at the same time, if and only if all 4 complex numbers last dont fall out of radius and all 4 iterations are within max iteration
	while( (cBetrag(last[0]) <= RADIUS)&& (cBetrag(last[1]) <= RADIUS)&& (cBetrag(last[2]) <= RADIUS)&& (cBetrag(last[3]) <= RADIUS)&& iteration[0] < 
		maxIterations && iteration[1] < maxIterations && iteration[2] < maxIterations &&iteration[3] < maxIterations){
       		__m128 real_last_m128 = _mm_set_ps(crealf(last[3]), crealf(last[2]), crealf(last[1]), crealf(last[0]));
        	__m128 imag_last_m128  = _mm_set_ps(cimagf(last[3]), cimagf(last[2]), cimagf(last[1]), cimagf(last[0]));
        	// deviding the 4 complex numbers into their imaginary units and real part
		// proceed with the calculation of the next 4 complex numbers
        	__m128 sqrReal_last_m128 = _mm_sub_ps(_mm_mul_ps(real_last_m128, real_last_m128), _mm_mul_ps(imag_last_m128, imag_last_m128));
        	float two = 2;
        	__m128 two_m128 = _mm_load1_ps(&two);
        	__m128 sqrImag_last_m128 = _mm_mul_ps(two_m128, _mm_mul_ps(real_last_m128, imag_last_m128));
        	__m128 cReal = _mm_set_ps(crealf(c[3]), crealf(c[2]), crealf(c[1]), crealf(c[0]));
        	__m128 cImag = _mm_set_ps(cimagf(c[3]), cimagf(c[2]), cimagf(c[1]), cimagf(c[0]));
        	__m128 result_last_Real_m128 = _mm_add_ps(sqrReal_last_m128, cReal);
        	__m128 result_last_Imag_m128 = _mm_add_ps(sqrImag_last_m128, cImag);
        	float imag_last [4] = {0};
        	float real_last [4] = {0};
        	_mm_storeu_ps(imag_last, result_last_Imag_m128);
        	_mm_storeu_ps(real_last, result_last_Real_m128);
		// the 4 new complex numbers are stored in imag_last array and real_last array
        	for (int j = 0; j < 4; j++) {
            		last [j] = real_last[j] + imag_last[j] *  _Complex_I;
            		iteration[j]++;
		}
   	}

	// at this stage, at least 1 of the 4 complex numbers has fallen out of the radius or reached the maximum iteration
	// this loop finishes the leftover
	for (int i = 0 ; i < 4; i++) {
		while (cBetrag (last[i]) <= RADIUS && iteration[i] < maxIterations) {
			last[i] = cAdd (cSqr(last[i]) , c[i]);
			iteration[i]++;
        	}

		if (iteration[i] < maxIterations){
			float mu = log (log (cabs(last[i]))/ log(2)) / log(2);
			iteration[i] = iteration[i] + 1 - mu;
		}

    	}
    	return pIteration;
}





unsigned char *
generateMandelbrot(
                   complex float upperLeft,
                   complex float lowerRight,
                   int maxIterations,
                   int width,
                   int height)
{
    unsigned char *image = malloc(height * width * 3);
    float CxMin = crealf(upperLeft);
    float CxMax = crealf(lowerRight);
    float CyMin = cimagf(lowerRight);
    float CyMax = cimagf(upperLeft);

    for(int y = 0; y < height; y = y + 4) {

		// the imaginary unit for c depends on y
		// calculating 4 imaginary units for 4 rows at the same time
		__m128 y_m128 = _mm_set_ps( (float) y+3, (float) y+2, (float) y+1, (float) y);
		__m128 cyMin_m128 = _mm_load1_ps(&CyMin);
		__m128 cyMax_m128 = _mm_load1_ps(&CyMax);
		__m128 height_m128 = _mm_set_ps((float)height, (float) height, (float) height, (float)height);
		__m128 im_m128 =  _mm_add_ps(cyMin_m128, _mm_mul_ps(y_m128, _mm_div_ps (_mm_sub_ps(cyMax_m128, cyMin_m128), height_m128)));
		float im_teila [4] = {0};
		_mm_storeu_ps (im_teila, im_m128);
		// the 4 imaginary units are stored in im_teila

		for (int j = 0; j < 4; j++){
			// going through all 4 imaginary units that are calculated beforehand
			float im_teil = im_teila[j];

          		for(int x = 0; x < width; x = x + 4) {
				// the real part for c depends on x
				// calculating 4 real parts for 4 columns at the same time
                		__m128 cxMax_m128 = _mm_load1_ps(&CxMax);
		                __m128 cxMin_m128 = _mm_load1_ps(&CxMin);
		                __m128 width_m128 = _mm_set_ps((float)width, (float)width, (float)width, (float)width);
		                __m128 x_m128 = _mm_set_ps((float) x+3, (float) x+2, (float) x+1, (float) x);
		                __m128 rl_m128 = _mm_add_ps(cxMin_m128, _mm_mul_ps(x_m128, _mm_div_ps (_mm_sub_ps(cxMax_m128, cxMin_m128), width_m128)));
		                float rl_teil [4] = {0};
		                _mm_storeu_ps (rl_teil,rl_m128);
				// the 4 real parts are stored in rl_teil
				// creating 4 complex numbers
		                float _Complex c0 = rl_teil[0] + im_teil * _Complex_I;
		                float _Complex c1 = rl_teil[1] + im_teil * _Complex_I;
		                float _Complex c2 = rl_teil[2] + im_teil * _Complex_I;
		                float _Complex c3 = rl_teil[3] + im_teil * _Complex_I;
				// setting up 4 complex numbers c and 4 complex numbers z
		                float _Complex c [4] = {c0, c1, c2, c3};
		                float _Complex z = 0 + 0 * _Complex_I;
				float _Complex z_array[4] = {z,z,z,z};
				float _Complex *pointz = z_array;
		                float _Complex *pointc = c;

				/*
		                 printf ("Calculating Iterations for x = %d and y = %d\n", x, y);
		                 printf ("Input Max-Iterations:\n\t %d\n", maxIterations);
		                 printf ("Input Complex numbers c:\n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n",
		                 crealf(pointc[0]), cimagf(pointc[0]), crealf(pointc[1]), cimagf(pointc[1]), crealf(pointc[2]), cimagf(pointc[2]), crealf(pointc[3]), cimagf(pointc[3]));
		                 printf ("Input Complex numbers z:\n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n",
		                 crealf(pointz[0]), cimagf(pointz[0]), crealf(pointz[1]), cimagf(pointz[1]), crealf(pointz[2]), cimagf(pointz[2]), crealf(pointz[3]), cimagf(pointz[3]));
		                 */

				// calculate 4 iterations at the same time
				int *iteration_needed =  testEscapeSeriesForPoint(pointc, maxIterations, pointz);

				/*
		                 printf ("Output Iterations:\n");
		                 printf("\t%f, %f, %f, %f\n",iteration_needed[0], iteration_needed[1], iteration_needed[2], iteration_needed[3]);
		                 printf ("------------------------------\n\n");
	        	         */
				int offset = ((y+j) * width + x) * 3;
		                colorMapYUV(iteration_needed, maxIterations, image + offset);

	            	}

		}

    }


    return image;
}

