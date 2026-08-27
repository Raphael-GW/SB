.equ localSize, -16
.equ ptrInt, -8

.section .rodata
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
    leaq ptrInt(%rbp), %rbx  # 
fibonacci:
    
