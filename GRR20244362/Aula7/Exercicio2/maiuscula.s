.equ STDIN, 0
.equ STDOUT, 1

.equ localSize, -32
.equ ptrStr, -32

.section .rodata
scanFormat:
    .string "%s"

.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp

    leaq ptrStr(%rbp), %rsi
    movq $scanFormat, %rdi
    movq $0, %rax
    call scanf

    movq ptrStr(%rbp), %rsi
    movq $scanFormat, %rdi
    movq $0, %rax
    call printf
    jmp fim
fim:
    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
