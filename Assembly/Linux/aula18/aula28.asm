    global _start

_start:
                    ; title <- definir
    mov esi, 8
.args:
    mov ecx, [esp + esi]          
    cmp ecx, 0
    jz fim

    mov edx, 0      ; número de caracteres ; xor edx, edx
.chars:             ; alternativa push/pop ecx ; mov esi-><-ecx 
    cmp byte [ecx + edx], 0   
    jz .fim_chars

    inc edx
    jmp .chars

.fim_chars:
    call escrita
                    ; space <- definir
    add esi, 4
    jmp .args

;.fim_args:

fim:
                    ; line feed <- definir
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; status ; xor ebx, ebx
    int 128         ; 0x80 ; 80h

escrita:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; tela, terminal
    int 128
    ret
