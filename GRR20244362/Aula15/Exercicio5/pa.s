.equ localSize, -16
.equ a, -16
.equ r, -12
.equ n, -8

.text
.globl main
.type main, @function
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp         # Aloca espaço na pilha de forma padrão

  # Leitura de 'a' (sys_read)
  movq $4, %rdx
  leaq a(%rbp), %rsi     # Endereço correto de 'a'
  movq $0, %rdi          # STDIN
  movl $0, %eax          # Syscall read (0)
  syscall

  # Leitura de 'r' (sys_read)
  movq $4, %rdx
  leaq r(%rbp), %rsi     # Endereço correto de 'r'
  movq $0, %rdi          # STDIN
  movl $0, %eax          # Syscall read (0)
  syscall

  # Leitura de 'n' (sys_read)
  movq $4, %rdx
  leaq n(%rbp), %rsi     # Endereço correto de 'n'
  movq $0, %rdi          # STDIN
  movl $0, %eax          # Syscall read (0)
  syscall

  movq $1, %r12          # Inicializa o contador do ciclo em 1
  movq n(%rbp), %r13     # Carrega o limite 'n'

  # Escrita inicial de 'a' (sys_write)
  movq $4, %rdx
  leaq a(%rbp), %rsi     # Endereço de 'a'
  movq $1, %rdi          # STDOUT
  movl $1, %eax          # Syscall write (1)
  syscall

while:
  cmp %r13, %r12         # Compara contador (%r12) com o limite (%r13)
  jge fim                # Se %r12 >= %r13, sai do ciclo

  movq a(%rbp), %rax
  movq r(%rbp), %r9
  
  # Exemplo de cálculo corrigido sem corromper o contador diretamente se necessário, 
  # ou mantendo a lógica ajustada:
  imulq %r9, %rax        # Multiplica 'a' por 'r' (ou ajuste conforme a fórmula pretendida)
  addq %rax, a(%rbp)     # Atualiza 'a'
  
  incq %r12              # Incrementa o contador do ciclo em segurança

  # Escrita do valor atualizado de 'a' (sys_write)
  movq $4, %rdx
  leaq a(%rbp), %rsi
  movq $1, %rdi          # STDOUT
  movl $1, %eax          # Syscall write (1)
  syscall
  
  jmp while

fim:
  movq %rbp, %rsp
  popq %rbp
  movl $0, %eax
  ret
