%include 'library32.inc'
section .data
literal:    db  'VARIÁVEL - atribuição em tempo de execução'
literal_len equ $ - literal

literal1:       db  LF, 'Informe um nome: ' 
literal1_len    equ   $ - literal1

literal2:       db  LF, 'Nome informado: ' 
literal2_len    equ   $ - literal2

section .bss
variavel:   resb    15

section .text
global _start
_start:
    mov ecx, literal
    mov edx, literal_len
    call escrita

    mov ecx, literal1
    mov edx, literal1_len
    call escrita

    mov ecx, variavel
    mov edx, 15
    call leitura

    mov ecx, literal2
    mov edx, literal2_len
    call escrita

    mov ecx, variavel
    mov edx, 15
    call escrita

    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYSCALL_RQ

escrita:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int SYSCALL_RQ
    ret

leitura:
    mov eax, SYS_READ
    mov ebx, STDIN
    int SYSCALL_RQ
    ret