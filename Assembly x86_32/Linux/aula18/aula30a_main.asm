        global _start

        section .rodata
space:  db  32          ; ' '
lf:     db  10          ; '\n'
k:      db  'Oi, '      ; LEN = 4

        section .bss
var:    resb    16        

        section .text   ; linha nova
_start:                 ; linha nova

%include 'aula23a_mod.asm'
%include 'aula30_mod.asm'

fim:
        mov ecx, lf
        mov edx, 1
        call escrita
    
        mov eax, 1      ; sys_exit
        xor ebx, ebx    ; status 
        int 128         ; 0x80 ; 80h

escrita:
        mov eax, 4      ; sys_write
        mov ebx, 1      ; tela, terminal
        int 128
        ret
