/*
Driver to test the function 
	int credential_match(const struct credential *want, const struct credential *have)
		want, have: credentials to be matched
The driver receives 8 strings as parameter to create two credentials.
Each credential contains (protocol, host, path, username)
e.g: "https example.com foo.git bob http ex.com bar.git ana"
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "credential.h"

struct credential *CredentialCreate(char *protocol,char *host,char *path,char *username);
void printCredencial(struct credential *c);

int main(int argc, char *argv[]) {
	struct credential *cred_A = CredentialCreate(argv[1], argv[2], argv[3], argv[4]);
	struct credential *cred_B = CredentialCreate(argv[5], argv[6], argv[7], argv[8]);
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
