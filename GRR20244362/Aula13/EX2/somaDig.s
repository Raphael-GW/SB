.text
.globl somaDig
.type somaDig, @function
somaDig:
	pushq %rbp
	movq %rsp, %rbp

	pushq %r12
	movl %edi, %r12d
	movl $0, %eax
	cmpl %r12d, %eax
	je fim

	movl %r12d, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	
	pushq %rdx
	movl %eax, %edi
	call somaDig
	popq %rdx
	addl %edx, %eax

fim:
	popq %r12
	movq %rbp, %rsp
	popq %rbp
	ret
