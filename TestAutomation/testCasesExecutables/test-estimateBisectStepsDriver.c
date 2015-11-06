/*
Tested Module:
	bisect.c

Tested the function: 
	int estimate_bisect_steps(int all)
		all is the number of piece of data to process

Driver:
	Input:
		receives a int as parameter to estimates the bisect steps
	Output:
		returns the number of steps left
	Usage:
		./test-estimateBisectStepsDriver 5
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "bisect.h"

int main(int argc, char *argv[]) {
	assert(argc > 1);
	int stepsLeft = estimate_bisect_steps(atoi(argv[1]));
	printf("%d\n", stepsLeft);
	return 0;
}
	