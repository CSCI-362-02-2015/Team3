/*
Tested Module:
	url.c

Tested the function: 
	int is_url(const char *url)
		url is a string to be validated

Driver:
	Input:
		receives a url (string) to be validated
	Output:
		returns 1 if string is a valid url, otherwise 0
	Usage:
		./test-isUrlDriver https://myurl.com
*/

#include "url.h"


int main(int argc, char *argv[]) {
	int valid = is_url(argv[1]);
	printf("%d\n", valid);
	return 0;
}
