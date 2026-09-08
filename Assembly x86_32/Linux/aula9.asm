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

    ;mov dword [variavel], 'Lara'   ; 0x6172614C    | 1634894156  | 14134460514q
    mov word [variavel], 'La'       ; 0x614C        | 24908       | 60514q        
    mov word [variavel + 2], 'ra'   ; 0x6172        | 24946       | 60562q
    mov ecx, variavel
    mov edx, 4
    call escrita

    mov ecx, literal2
    mov edx, literal2_len
    call escrita

    ;mov ??? [variavel], 'Nicole' 
    ;mov dword [variavel], 'Nico'   ; 0x6F63694E    | 1868785998  | 15730664516q
    ;mov word [variavel + 4], 'le'  ; 0x656C        | 25964       | 62554q
    mov byte [variavel], 'N'        ; 0x4E          | 78          | 116q
    mov byte [variavel + 1], 'i'    ; 0x69          | 105         | 151q 
    mov byte [variavel + 2], 'c'    ; 0x63          | 99          | 143q
    mov byte [variavel + 3], 'o'    ; 0x6F          | 111         | 157q  
    mov byte [variavel + 4], 'l'    ; 0x6C          | 108         | 154q 
    mov byte [variavel + 5], 'e'    ; 0x65          | 101         | 145q
    mov ecx, variavel
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