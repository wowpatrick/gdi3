#include <stdlib.h>
#include <stdio.h>

extern int width;
extern int height;
extern char buf[];

extern void draw_line(int x0, int y0, int x1, int y1);
extern void draw_circle(int x0, int y0, int radius);

void dump()
{
	int x, y;
	for (y = 0; y < height; ++y)
	{
		for (x = 0; x < width; ++x)
		{
			if (buf[y * width + x])
				putchar('x');
			else
				putchar(' ');
		}
		putchar('\n');
	}
}

int main()
{
	draw_circle(32, 24, 20);

	draw_line(12, 24, 52, 24);
	draw_line(12, 24, 12 + 8, 8);
	draw_line(52, 24, 12 + 8, 8);

	draw_circle(32, 24, 0);

	printf("P5 %d %d 255\n", width, height);
	fwrite(buf, 1, width * height, stdout);
	return 0;
}
