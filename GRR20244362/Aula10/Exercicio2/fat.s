.text
.globl fat
.type fat, @function
fat:
  pushq %rbp
  movq %rsp, %rbp

  movq %rsi, %rax
  movq %rsi, %r12
  subq $1, %r12;
  mulq %r12
while:
  cmpq $1, %r12
  je fim
  subq $1, %r12
  mulq %r12
  jmp while 

fim:
  movq %rbp, %rsp
  popq %rbp
  ret
