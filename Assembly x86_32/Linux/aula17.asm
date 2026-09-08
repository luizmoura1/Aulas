%include 'library32.inc'
SIZE    equ 15

section .data
title:    db  'VARIÁVEL - atribuição em tempo de execução'
title_len equ $ - title

prompt:       db  LF, 'Informe um nome: ' 
prompt_len    equ   $ - prompt

msg:       db  LF, 'Nome informado: ' 
msg_len    equ   $ - msg

section .bss
variavel: resb SIZE                     ;12345 67890 abcde'\n'
lixo:   resb 1

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
    call leitura                        ; kernel coloca o número de bytes lidos em eax
    push eax                            ; preservar o número de bytes lidos na pilha

    cmp byte [variavel + eax - 1], LF   ; compare    
    je conteudo_ok                      ; jz

limpar:
    mov ecx, lixo
    mov edx, 1
    call leitura

    cmp byte [lixo], LF
    jne limpar
    mov byte [variavel + SIZE -1], LF   ; jnz 

conteudo_ok:
    mov ecx, msg
    mov edx, msg_len
    call escrita

    mov ecx, variavel
    pop edx                             ; trocar edx por pilha
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
