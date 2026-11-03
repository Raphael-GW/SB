.section .rodata
printFormat: 
  .string "BRK: %p\n"
  
.text
.globl main
.type main, @function
main:
  pushq %rbp
  movq %rsp, %rbp

  movq $12, %rax #numero brk
  movq $0, %rdi
  syscall # rax contem brk

  movq %rax, %rsi
  movq $printFormat, %rdi
  movq $0, %rax
  call printf

  movq $12, %rax #numero brk
  movq $0, %rdi
  syscall # rax contem brk
  movq %rax, %rdi
  addq $1, %rdi # aloca 1 byte
  movq $12, %rax 
  syscall

  movq $12, %rax #numero brk
  movq $0, %rdi
  syscall # rax contem brk
  
  movq %rax, %rsi
  movq $printFormat, %rdi
  movq $0, %rax          
  call printf

  movq $12, %rax #numero brk 
  movq $0, %rdi
  syscall # rax contem brk
  movq %rax, %rdi
  addq $16, %rdi # aloca 16 byte
  movq $12, %rax   
  syscall

  movq $12, %rax #numero brk
  movq $0, %rdi
  syscall # rax contem brk
  
  movq %rax, %rsi
  movq $printFormat, %rdi
  movq $0, %rax          
  call printf

  movq $12, %rax #numero brk 
  movq $0, %rdi
  syscall # rax contem brk
  movq %rax, %rdi
  addq $4096, %rdi # aloca 4096 bytes
  movq $12, %rax
  syscall

  movq $12, %rax #numero brk
  movq $0, %rdi
  syscall # rax contem brk

  movq %rax, %rsi
  movq $printFormat, %rdi
  movq $0, %rax
  call printf


  movq %rbp, %rsp
  popq %rbp
  ret
