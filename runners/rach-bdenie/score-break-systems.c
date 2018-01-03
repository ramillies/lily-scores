#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "gd.h"

int sqr(int x)
{
	return x * x;
}

int white(int truecolor)
{
	return((sqr(gdTrueColorGetRed(truecolor)) + sqr(gdTrueColorGetGreen(truecolor)) + sqr(gdTrueColorGetBlue(truecolor))) > 62500);
}

void output(gdImagePtr im, const char *base, int w, int whitestart, int first)
{
	static int count;
	static char separator = ' ';
	gdImagePtr out = gdImageCreate(w, whitestart-first);
	if(out == NULL)
		fprintf(stderr, "Failed to create empty image of dimensions %d x %d.\n", w, whitestart-first);
	gdImageCopy(out, im, 0, 0, 0, first, w, whitestart-first);
	char *name = (char *) malloc(strlen(base)+100);
	snprintf(name, strlen(base)+100, "%s-%d.png", base, ++count);
	fprintf(stderr, "Outputting to a image '%s'.\n", name);
	FILE *f = fopen(name, "wb");
	gdImagePng(out, f);
	fclose(f);
	gdImageDestroy(out);

	printf("%c { \"name\": \"%s\", \"lines\": [] }", separator, name);
	separator = ',';
}

int main(int argc, char **argv)
{
	setvbuf(stdout, 0, _IONBF, 0);
	if(argc != 3)
		fprintf(stderr, "Required exactly 2 arguments (input filename, base of the output filename)!\n"), exit(1);
	gdImagePtr im;
	if(!(im= gdImageCreateFromFile(argv[1])))
		fprintf(stderr, "Failed to open file '%s'.\n", argv[1]), exit(1);
	int w = gdImageSX(im), h = gdImageSY(im);

	fprintf(stderr, "Image loaded. Dimensions: %d x %d.\n", w, h);
	printf("{ \"images\" : [ ");

	int first = 0, whitestart = 0, iswhite = 1;
	for(int y = 0; y < h; y++)
	{
		fprintf(stderr, "\r%d, first %d, whitestart %d, iswhite %d           ", y, first, whitestart, iswhite);
		for(int x = 0; x < w; x++)
			if(!white(gdImageGetTrueColorPixel(im, x, y)))
			{
				if(iswhite)
				{
					iswhite = 0;
					if((y - whitestart) >= 50)
					{
						output(im, argv[2], w, whitestart, first);
						first = y;
					}
				}
				goto skip;
			}
		if(!iswhite)
		{
			iswhite=1;
			whitestart = y;
		}
skip:
		;
	}

	output(im, argv[2], w, iswhite ? whitestart : h-1, first);

	printf("] }\n");

	gdImageDestroy(im);
}
