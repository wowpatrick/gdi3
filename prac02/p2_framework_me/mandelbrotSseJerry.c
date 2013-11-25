#include "mandelbrot.h"
#include "xmmintrin.h"
void
colorMapYUV(int *index, int maxIterations, unsigned char* color)
{
/*	if (
	index[0]==maxIterations &&
	index[1]==maxIterations &&
	index[2]==maxIterations &&
	index[3]==maxIterations){
		for (int i = 0; i < 4; i++){
		color [i*3]   =  0;
		color [i*3+1] =  0;
		color [i*3+2] =  0;
		}
		return;
	}
*/

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
int*
testEscapeSeriesForPoint(complex float *c, int maxIterations, complex float *last)
{

/*
	// index/iteration
	float iteration [4] = {0};
	float* pIteration = iteration;

	// radius
	float radius = RADIUS;
	__m128 radius_m128 = _mm_load1_ps(&radius);

	// max iteration
	float maxIterationsf = (float) maxIterations;
	__m128 maxIterations_m128 = _mm_load1_ps(&maxIterationsf);



	// holding all real numbers, imaginary units as well as the abs
	__m128 r_last_m128, im_last_m128, abs_last_m128; 

	// variables used for conditions
	__m128 condition1_m128, iteration_m128, condition2_m128, full_condition_m128;

	for (int i = 0; i < 4; i = i){
		// abs of last
		r_last_m128 =  _mm_set_ps(crealf(last[0]), crealf(last[1]), crealf(last[2]), crealf(last[3]));
		im_last_m128 = _mm_set_ps(cimagf(last[0]), cimagf(last[1]), cimagf(last[2]), cimagf(last[3]));
		abs_last_m128 = _mm_sqrt_ps(_mm_add_ps(_mm_mul_ps(r_last_m128, r_last_m128), _mm_mul_ps(im_last_m128, im_last_m128))); 

		// condition 1 : cabs (last) <= RADIUS
		condition1_m128 = _mm_cmple_ps(abs_last_m128, radius_m128);

		// iteration
		iteration_m128 =  _mm_load_ps(pIteration);

		// condition 2: iteration < max iteration
		condition2_m128 = _mm_cmplt_ps(iteration_m128, maxIterations_m128);

		// condition 1 & condition 2
		full_condition_m128 = _mm_and_ps(condition1_m128, condition2_m128);
		float condition [4] = {0};
		_mm_storeu_ps (condition, full_condition_m128);


	printf("\n\nOutput inside Escape-Method:");
	printf("i = %d\n", i);
	printf ("Complex numbers z - status:\n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n\t %f + %f * i \n\n", 
		crealf(last[0]), cimagf(last[0]), crealf(last[1]), cimagf(last[1]), crealf(last[2]), cimagf(last[2]), crealf(last[3]), cimagf(last[3]));


		if (condition[i] != 0){
			iteration[i]++;
//			float _Complex u1  = (crealf(last[i])*crealf(last[i]) - cimagf(last[i]) * cimagf(last[i])) +
//					(crealf(last[i]) * cimagf(last[i]) + cimagf(last[i]) * crealf(last[i])) * _Complex_I ;
//			last[i] = (crealf(u1) + crealf(c[i])) + (cimagf(u1) + cimagf(c[i])) * _Complex_I;
			last [i] = last[i] * last[i] + c[i];
		}else{
			if (iteration[i] < maxIterations){
				float mu = log ( log ( cabs (last[i]) ) / log(2)) / log (2);
				iteration[i] = iteration[i] + 1 - mu;
			}
			i++;
		}
	}





*/




int iteration [4] = {0};
int* pIteration = iteration;

for (int i = 0 ; i < 4; i++){
	while (cabs (last[i]) <= RADIUS && iteration[i] < maxIterations){
		last[i] = last[i] * last[i] + c[i];
		iteration[i]++;
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



        float CxMin = crealf(INITIAL_UPPERLEFT);
        float CxMax = crealf(INITIAL_LOWERRIGHT);
        float CyMin = cimagf(INITIAL_LOWERRIGHT);
        float CyMax = cimagf(INITIAL_UPPERLEFT);

        for(int y = 0; y < height; y = y + 4) {
		__m128 y_m128 = _mm_set_ps( (float) y+3, (float) y+2, (float) y+1, (float) y);
		__m128 cyMin_m128 = _mm_load1_ps(&CyMin);
		__m128 cyMax_m128 = _mm_load1_ps(&CyMax);
		__m128 height_m128 = _mm_set_ps((float)height, (float) height, (float) height, (float)height);
		__m128 im_m128 =  _mm_add_ps(cyMin_m128, _mm_mul_ps(y_m128, _mm_div_ps (_mm_sub_ps(cyMax_m128, cyMin_m128), height_m128)));
		float im_teila [4] = {0};
		_mm_storeu_ps (im_teila, im_m128);

		for (int j = 0; j < 4; j++){
			float im_teil = im_teila[j];

        	        for(int x = 0; x < width; x = x + 4) {
                	        __m128 cxMax_m128 = _mm_load1_ps(&CxMax);
        	                __m128 cxMin_m128 = _mm_load1_ps(&CxMin);
               		        __m128 width_m128 = _mm_set_ps((float)width, (float)width, (float)width, (float)width);
	                        __m128 x_m128 = _mm_set_ps((float) x+3, (float) x+2, (float) x+1, (float) x);

	                        __m128 rl_m128 = _mm_add_ps(cxMin_m128, _mm_mul_ps(x_m128, _mm_div_ps (_mm_sub_ps(cxMax_m128, cxMin_m128), width_m128)));


	                        float rl_teil [4] = {0};
	                        _mm_storeu_ps (rl_teil,rl_m128);

	                        float _Complex c0 = rl_teil[0] + im_teil * _Complex_I;
	                        float _Complex c1 = rl_teil[1] + im_teil * _Complex_I;
	                        float _Complex c2 = rl_teil[2] + im_teil * _Complex_I;
	                        float _Complex c3 = rl_teil[3] + im_teil * _Complex_I;

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
				int *iteration_needed =  testEscapeSeriesForPoint(pointc, maxIterations, pointz);

				/*
				if (y== 230 && x == 240){
				printf ("Output Iterations:\n");
				printf("\t%f, %f, %f, %f\n",iteration_needed[0], iteration_needed[1], iteration_needed[2], iteration_needed[3]);
				printf ("------------------------------\n\n");
				}
				*/




				for (int i = 0; i < 4; i++){
					if (iteration_needed[i] < maxIterations){
						float mu = log (log (cabs(z_array[i]))/ log(2)) / log(2);
						iteration_needed[i] = iteration_needed[i] + 1 - mu;
					}
				}

				int offset = ((y+j) * width + x) * 3;
		            	colorMapYUV(iteration_needed, maxIterations, image + offset);

        	      }

		}

        }


    return image;
}

