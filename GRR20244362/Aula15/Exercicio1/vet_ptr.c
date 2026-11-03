#include <stdio.h>
#include "vet_ptr.h"

int main (){
	int n;
	scanf ("%d", &n);
	int vet[n];
	for (int i = 0; i < n; ++i){
		int num;
		scanf ("%d", &num);
		vet[i] = num;
	}
	int total = vet_int (vet, n);
	printf ("Total: %d", total);
	return 0;
}
