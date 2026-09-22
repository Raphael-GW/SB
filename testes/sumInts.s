.text
.globl sumInts
.type sumInts, @function
sumInts:
    movq %rdi, %rax
    addq %rsi, %rax
    ret

.text
.globl fibo
.type fibo, @function
fibo:
    movq $0, %r12
    movq $1, %r13
    movq $0, %r11
while:
    movq %r13, %rax
    addq %r12, %r13
    movq %rax, %r12
    movq %r13, %rax
    addq $1, %r11
    cmp %r11, %rdi
    jne while

    ret
    
