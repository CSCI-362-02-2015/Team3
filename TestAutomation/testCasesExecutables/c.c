
#include "credential.h"
#include <stdio.h>
#include <string.h>

int credential_match(const struct credential *want,
		     const struct credential *have)
{
#define CHECK(x) (!want->x || (have->x && !strcmp(want->x, have->x)))

	printf("oi\n");
	printf("%s.%s.\n", want->protocol, have->protocol);
	printf("%s.%s.\n", want->host, have->host);
	printf("%s.%s.\n", want->path, have->path);
	printf("%s.%s.\n", want->username, have->username);
	return CHECK(protocol) &&
	       CHECK(host) &&
	       CHECK(path) &&
	       CHECK(username);
#undef CHECK
}