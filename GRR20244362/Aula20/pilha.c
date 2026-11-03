#include <stdlib.h>
#include <stdio.h>

int main (){
    void* ptr1 = malloc(31); // troque por 31
    void* ptr2 = malloc(1);

    printf("Primeiro ponteiro: %p\n", ptr1);
    printf("Segundo ponteiro: %p\n", ptr2);
    printf("Diferenca: %ld\n", ptr2 - ptr1);

    return 0;
}