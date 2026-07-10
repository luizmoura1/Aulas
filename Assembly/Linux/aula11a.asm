%include 'library32.inc'
section .data
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
    ; base-offset addressing ou base-displacement addressing: esi + i, onde 0 <= i <= (size - 1) 
    mov ecx, variavel
    mov esi, ecx 
    mov byte [esi], 'N'     ;mov byte [esi + 0], 'N'
    mov byte [esi + 1], 'i'
    mov byte [esi + 2], 'c'
    mov byte [esi + 3], 'o'
    mov byte [esi + 4], 'l'
    mov byte [esi + 5], 'e'
    mov edx, 6  
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
    xor ebx, ebx        ; mov ebx, STATUS
    int SYSCALL_RQ