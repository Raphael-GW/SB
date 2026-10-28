.equ localSize, -16
.text
.globl sumDig
.type sumDig, @function
sumDig:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp

    movq %rdi, %r12
    movq $0, %rax
    cmp %rax, %r12
    je fim
    
    movq %r12, %rax
    xor %rdx, %rdx
    movq $10, %r12
    div %r12
    movq %rdx, localSize(%rbp)
    movq %rax, %rdi
    call sumDig
    movq localSize(%rbp), %rdx
    addq %rdx, %rax
fim:
    movq %rbp, %rsp
    popq %rbp
    ret
