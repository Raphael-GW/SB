#fazer código que le a, r n e imprime uma progressão aritmetica começando em a
.equ localSize, -16

.section .rodata
scanFormat:
	.string "%d"

printFormat:
	.string "%d\n"

.text
.globl main
.type main, @function
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $localSize, %rsp

	leaq -16(%rbp), %rsi #pos A
	movq $scanFormat, %rdi
	movl $0, %eax
	call scanf

	leaq -12(%rbp), %rsi #pos R
	movq $scanFormat, %rdi
	movl $0, %eax
	call scanf

	leaq -8(%rbp), %rsi #pos N 
	movq $scanFormat, %rdi
	movl $0, %eax
	call scanf

	movslq -16(%rbp), %rbx  # a
    movslq -12(%rbp), %r12  # r
    movslq -8(%rbp),  %r13  # n

    movq $0, %r14           # i
loop:
    cmpq %r13, %r14
    jge fim

    movq %rbx, %rsi
    movq $printFormat, %rdi
    movl $0, %eax
    call printf

    addq %r12, %rbx
    addq $1, %r14
    jmp loop

fim:
	movl $0, %eax
	movq %rbp, %rsp
	popq %rbp
	ret
	
	
