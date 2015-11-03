/*
Driver to test the function 
	int is_urlschemechar(int first_flag, int ch)
		first_flag: indicates if the character ch is the first of the url
		ch: a character of the url
The driver receives:
	int: that indicates if it is the first character of the string
	char: which is the character to be verified
e.g: "1 a"
*/
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "url.h"


int main(int argc, char *argv[]) {
	int first_flag = atoi(argv[1]);
	char ch = *argv[2];
	int valid = is_urlschemechar(first_flag, ch);
	printf("%d\n", valid);
	return 0;
}
