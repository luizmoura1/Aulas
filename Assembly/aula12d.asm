%include 'library32.inc'

section .data
title   db  'VARIÁVEL - tempo de invocação'
title_len   equ $ - title

msg db  LF, 'Argumento(s): '
msg_len   equ $ - msg

space:  db  ' '
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

    mov edi, esp            ; edi = esp = &argc (topo da pilha)
    add edi, 8              ; edi = esp + 8 = &argv[1]

.loop_args:
    mov esi, [edi]          ; esi = argv[i]  (argumento atual)
    cmp esi, 0
    jz saida

    mov ecx, esi            ; ecx estatico, esi dinamico

    mov edx, 0              ; xor edx, edx; contador
 .loop_len:
    cmp byte [esi], 0
    jz .fim_len
       
    inc esi
    inc edx
    jmp .loop_len

.fim_len:    
    call escrita

mov ecx, space
mov edx, 1
call escrita

add edi, 4
jmp .loop_args

saida:
    mov edx, 1
    mov ecx, newline
    call escrita

    mov ebx, STATUS
    mov eax, SYS_EXIT
    int SYSCALL_RQ

escrita:
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int SYSCALL_RQ
    ret
