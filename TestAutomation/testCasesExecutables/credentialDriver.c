#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdarg.h>
#include <string.h>
//#include "git-compat-util.h"
#include "credential.h"

int main(int argc, char *argv[]) {
	struct credential cred_A = CREDENTIAL_INIT;
	struct credential cred_B = CREDENTIAL_INIT;
	
	// cred_A.password = malloc(10);
	// cred_A.protocol = malloc(10);
	// cred_A.host = malloc(10);
	// cred_A.path = malloc(10);
	// cred_A.username = malloc(10);
	// strcpy(cred_A.password, "name");
	// strcpy(cred_A.protocol, "name");
	// strcpy(cred_A.host, "name");
	// strcpy(cred_A.path, "name");
	// strcpy(cred_A.username, "name");



	// cred_B.password = malloc(10);
	// cred_B.protocol = malloc(10);
	// cred_B.host = malloc(10);
	// cred_B.path = malloc(10);
	// cred_B.username = malloc(10);
	// strcpy(cred_B.password, "name");
	// strcpy(cred_B.protocol, "name");
	// strcpy(cred_B.host, "name");
	// strcpy(cred_B.path, "name");
	// strcpy(cred_B.username, "name");
	// cred_A.protocol = strdup("aaaa");//strdup(argv[1]);
	// cred_A.host = strdup("bbbb");//strdup(argv[2]);
	// cred_A.path = strdup("cccc");//strdup(argv[3]);
	// cred_A.username = strdup("dddd");//strdup(argv[4]);
	
	// cred_B.protocol = strdup("aaaa");//strdup(argv[5]);
	// cred_B.host = strdup("bbbb");//strdup(argv[6]);
	// cred_B.path = strdup("cccc");//strdup(argv[7]);
	// cred_B.username = strdup("dddd");//strdup(argv[8]);

	cred_A.protocol = argv[1];
	cred_A.host = argv[2];
	cred_A.path = argv[3];
	cred_A.username = argv[4];
	
	cred_B.protocol = argv[5];
	cred_B.host = argv[6];
	cred_B.path = argv[7];
	cred_B.username = argv[8];
	printf("%s.%s.\n", cred_A.protocol, cred_B.protocol);
	printf("%s.%s.\n", cred_A.host, cred_B.host);
	printf("%s.%s.\n", cred_A.path, cred_B.path);
	printf("%s.%s.\n", cred_A.username, cred_B.username);
	// printf("%d.\n", !strcmp(cred_A.path, cred_B.path));
	// printf("%d.\n", !strcmp(cred_A.username, cred_B.username));
	printf("%d\n", credential_match(&cred_A, &cred_B));
	return 0;
}