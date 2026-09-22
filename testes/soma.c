#include <stdio.h>
#include "soma.h"

int main (){
	int val1, val2, result;
	scanf ("%d", &val1);

	//result = sumInts (val1, val2);
	result = fibo (val1);

	printf ("%d\n", result);

	return 0;
}
