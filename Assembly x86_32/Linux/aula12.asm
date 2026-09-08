%include 'library32.inc'
section .data
literal:    db  'VARIÁVEL'
literal_len equ $ - literal

literal1:       db  LF, 'Atribuição em tempo de invocação: ' 
literal1_len    equ   $ - literal1

novaLinha:  db  LF

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

    mov edx, 1
    mov esi, [esp + 8]  ; explicar: [esp + 0] ou [esp] contém argc; [esp + 4] contém nome do programa; [esp + 8] contém primeiro argumento
    cmp esi, 0
    jz saida

caractere:
    mov cl, [esi]       ; ecx versus cx versus cl       
    cmp cl, 0
    jz saida
    
    mov ecx, esi
    call escrita
    inc esi 
    jmp caractere

    jmp saida

escrita:
    mov eax, SYS_WRITE
    int SYSCALL_RQ
    ret

saida:
    mov ecx, novaLinha
    call escrita
    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYSCALL_RQ