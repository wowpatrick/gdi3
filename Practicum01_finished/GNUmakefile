CFLAGS = -m32 -g
ASFLAGS = -m32 -g

all: thales

thales: thales.c draw_line.S draw_circle.c globals.S

clean:
	$(RM) thales

.PHONY: all clean
