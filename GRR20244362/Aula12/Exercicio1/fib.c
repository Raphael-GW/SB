#include <stdio.h>

#include "fib.h"

int main (){
	int n;

	scanf ("%d", &n);
	int r = fib (n);

	printf ("%d\n", r);

	return 0;
}
