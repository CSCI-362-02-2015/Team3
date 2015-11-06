/*
Tested Module:
	color.c

Tested the function: 
	int git_config_colorbool(const char *var, const char *value)
		var is a global git config parameter to set color
		value is a local parameter to set color. It has preference over var.
		
Driver:
	Input:
		receives two strings, var and value, as parameter. Both strings can be empty
	Output:
		returns color configuration id (int)
	Usage:
		./test-gitConfigColorboolDriver core.color never
*/

#include <stdio.h>
#include <stdlib.h>
#include "color.h"

int main(int argc, char *argv[]) {
	int rtn = git_config_colorbool(argv[1], argv[2]);
	printf("%d\n", rtn);
	return 0;
}
	