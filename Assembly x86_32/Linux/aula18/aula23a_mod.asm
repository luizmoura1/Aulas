; início do módulo
            section .data               ; dados inicializados, 'constante'
title1:     db      'ATRIBUIÇÃO EM TEMPO DE PROJETO', 10
title1_LEN  equ     $ - title1      

inicial:    db      'Inicialização: ', 10
inicial_LEN equ     $ - inicial      

nova:       db      10, 10, 'Nova atribuição: ', 10
nova_LEN    equ     $ - nova      

           section .text
            mov     ecx, title1
            mov     edx, title1_LEN     ; 31
            call    escrita

            mov     ecx, inicial
            mov     edx, inicial_LEN    ; 16
            call    escrita

            mov     ecx, k
            mov     edx, 4
            call    escrita

            mov     dword [var], `Lara` ; little endian
            mov     ecx, var
            mov     edx, 4
            call    escrita

            mov     ecx, nova
            mov     edx, nova_LEN       ; 20
            call    escrita

            mov     ecx, k
            mov     edx, 4
            call    escrita

            mov     dword [var], `Ana ` ; Ana Liz'
            mov     word [var + 4], `Li` 
            mov     byte [var + 6], `z`
            mov     ecx, var
            mov     edx, 7
            call    escrita
; final do módulo
