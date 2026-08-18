.text
.global main
.type main, @function
main:
	pushq %rsp #salva o frame pointer na pilha
	movq %rsp, %rbp #copiar o stack pointer para o frame pointer
	subq $16, %rsp #abre 16 bytes de espaço na pilha
	movl $1, 12(%rsp)
	movl $0, 8(%rsp)
	movl $5, %eax
	movq %rbp, %rsp
	popq %rbp
	ret
