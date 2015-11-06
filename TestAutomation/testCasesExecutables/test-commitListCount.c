/*
Tested Module:
	commit.c

Tested the function: 
	unsigned commit_list_count(const struct commit_list *l)
		l is a pointer to a commit list struct

Driver:
	Input:
		receives a int indicating the number of items that should be included in the list
	Output:
		returns number of items in the list
	Usage:
		./test-commitListCountDriver 1
*/

#include <assert.h>
#include "commit.c"


int main(int argc, char *argv[]) {
	assert(argc > 1);
	struct commit_list *l = NULL;
	int i;
	int n_items_in_list = atoi(argv[1]);
	for(i=0;i<n_items_in_list;i++) {
		struct commit *c = malloc(sizeof(struct commit));
	    assert(c != NULL);
	    commit_list_insert(c, &l);
	}
	
	printf("%d\n", commit_list_count(l));
	return 0;
}