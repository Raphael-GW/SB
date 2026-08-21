.equ STDIN, 0
.equ STDOUT, 1

.equ localSize, 16

.text
.global main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $localSize, %rsp

    movl $3, %edx
    leaq $
