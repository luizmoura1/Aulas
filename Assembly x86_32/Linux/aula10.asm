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
    ; direct memory addressing 
    ;mov word [variavel], 'Ni'
    ;mov word [variavel + 2], 'co'
    ;mov word [variavel + 4], 'le'
    ; register indirect addressing: qualquer registrador de uso geral: eax, ebx, edx, inclusive ecx
    mov ecx, variavel 
    mov byte [ecx], 'N'
    inc ecx      
    mov byte [ecx], 'i'
    inc ecx   
    mov byte [ecx], 'c'
    inc ecx  
    mov byte [ecx], 'o'
    inc ecx    
    mov byte [ecx], 'l'
    inc ecx   
    mov byte [ecx], 'e'  
    mov ecx, variavel       ; alternativas: dec ecx (5 vezes!) ou sub ecx, 5
    mov edx, 6
    call escrita

    mov ecx, novaLinha
    mov edx, 1
    call escrita

    jmp saida

escrita:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int SYSCALL_RQ
    ret

saida:
    mov eax, SYS_EXIT
    mov ebx, STATUS
    int SYSCALL_RQ