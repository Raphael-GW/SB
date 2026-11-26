.equ STDOUT, 1
.equ localSize, -256

.section .rodata
printFormat:
    .string "%d\n"

.section .bss
.lcomm Vet1 256
.lcomm Vet2 256
.lcomm Vet3 512

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
	movq $Vet3, %rbx
    movl $0, %r8d
loop_vet3:
    movl (%rcx), %eax
	movl %eax, (%rbx)
	addq $4, %rbx
	
	movl (%rdx), %eax
	movl %eax, (%rbx)
	addq $4, %rbx

    addq $4, %rcx
    addq $4, %rdx
    addl $2, %r8d
    cmpq $128, %r8
    jl loop_vet3

	movq $Vet3, %r12
	movl $0, %ebx
loop_print:
    movq $printFormat, %rdi
    movl (%r12), %esi
    movl $0, %eax
    call printf

    incl %ebx
	addq $4, %r12
    cmpl $128, %ebx
    jl loop_print

    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
