section .text
global _start
_start:
    mov eax, 1
    mov ebx, 0  ; 0 é o argumento para a syscall exit
    int 128