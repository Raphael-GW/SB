.equ STDOUT, 1
.equ ptrOla, -8 # ponteiro para STR_OLA na pilha
.equ localSize, 16

.section .rodata
STR_OLA:
    .string "Ola\n"

.text
.global main
.type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $localSize, %rsp

    movq $STR_OLA, %rsi #carrega o endereço na pilha
    movq %rsi, ptrOla(%rbp) #armazena endereço na pilha
while:
    movq ptrOla(%rbp), %rsi #carrega a posição atual para rsi
    cmpb $0, (%rsi)
    je fimLoop

    movl $1, %edx
    movq $STDOUT, %rdi
    call write

    addq $1, ptrOla(%rbp) #soma um no endereço armazenado na pilha
    jmp while # salto incondicional
fimLoop:
    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret
