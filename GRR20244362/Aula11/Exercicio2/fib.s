.text
.globl fib
.type fib, @function
fib:
    # Prólogo padrão
    pushq %rbp
    movq %rsp, %rbp
    
    # Preserva registradores callee-saved que vamos usar
    pushq %rbx
    pushq %r12

    movq %rdi, %rbx       # Salva o valor de 'n' em %rbx (que é preservado)

    # Caso base: se n <= 1, o resultado é n
    cmpq $1, %rbx
    jle .L_base

    # Primeira chamada recursiva: fib(n - 1)
    decq %rdi             # %rdi = n - 1
    call fib              # %rax = fib(n - 1)
    movq %rax, %r12       # Salva o resultado de fib(n - 1) em %r12

    # Segunda chamada recursiva: fib(n - 2)
    leaq -2(%rbx), %rdi   # %rdi = n - 2 (usando o 'n' original salvo em %rbx)
    call fib              # %rax = fib(n - 2)

    # Soma os resultados: fib(n - 1) + fib(n - 2)
    addq %r12, %rax       # %rax = %r12 + %rax (o resultado final fica em %rax)

    jmp .L_end

.L_base:
    movq %rbx, %rax       # Caso base: retorna n (0 ou 1) em %rax

.L_end:
    # Epílogo: restaura os registradores salvos
    popq %r12
    popq %rbx
    
    movq %rbp, %rsp
    popq %rbp
    ret
