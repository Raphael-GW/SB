.equ localSize, -16
.text
.globl sumDig
.type sumDig, @function
sumDig:
    pushq %rbp
    movq %rsp, %rbp
    addq $localSize, %rsp

    movq %rdi, %rax
    testq %rax, %rax          # caso base: n == 0 (rax já é 0 e vira o retorno)
    je fim

    xorq %rdx, %rdx
    movq $2, %rcx             # divisor agora é 2
    divq %rcx                 # rax = n / 2, rdx = n % 2
    movq %rdx, localSize(%rbp)  # guarda n % 2 na pilha
    movq %rax, %rdi
    call sumDig               # rax = bin(n / 2)

    imulq $10, %rax           # rax = 10 * bin(n / 2)
    addq localSize(%rbp), %rax  # rax += n % 2
fim:
    movq %rbp, %rsp
    popq %rbp
    ret
    