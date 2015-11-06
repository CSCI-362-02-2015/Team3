/*
Tested Module:
	url.c

Tested the function: 
	int is_urlschemechar(int first_flag, int ch)
		first_flag: indicates if the character ch is the first of the url
		ch: a character of the url

Driver:
	Input:
		receives a int indicating if it is the first character, and a character of an url to be validated
	Output:
		returns 1 if url character is valid, otherwise 0
	Usage:
		./test-urlSchemechar 1 a
*/
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "url.h"


int main(int argc, char *argv[]) {
	int first_flag = atoi(argv[1]);
	char ch = *argv[2];
	int valid = is_urlschemechar(first_flag, ch);
	printf("%d\n", valid);
	return 0;
}
