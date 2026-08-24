.equ STDIN, 0
.equ STDOUT, 1

.equ localSize, -16
.text
.globl main
.extern getline, free, printf, stdin
.type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp

#inicializa variaveis
    movq $0, -8(%rbp)
    movq $0, -16(%rbp)

#camada getline
    leaq -8(%rbp), %rdi
    leaq -16(%rbp), %rsi
    movq stdin(%rip), %rdx
    call getline

    movq -8(%rbp), %rdi
    call printf

    movq -8(%rbp), %rdi
    call free

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
