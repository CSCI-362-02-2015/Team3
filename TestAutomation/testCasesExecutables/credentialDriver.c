#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "credential.h"

struct credential *Credential_create(char *protocol,char *host,char *path,char *username) {
    struct credential *c = malloc(sizeof(struct credential));
    assert(c != NULL);
	c->username = strdup(username);//strdup(argv[4]);
	c->password = strdup(username);//strdup(argv[4]);
	c->protocol = strdup(protocol);//strdup(argv[1]);
	c->host = strdup(host);//strdup(argv[2]);
	c->path = strdup(path);//strdup(argv[3]);

    return c;
}
void printcred(struct credential *c) {
	printf("%s %s %s %s\n", c->protocol, c->host, c->path, c->username);
}


int main(int argc, char *argv[]) {
	// struct credential cred_A;
	
	// cred_A->protocol = strdup("aaaa");//strdup(argv[1]);
	// cred_A->host = strdup("bbbb");//strdup(argv[2]);
	// cred_A->path = strdup("cccc");//strdup(argv[3]);
	// cred_A->username = strdup("dddd");//strdup(argv[4]);

	// cred_A.protocol =  memcpy(malloc(strlen(argv[1])), argv[1], strlen(argv[1]));
	// cred_A.host =  memcpy(malloc(strlen(argv[2])), argv[2], strlen(argv[2]));
	// cred_A.path =  memcpy(malloc(strlen(argv[3])), argv[3], strlen(argv[3]));
	// cred_A.username =  memcpy(malloc(strlen(argv[4])), argv[4], strlen(argv[4]));
	// strcpy(cred_A.protocol, "argv[1]");
	// strcpy(cred_A.host, "argv[2]");
	// strcpy(cred_A.path, "argv[3]");
	// strcpy(cred_A.username, "argv[4]");
	// printf("\nstruct address %p\n", &(cred_A));
	// printf("\nX value %s, address %p\n", cred_A.protocol, &(cred_A.protocol));
	// printf("%s.\n", (&cred_A)->protocol);
	// printf("%s.\n", cred_A.host);
	// printf("%s.\n", cred_A.path);
	// printf("%s.\n", cred_A.username);
	// printf("%d.\n", !strcmp(cred_A.path, cred_B.path));
	// printf("%d.\n", !strcmp(cred_A.username, cred_B.username));

	struct credential *c = Credential_create(argv[1], argv[2], argv[3], argv[4]);
	struct credential *c2 = Credential_create(argv[5], argv[6], argv[7], argv[8]);
	printf("struct  address %p\n", c);
	printcred(c);
	printf("%d\n", credential_match(c, c2));
	printcred(c);
	return 0;
}