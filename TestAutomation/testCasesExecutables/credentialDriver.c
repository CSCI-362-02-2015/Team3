#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "credential.h"

struct credential *CredentialCreate(char *protocol,char *host,char *path,char *username);
void printCredencial(struct credential *c);

int main(int argc, char *argv[]) {
	struct credential *cred_A = Credential_create(argv[1], argv[2], argv[3], argv[4]);
	struct credential *cred_B = Credential_create(argv[5], argv[6], argv[7], argv[8]);
	printf("%d\n", credential_match(cred_A, cred_B));
	return 0;
}


struct credential *CredentialCreate(char *protocol,char *host,char *path,char *username) {
    struct credential *c = malloc(sizeof(struct credential));
    assert(c != NULL);
	c->username = strdup(username);
	c->password = strdup(username);
	c->protocol = strdup(protocol);
	c->host = strdup(host);
	c->path = strdup(path);

    return c;
}
void printCredencial(struct credential *c) {
	printf("%s %s %s %s\n", c->protocol, c->host, c->path, c->username);
}
