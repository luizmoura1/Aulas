%include 'library32.inc'

section .data
title   db  'VARIÁVEL - tempo de invocação'
title_len   equ $ - title

msg db  LF, 'Argumento: '
msg_len   equ $ - msg

newline:  db  LF

section .text
global _start
_start:
    mov ecx, title
    mov edx, title_len
    call escrita

    mov ecx, msg
    mov edx, msg_len
    call escrita

    mov esi, [esp + 8]  ; explicar: [esp + 0] ou [esp] contém argc; [esp + 4] contém nome do programa; [esp + 8] contém primeiro argumento
    cmp esi, 0
    jz saida

    mov edx, 1
caractere:
    cmp byte [esi], 0   ; mov cl, [esi]     cmp cl, 0
    jz saida
    
    mov ecx, esi
    call escrita

    inc esi 
    jmp caractere

saida:
    mov ecx, newline
    call escrita

    xor ebx, ebx
    mov eax, SYS_EXIT
    int SYSCALL_RQ

escrita:
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int SYSCALL_RQ
    ret

; similar a draft _inv_esi0.asm