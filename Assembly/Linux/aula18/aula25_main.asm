%include '../library32.inc'
            global  _start
            global var, k
            global escrita
            extern aula25_mod_start

            section .bss                
var:        resb    16                      

            section .rodata
newline:    db      LF
k:          db      'Oi, '

           section .text
_start:
call aula25_mod_start
            mov     ecx, newline
            mov     edx, 1
            call    escrita

            mov     eax, SYS_EXIT       
            mov     ebx, STATUS
            int     SYSCALL_RQ

escrita:
            mov     eax, SYS_WRITE           
            mov     ebx, STDOUT
            int     SYSCALL_RQ
            ret
