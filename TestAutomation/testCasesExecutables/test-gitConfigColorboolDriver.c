/*
Driver to test the function 
	int git_config_colorbool(const char *var, const char *value)

The driver receives two strings var and value, as parameter. Both strings can be empty
e.g: ./test-gitConfigColorboolDriver core.color never
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "color.h"

int main(int argc, char *argv[]) {
	int rtn = git_config_colorbool(argv[1], argv[2]);
	printf("%d\n", rtn);
	return 0;
}
	