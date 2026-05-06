section .data
SYS_EXIT    equ 1
STATUS  equ 7               ; 0-255
SYSCALL_RQ  equ 0x80        ; 128 / 80h / 0x80 / 0200 / 0b10000000

section .text
global _start
_start:
    mov eax, SYS_EXIT
    mov ebx, STATUS
    int SYSCALL_RQ