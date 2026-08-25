.equ STDIN, 0
.equ STDOUT, 1

.equ localSize, 32
.equ ptrStr, -32

.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $localSize, %rsp

    leaq ptrStr(%rbp), %rsi
    movq $0, %rax
    call scanf

    movq ptrStr(%rbp), %rsi
    movq $0, %rax
    call printf
    jmp fim
fim:
    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
