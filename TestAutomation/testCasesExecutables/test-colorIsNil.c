/*
Tested Module:
	color.c

Tested the function: 
	int color_is_nil(const char *c)
		c is a pointer to a string with the name of a color

Driver:
	Input:
		receives a string c, that is a name of a color, as parameter
	Output:
		returns a int (1 if color is nil, otherwise 0)
	Usage:
		./test-colorIsNilDriver green
*/

#include "color.h"

int main(int argc, char *argv[]) {
	int isColor = color_is_nil(argv[1]);
	printf("%d\n", isColor);
	return 0;
}
	