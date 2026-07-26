%include '../library32.inc'
;label      opcode  operand(s,)         comment
            global  _start

            section .bss                ; block started by symbol; dados não inicializados
var:        resb    16                  ; reserve    
var_LEN     equ     $ - var

            section .data               ; dados inicializados, constante
newline:    db      LF
newline_LEN equ     $ - newline      

k:          db      'Oi, '              ; define
k_LEN       equ     $ - k

; início do módulo
title1:     db      'Atribuição em tempo de projeto', LF
title1_LEN  equ     $ - title1      

inicial:    db      'Inicialização: ', LF
inicial_LEN equ     $ - inicial      

nova:       db      LF, LF, 'Nova atribuição: ', LF
nova_LEN    equ     $ - nova      

           section .text
_start:
            mov     ecx, title1
            mov     edx, title1_LEN     ; 31
            call    escrita

            mov     ecx, inicial
            mov     edx, inicial_LEN    ; 16
            call    escrita

            mov     ecx, k
            mov     edx, k_LEN          ; 4
            call    escrita

            mov     dword [var], `Lara` ; little endian
            mov     ecx, var
            mov     edx, var_LEN        ; 16
            call    escrita

            mov     ecx, nova
            mov     edx, nova_LEN       ; 20
            call    escrita

            mov     ecx, k
            mov     edx, k_LEN          ; 4
            call    escrita

            mov     dword [var], `Ana ` ;Ana Liz'
            mov     word [var + 4], `Li` 
            mov     byte [var + 6], `z`
            mov     ecx, var
            mov     edx, var_LEN        ; 7
            call    escrita
; final do módulo

            mov     ecx, newline
            mov     edx, newline_LEN    ; 1
            call    escrita

            mov     eax, SYS_EXIT       
            mov     ebx, STATUS
            int     SYSCALL_RQ

escrita:
            mov     eax, SYS_WRITE           
            mov     ebx, STDOUT
            int     SYSCALL_RQ
            ret
