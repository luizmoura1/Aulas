        global _start

        section .rodata
space:  db  32          ; ' '
lf:     db  10          ; '\n'
K:      db  'Oi, '      ; LEN = 4


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
