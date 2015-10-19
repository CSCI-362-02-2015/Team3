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
	cred_A.password = malloc(strlen("name")+1);
	strcpy(cred_A.password, "name");
	cred_A.protocol = malloc(strlen("name")+1);
	strcpy(cred_A.protocol, "name");
	cred_A.host = malloc(strlen("name")+1);
	strcpy(cred_A.host, "name");
	cred_A.path = malloc(strlen("name")+1);
	strcpy(cred_A.path, "name");
	cred_A.username = malloc(strlen("name")+1);
	strcpy(cred_A.username, "name");



	cred_B.password = malloc(strlen("name")+1);
	strcpy(cred_B.password, "name");
	cred_B.protocol = malloc(strlen("name")+1);
	strcpy(cred_B.protocol, "name");
	cred_B.host = malloc(strlen("name")+1);
	strcpy(cred_B.host, "name");
	cred_B.path = malloc(strlen("name")+1);
	strcpy(cred_B.path, "name");
	cred_B.username = malloc(strlen("name")+1);
	strcpy(cred_B.username, "name");
	// cred_A.protocol = strdup("aaaa");//strdup(argv[1]);
	// cred_A.host = strdup("bbbb");//strdup(argv[2]);
	// cred_A.path = strdup("cccc");//strdup(argv[3]);
	// cred_A.username = strdup("dddd");//strdup(argv[4]);
	
	// cred_B.protocol = strdup("aaaa");//strdup(argv[5]);
	// cred_B.host = strdup("bbbb");//strdup(argv[6]);
	// cred_B.path = strdup("cccc");//strdup(argv[7]);
	// cred_B.username = strdup("dddd");//strdup(argv[8]);
	printf("%s.%s.\n", cred_A.protocol, cred_B.protocol);
	printf("%s.%s.\n", cred_A.host, cred_B.host);
	printf("%s.%s.\n", cred_A.path, cred_B.path);
	printf("%s.%s.\n", cred_A.username, cred_B.username);
	// printf("%d.\n", !strcmp(cred_A.path, cred_B.path));
	// printf("%d.\n", !strcmp(cred_A.username, cred_B.username));
	printf("%d\n", credential_match(&cred_A, &cred_B));
	return 0;
}