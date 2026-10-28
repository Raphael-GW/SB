.equ localSize, -16
.equ a, -16
.equ r, -12
.equ n, -8

.text
.globl pa
.type pa, @function
pa:
  pushq %rbp
  movq %rsp, %rbp
  addq $localSize, %rsp

  movq $4, %rdx
  movq $a, %rsi
  movq $0, %rdi
  movl $0, %eax
  syscall

  movq $r, %rsi
  movl $0, %eax
  syscall

  movq $n, %rsi
  movl $0, %eax
  syscall

  movq $1, %r12


