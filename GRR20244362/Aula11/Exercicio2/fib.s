.text
.globl fib
.type fib, @function
fib:
  cmpq %rdi, $0
  je ret_0

  cmpq %rdi, $1
  je ret_1

  dec %rdi
  call fib

