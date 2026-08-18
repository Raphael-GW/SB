    .equ vetor, -16
    .equ local_size, 16
    .equ STDIN, 0
    .equ STDOUT, 1
    .text
    .global main
    .type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $local_size, %rsp
    
    movl $3, %edx
    leaq vetor(%rbp), %rsi
    movl $STDIN, %edi
    call read

    movl $3, %edx
    leaq vetor(%rbp), %rsi
    movl $STDOUT, %edi
    call write

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret

