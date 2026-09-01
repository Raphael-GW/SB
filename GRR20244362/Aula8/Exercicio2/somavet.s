.equ STDOUT, 1
.equ localSize, -256

.section .rodata
printFormat:
    .string "%d\n"

.section .bss
.lcomm Vet1 256
.lcomm Vet2 256

.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp

    movq $Vet1, %rcx
    movl $0, %eax
loop_vet1:
    movl %eax, (%rcx)
    addq $4, %rcx
    incl %eax
    cmpl $64, %eax
    jl loop_vet1

    movq $Vet2, %rcx
    movl $0, %eax
loop_vet2:
    movl $64, %edx
    subl %eax, %edx
    movl %edx, (%rcx)
    addq $4, %rcx
    incl %eax
    cmpl $64, %eax
    jl loop_vet2
    
    movq $Vet1, %rcx
    movq $Vet2, %rdx
    movl $0, %r8d
loop_soma:
    movl (%rcx), %eax
    addl (%rdx), %eax

    movq %rbp, %r9
    addq $-256, %r9
    movl %eax, (%r9, %r8, 4)

    addq $4, %rcx
    addq $4, %rdx
    incl %r8d
    cmp $64, %r8
    jnz loop_soma

    movq %rbp, %r12
    addq $-256, %r12
    movl $0, %ebx
loop_print:
    movq $printFormat, %rdi
    movl (%r12, %rbx, 4), %esi
    movl $0, %eax
    call printf

    incl %ebx
    cmpl $64, %ebx
    jl loop_print

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
