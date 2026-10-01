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
    jle base

    # Primeira chamada recursiva: fib(n - 1)
    decq %rdi             
    call fib              
    movq %rax, %r12       

    # Segunda chamada recursiva: fib(n - 2)
    movq %rbx, %rdi
	subq $2, %rdi
	call fib              

    # Soma os resultados: fib(n - 1) + fib(n - 2)
    addq %r12, %rax       # %rax = %r12 + %rax (o resultado final fica em %rax)

    jmp end

base:
    movq %rbx, %rax       # Caso base: retorna n (0 ou 1) em %rax

end:
    # Epílogo: restaura os registradores salvos
    popq %r12
    popq %rbx
    
    movq %rbp, %rsp
    popq %rbp
    ret
