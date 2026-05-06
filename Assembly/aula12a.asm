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
    mov esi, [esp + 8]
    cmp esi, 0          ; endereço não pode ser 0 (área reservado); test esi, esi
    jz saida

; esp       -> registrador ponteiro de pilha

; esp + 0   -> endereço do topo da pilha    ; simplesmente esp
; [esp + 0] -> DADO argc (inteiro = 1 + número de argumentos)

; esp + 4   -> endereço seguinte da pilha
; [esp + 4] -> ENDEREÇO onde começa o nome do programa (string arg[0])

; esp + 8   -> endereço seguinte da pilha
; [esp + 8] -> ENDEREÇO onde começa o primeiro argumento (string arg[1])

caractere:
    mov cl, [esi]
    cmp cl, 0                                                       ; test cl, cl
    jz saida

; r?x (64 bits = 8bytes); e?x (32 bits = 4 bytes); ?x (16 bits = 2 bytes); ?h / ?l (8 bits = 1 byte)
; r = register  ; e = enhanced ; x = extended

    mov ecx, esi
    call escrita
    inc esi 
    jmp caractere

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