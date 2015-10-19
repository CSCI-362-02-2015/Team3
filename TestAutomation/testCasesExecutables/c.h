
struct credential {
	char *username;
	char *password;
	char *protocol;
	char *host;
	char *path;
};


int credential_match(const struct credential *want,
	 const struct credential *have);