section .data
SYS_EXIT    equ 1
SYS_WRITE   equ 4
STATUS      equ 0
SYSCALL_RQ  equ 128
STDOUT      equ 1
LF          equ 10

literal:    db  'VARIÁVEL'
literal_len equ $ - literal

literal1:       db  LF, 'Inicialização: ' 
literal1_len    equ   $ - literal1

literal2:       db  LF, 'Nova atribuição: ' 
literal2_len    equ   $ - literal2

novaLinha:  db  LF

section .bss
variavel:   resb  15

section .text
global _start
_start:
    mov ebx, STDOUT
    mov ecx, literal
    mov edx, literal_len
    call escrita

    mov ecx, literal1
    mov edx, literal1_len
    call escrita

    ;mov dword [variavel], 'Lara'
    mov word [variavel], 'La'
    mov word [variavel + 2], 'ra'
    mov ecx, variavel
    mov edx, 4
    call escrita

    mov ecx, literal2
    mov edx, literal2_len
    call escrita

    ;mov ??? [variavel], 'Nicole'
    ; register indirect addressing: qualquer registrador de uso geral: eax, ebx, edx, inclusive ecx
    mov ecx, variavel
    mov esi, ecx 
    mov byte [esi], 'N'
    inc esi      
    mov byte [esi], 'i'
    inc esi   
    mov byte [esi], 'c'
    inc esi  
    mov byte [esi], 'o'
    inc esi    
    mov byte [esi], 'l'
    inc esi   
    mov byte [esi], 'e'
    inc esi
    mov edx, esi  
    sub edx, ecx
    call escrita

    mov ecx, novaLinha
    mov edx, 1
    call escrita

    jmp saida

escrita:
    mov eax, SYS_WRITE
    int SYSCALL_RQ
    ret

saida:
    mov eax, SYS_EXIT
    mov ebx, STATUS
    int SYSCALL_RQ