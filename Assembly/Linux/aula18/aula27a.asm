;label  opcode  operand comment
    global _start

_start:
    mov ecx, [esp + 8]          
    cmp ecx, 0
    jz fim

    mov edx, 1      ; 1 caractere
chars:
    cmp byte [ecx], 0
    jz fim_chars

    inc ecx
    jmp chars

fim_chars:
    call escrita

fim:

    mov eax, 1      ; sys_exit
    mov ebx, 0      ; status
    int 128         ; 0x80 ; 80h

escrita:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; tela, terminal
    int 128
    ret
