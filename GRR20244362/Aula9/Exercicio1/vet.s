.equ STDOUT, 1
.equ localSize, 16

.section .rodata
printFormat:
    .string "%s"

.section .rodata
StringNorm:
    .string "Ola\n"

.section .bss
.lcomm Vetor 16

.text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $localSize, %rsp

    movq $Vetor, %rcx
    movq $StringNorm, -8(%rbp)
    movq -8(%rbp), %rdx
loop_vet:
    movq (%rdx), %r13
    movq %r13, (%rcx)
    incq %rdx
    incq %rcx
    cmpb $0, (%rdx)
    jne loop_vet

    movq $Vetor, %rcx
loop_maiuscula:
    cmpb $97, (%rcx)
    jl prox
    cmpb $122, (%rcx)
    ja prox

    subq $32, (%rcx)
    jmp prox
prox:
    incq %rcx
    cmpb $0, (%rcx)
    je print
    jmp loop_maiuscula
    
print:
    movq $Vetor, %rsi
    movq $printFormat, %rdi
    movq $0, %rax
    call printf
    
    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
    
