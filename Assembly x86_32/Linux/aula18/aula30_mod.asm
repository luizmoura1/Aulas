; início do módulo
        section .data
title:  db  10, 10, 'ATRIBUIÇÃO EM TEMPO DE INVOCAÇÃO', 10
title_LEN   equ $ - title

msg:    db  'Entrada por linha de comando:', 10
msg_LEN equ $ - msg

        section .text
        mov ecx, title
        mov edx, title_LEN
        call escrita

        mov ecx, msg
        mov edx, msg_LEN
        call escrita

        mov ecx, k
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
