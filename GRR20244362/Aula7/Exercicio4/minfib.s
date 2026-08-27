.equ localSize, -16
.equ ptrInt, -4
.equ varA, -8
.equ varB, -12
.equ varSoma, -16

section .rodata
scanFormat:
    .string "%d"
.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp
    
    leaq ptrInt(%rbp), %rsi
    movq $scanFormat, %rdi
    movq $0, %rax
    call scanf
    
    #inicia as variaveis
    movq $0, %r8  # a
    movq $1, %r9  # b
    movq $0, %r10 # soma
    
    leaq ptrInt(%rbp), %rdx
    cmpq %
while:
    cmpq %
printb:
    leaq %r9, %rsi
    movq $scanFormat, %rdi
    movq $0, %rax
    call printf
