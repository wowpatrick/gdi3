#include <stdio.h>

int main(void)
{
    int output = sudan(1,2,4);
    printf("%d \n", output);

    return 0;
}

int sudan(int n, int x, int y) {
    if (n == 0) return x + y;
    if (y == 0) return x;

    int t1 = sudan(n, x, y-1);
    int t2 = sudan(n-1, t1, t1 + y);

    return t2;
}
