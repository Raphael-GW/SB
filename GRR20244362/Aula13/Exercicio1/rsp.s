.section .rodata
GNU:
	.string "GNU is Not Unix\n"

.section .rodata
printFormat:
	.string "Chamada %lu | rsp = %p | %s"

.text
.globl print_rsp
.type print_rsp, @function
print_rsp:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx		#guarda o contador
	subq $16, %rsp

	movq %rdi, %rbx
	movq %rsp, %rdx
	movq %rbx, %rsi
	leaq GNU(%rip), %rcx
	leaq printFormat(%rip), %rdi
	movl $0, %eax
	call printf

	leaq 1(%rbx), %rdi
	call print_rsp

	addq $16, %rsp
	popq %rbx
	popq %rbp
	ret

	

