%include '../library32.inc'
            global  _start

            section .bss                ; block started by symbol; dados não inicializados
var:        resb    16                  ; reserve    
var_LEN     equ     $ - var

            section .data               ; dados inicializados, constante
newline:    db      LF
newline_LEN equ     $ - newline      

k:          db      'Oi, '              ; define
k_LEN       equ     $ - k

           section .text
_start:
%include 'aula23_mod.asm'
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
