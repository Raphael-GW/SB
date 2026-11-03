#include <unistd.h>
#include <stdint.h>
#include <stdio.h>

void* alocarMemoria (intptr_t bytes){
    int alinhamento = ()
    return sbrk (16 * (alinhamento));   
}

void* valorBRK(){
    return sbrk(0);
}

int main (){
    int n = 17;
    void* brk1 = valorBRK();
    printf ("BRK: %p\n", brk1);

    void* brk2 = alocarMemoria (n);
    
    printf ("BRK: %p\n", brk2);

    printf ("DIFF: %p\n", brk2 - brk1);
    return 0;
}   
