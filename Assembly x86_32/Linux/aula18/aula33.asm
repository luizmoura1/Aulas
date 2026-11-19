; edição de exec.asm incluindo strings de título e de prompt, organizando as rotinas de escrita e leitura
global _start

section .data
title:      db  'ATRIBUIÇÃO EM TEMPO DE EXECUÇÃO', 10
title_LEN   equ $ - title

prompt:     db  'Informe seu nome: '
prompt_LEN  equ   $ - prompt

k:          db  'Oi, ' 

section .bss
var:        resb 16     ; 'A' 'n' 'a' '\n' 0000 0000 0000
overflow    resb 1      ; '\0' lixo, garbage, bytes excedentes 

section .text
_start:
    mov     ecx, title
    mov     edx, title_LEN
    call    escrita

    mov     ecx, prompt
    mov     edx, prompt_LEN
    call    escrita

    mov     ecx, var
    mov     edx, 16
    call    leitura     ; kernel coloca o número de bytes lidos em eax
    push    eax         ; guardar na pilha o números de bytes lidos 

    cmp     [var + eax - 1], 10        ; compare ; byte?
    je      greeting                   ; jz

flushing:
    mov     ecx, overflow
    mov     edx, 1
    call    leitura

    cmp     [overflow], 10             ; byte?
    jne     flushing                   ; jnz 

    mov     [var + 16 -1], 10          ; byte

greeting:
    mov     ecx, k
    mov     edx, 4
    call    escrita

    mov     ecx, var
    pop     edx         ; recupera da pilha o número de bytes lidos
    call    escrita

; saída
    mov     eax, 1  ; SYS_EXIT
    mov     ebx, 0  ; STATUS
    int     128     ; SYSCALL_RQ

leitura:
    mov     eax, 3  ; SYS_READ
    mov     ebx, 0  ; STDIN
    int     128     ; SYSCALL_RQ
    ret

escrita:
    mov     eax, 4  ; SYS_WRITE
    mov     ebx, 1  ; STDOUT
    int     128     ; SYSCALL_RQ  
    ret

