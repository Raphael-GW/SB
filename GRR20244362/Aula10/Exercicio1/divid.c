#include <stdio.h>

int main (){
	int x, y, resto;
	scanf ("%d %d\n", &x, &y);

	int m = dividir (x, y, &resto);

	printf ("%d\n", m);

	return 0;
}
