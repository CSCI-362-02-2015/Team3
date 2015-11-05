/*
Driver to test the function 
	int estimate_bisect_steps(int all)

The driver receives a int as parameter to estimates the bisect steps
e.g: ./test-estimateBisectSteps 5
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "bisect.h"

int main(int argc, char *argv[]) {
	assert(argc > 1);
	int stepsLeft = estimate_bisect_steps(atoi(argv[1]));
	printf("%d\n", stepsLeft);
	return 0;
}
	