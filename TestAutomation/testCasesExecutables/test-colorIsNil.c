/*
Driver to test the function 
	int color_is_nil(const char *c)
		c is a pointer to a string with the name of a color

The driver receives a string c, that is a name of a color, as parameter
e.g: ./test-colorIsNil green
*/

#include <stdio.h>
#include <stdlib.h>
#include "color.h"

int main(int argc, char *argv[]) {
	int isColor = color_is_nil(argv[1]);
	printf("%d\n", isColor);
	return 0;
}
	