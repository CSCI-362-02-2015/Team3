/*
Driver to test the function 
	int is_url(const char *url)

The driver receives:
	char*: url to be verified
e.g: "https://myurl.com"
*/
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "url.h"


int main(int argc, char *argv[]) {
	int valid = is_url(argv[1]);
	printf("%d\n", valid);
	return 0;
}
