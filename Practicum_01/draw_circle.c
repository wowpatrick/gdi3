extern char buf[];
extern int width;
extern int height;

static inline void setPixel(int x, int y)
{
	buf[y * width + x] = 127;
}

void draw_circle(int x0, int y0, int radius)
{
	int error = -radius;
	int x = radius;
	int y = 0;

	while (x >= y)
	{
		setPixel(x0 + x, y0 + y);
		setPixel(x0 + x, y0 - y);
		setPixel(x0 - x, y0 + y);
		setPixel(x0 - x, y0 - y);
		setPixel(x0 + y, y0 + x);
		setPixel(x0 + y, y0 - x);
		setPixel(x0 - y, y0 + x);
		setPixel(x0 - y, y0 - x);

		error = error + y;
		y = y + 1;
		error = error + y;

		if (error >= 0)
		{
			error = error - x;
			x = x - 1;
			error = error - x;
		}
	}
}

