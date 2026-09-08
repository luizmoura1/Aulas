;label  opcode  operand comment
    mov ecx, [esp + 8]
    cmp ecx, 0
    jz fim

chars:
    cmp byte [ecx], 0
    jz fim

    mov eax, 4      ; sys_write
    mov ebx, 1      ; tela, terminal
    mov ecx, ecx    ; desnecessário porque ecx já contém um endereço
    mov edx, 1      ; 1 caractere
    int 128

    inc ecx
    jmp chars


fim:
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; status
    int 128         ; 0x80 ; 80h