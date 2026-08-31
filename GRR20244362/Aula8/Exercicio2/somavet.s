.equ STDOUT, 1
.equ localSize, 80

.section .bss
.lcomm Vet1 64
.lcomm Vet2 64

.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $localSize, %rsp

    movq $Vet1, %rcx
    movl $64, %eax
loop_vet1:
    movl $64, %rdx
    subl %eax, %edx
    movb %dl, (%rcx)
    incq %rcx
    subl $1, %eax
    jnz loop_vet1

    movq $Vet2, %rcx
    movl $64, %eax
loop_vet2:
    movl $eax, %edx
    movb %dl, (%rcx)
    incq %rcx
    subl $1, %eax
    jnz loop_vet2


    
