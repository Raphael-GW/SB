#include <stdio.h>
#include "toBin.h"

int main (){
	int n;
	scanf ("%d", &n);
	int b = toBin (n);
	printf ("Bin: %d\n", b);
	return 0;
}
