%include 'library32.inc'
SIZE    equ 15

section .data
title:    db  'VARIÁVEL - atribuição em tempo de execução'
title_len equ $ - title

prompt:       db  LF, 'Informe um nome: ' 
prompt_len    equ   $ - prompt

literal:       db  LF, 'Nome informado: ' 
literal_len    equ   $ - literal

section .bss
variavel: resb SIZE
bytes_read: resd 1

section .text
global _start
_start:
    mov ecx, title
    mov edx, title_len
    call escrita

    mov ecx, prompt
    mov edx, prompt_len
    call escrita

    mov ecx, variavel
    mov edx, SIZE
    call leitura                ; kernel coloca o número de bytes lidos em eax
    mov [bytes_read], eax       ; preservar o número de bytes lidos na memória

    mov ecx, literal
    mov edx, literal_len
    call escrita

    mov ecx, variavel
    mov edx, [bytes_read]       ; trocar eax por esi
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
