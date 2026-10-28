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

    movq $15, %rdx
    leaq ptrStr(%rbp), %rsi
    movq $0, %rdi
    movq $0, %rax
    syscall
    leaq ptrStr(%rbp), %rbx #guarda o endereço inicial do buffer
    movq $1, %r12
while:
    movb (%rbx), %al  # le o byte atual
    cmpb $0, %al
    je print

    cmpb $'a', %al
    jb prox
    cmpb $'z', %al
    ja prox
    subb $32, (%rbx)
    addq $1, %r12
prox:
    incq %rbx
    jmp while

print:
    movq %r12, %rdx
    leaq ptrStr(%rbp), %rsi
    movq $1, %rdi
    movq $1, %rax
    syscall

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
