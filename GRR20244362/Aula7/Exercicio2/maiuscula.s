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
    leaq ptrStr(%rbp), %rbx #guarda o endereço inicial do buffer

while:
    movb (%rbx), %al  # le o byte atual
    cmpb $0, %al
    je print

    cmpb $'a', %al
    jb prox
    cmpb $'z', %al
    ja prox
    subb $32, (%rbx)

prox:
    incq %rbx
    jmp while

print:
    leaq ptrStr(%rbp), %rsi
    movq $scanFormat, %rdi
    movq $0, %rax
    call printf

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
