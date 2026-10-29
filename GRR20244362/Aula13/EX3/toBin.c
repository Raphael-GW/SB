#include <stdio.h>
#include "toBin.h"

int main (){
    int n;
    scanf ("%d", &n);
    int t = sumDig (n);
    printf ("%d\n", t);
    return 0;
}