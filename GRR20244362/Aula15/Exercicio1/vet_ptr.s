.equ localSize, -16

.text
.globl vet_int
.type vet_int, @function
vet_int:
  pushq %rbp
  movq %rsp, %rbp
  addq $localSize, %rsp

  movq %rdi, %r12
  movq %rsi, %r13
  
  xor %rax, %rax # resultado total
  xor %rcx, %rcx # i = 0

checkFim:
  cmpq %r13, %rcx
  jge fim
  
  movq $10, %r8
  mulq %r8
  movslq (%r12, %rcx, 4), %r9 # r9 = vet*4*i
  addq %r9, %rax
  incq %rcx
  jmp checkFim
  
fim:
  movq %rbp, %rsp
  popq %rbp
  ret
