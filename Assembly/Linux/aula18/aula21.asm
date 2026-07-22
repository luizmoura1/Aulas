%include '../library32.inc'
;label  opcode  operand(s,)            comment
           global  _start

           section .data               ; dados inicializados, constante
k:         db      'Oi, '              ; define
k_LEN      equ     $ - k

title1:    db      'Atribuição em tempo de projeto', LF
title1_LEN equ     $ - title1      

           section .bss                ; block started by symbol; dados não inicializados
var:       resb    16                  ; reserve    
var_LEN    equ     $ - var

           section .text
_start:
           mov     ecx, title1
           mov     edx, title1_LEN     ; 31
           call    escrita

           mov     ecx, k
           mov     edx, k_LEN          ; 4
           call    escrita

           mov     dword [var], `Lara` ; little endian
           mov     ecx, var
           mov     edx, var_LEN        ; 16
           call    escrita
                                       ; saída:
           mov     eax, SYS_EXIT       
           mov     ebx, STATUS
           int     SYSCALL_RQ

escrita:
           mov     eax, SYS_WRITE           
           mov     ebx, STDOUT
           int     SYSCALL_RQ
           ret
