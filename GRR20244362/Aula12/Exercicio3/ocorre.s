.text
.globl ocorre
.type ocorre, @function
ocorre:
	pushq %rbp
	movq %rsp, %rbp
	push %r12

	movl %esi, %r12d

	movl $0, %eax
	cmpl $0, %edi
	je fim

	movl %edi, %eax
	movl $10, %r10d
	xorl %edx, %edx
	divl %r10d
	
	movl %eax, %edi
	cmpl %edx, %r12d
	jne prox
	
	call ocorre
	incl %eax
	jmp fim

prox:
	call ocorre

fim:
	popq %r12
	movq %rbp, %rsp
	popq %rbp
	ret
