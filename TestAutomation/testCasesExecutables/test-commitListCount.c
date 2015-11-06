/*
Driver to test the function 
	unsigned commit_list_count(const struct commit_list *l)

The driver receives a int indicating the number of items that should be included in the list
e.g: ./test-commitListCount 1
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
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