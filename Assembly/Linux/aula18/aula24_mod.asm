; início do módulo
            global aula24_mod_start
            extern escrita
            extern k, var

            section .data               ; dados inicializados, 'constante'
title1:     db      'Atribuição em tempo de projeto', 10
title1_LEN  equ     $ - title1      

inicial:    db      'Inicialização: ', 10
inicial_LEN equ     $ - inicial      

nova:       db      10, 10, 'Nova atribuição: ', 10
nova_LEN    equ     $ - nova      

           section .text
aula24_mod_start:
            mov     ecx, title1
            mov     edx, title1_LEN     ; 31
            call    escrita

            mov     ecx, inicial
            mov     edx, inicial_LEN    ; 16
            call    escrita

            mov     ecx, k
            mov     edx, 4              ; k_LEN (4) não pode ser importada
            call    escrita

            mov     dword [var], `Lara`
            mov     ecx, var
            mov     edx, 4              ; var_LEN (16) não pode ser importada 
            call    escrita

            mov     ecx, nova
            mov     edx, nova_LEN       ; 20
            call    escrita

            mov     ecx, k
            mov     edx, 4              ; k_LEN (4) não pode ser importada
            call    escrita

            mov     dword [var], `Ana ` ; 'Ana Liz'
            mov     word [var + 4], `Li` 
            mov     byte [var + 6], `z`
            mov     ecx, var
            mov     edx, 7              ; var_LEN (16) não pode ser importada
            call    escrita

            ret
; final do módulo
