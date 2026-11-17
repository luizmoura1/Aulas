; edição de exec.asm incluindo strings de título e de prompt, organizando as rotinas de escrita e leitura
global _start

section .data
title:    db  'ATRIBUIÇÃO EM TEMPO DE EXECUÇÃO', 10, 10
title_LEN equ $ - title

prompt:       db  'Informe um nome: ', 10
prompt_LEN    equ   $ - prompt

msg:       db  'Nome informado: ' 
msg_LEN    equ   $ - msg


section .bss
s: resb 16

section .text
_start:
mov ecx, title
mov edx, title_LEN
call escrita

mov ecx, prompt
mov edx, prompt_LEN
call escrita

mov ecx, s
mov edx, 16
call leitura

mov ecx, msg
mov edx, msg_LEN
call escrita

mov ecx, s
mov edx, 16
call escrita

; saída
mov eax, 1
mov ebx, 0
int 128  

leitura:    ; leitura
mov eax, 3
mov ebx, 0
int 128   
ret

escrita:    ; escrita
mov eax, 4
mov ebx, 1
int 128   
ret

