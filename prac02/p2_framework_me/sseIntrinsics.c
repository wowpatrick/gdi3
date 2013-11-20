#include "stdio.h"
#include <xmmintrin.h>

int main (void) {
    
    __m128 x, y, res; // declare variable ‘x’ as a 128 bit vector variable
    
    x = _mm_set_ps(4.0f, 3.0f, 2.0f, 1.0f);
    
    y = _mm_set_ps(2.0f, 2.0f, 2.0f, 2.0f);
    
    res = _mm_mul_ps(x, y);
    
    printf("Result of SSE calculation: %f %f %f %f \n", res[0], res[1], res[2], res[3]);
    
    
}