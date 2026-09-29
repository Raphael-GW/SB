#include <stdio.h>

#include "fat.h"

int main (){
	
	int n;
	scanf ("%d", &n);

	int result = fat (n);

	printf ("%d\n", result);

	return 0;
}
