        global _start

        section .rodata
space:  db  32          ; ' '
lf:     db  10          ; '\n'
K:      db  'Oi, '      ; LEN = 4

; início do módulo
        section .data
title:  db  'ATRIBUIÇÃO EM TEMPO DE INVOCAÇÃO', 10
title_LEN   equ $ - title

msg:    db  'Entrada por linha de comando', 10
msg_LEN equ $ - msg

        section .text
_start:
        mov ecx, title
        mov edx, title_LEN
        call escrita

        mov ecx, msg
        mov edx, msg_LEN
        call escrita

        mov ecx, K
        mov edx, 4
        call escrita

        mov esi, 8      ; contar (número de) argumentos      
.args:
        mov ecx, [esp + esi]          
        cmp ecx, 0
        jz fim

        xor edx, edx    ; contar (número de) caracteres 
.chars:                 ; alternativas: push/pop ecx e mov esi-><-ecx 
        cmp byte [ecx + edx], 0   
        jz .fim_chars

        inc edx
        jmp .chars

.fim_chars:
        call escrita

        mov ecx, space
        mov edx, 1
        call escrita

        add esi, 4
        jmp .args

;.fim_args:
; final do módulo
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
