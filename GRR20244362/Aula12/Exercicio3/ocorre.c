#include <stdio.h>
#include "ocorre.h"

/*int ocorre (int n, int k){
    if (n == 0) return 0;

    int r = n % 10;
    n = n / 10;
    if (r == k) return ocorre (n, k) + 1;
    return ocorre (n, k);
}*/

int main(){
    int n, k;

    scanf ("%d %d", &n, &k);
    if (k > 9){
        printf ("K deve ser apenas 1 digito\n");
        scanf ("K: %d", &k);
    }
    int oc = ocorre (n, k);
    
    printf ("%d ocorre %d vezes em %d\n", k, oc, n);

    return 0;
}