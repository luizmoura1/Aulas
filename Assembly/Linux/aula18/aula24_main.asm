%include '../library32.inc'
            global  _start
            global var, k
            global escrita
            extern aula24_mod_start

            section .bss                
var:        resb    16                      
;var_LEN     equ     $ - var            ; var_LEN não pode ser exportada

            section .data               ; alternativa: section .rodata
newline:    db      LF
;newline_LEN equ     $ - newline        ; trocar newline_LEN por 1     

k:          db      'Oi, '              ; CUIDADO: se alterar, atualizar tamanho no módulo
;k_LEN       equ     $ - k              ; k_LEN não pode ser exportada

           section .text
_start:
call aula24_mod_start                   ;%include 'aula23_mod.asm'
            mov     ecx, newline
            mov     edx, 1              ; newline_LEN
            call    escrita

            mov     eax, SYS_EXIT       
            mov     ebx, STATUS
            int     SYSCALL_RQ

escrita:
            mov     eax, SYS_WRITE           
            mov     ebx, STDOUT
            int     SYSCALL_RQ
            ret
