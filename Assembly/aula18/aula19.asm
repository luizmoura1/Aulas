%include '../library32.inc'
global _start

section .data           ; dados inicializados, constante
s1:  db `Oi!\n`         ; define
s1_LEN   equ $ - s1

section .bss            ; block started by symbol; dados não inicializados
s2: resb    16          ; reserve    
s2_LEN  equ $ - s2

section .text
_start:
mov eax, SYS_WRITE      ; escrita           
mov ebx, STDOUT
mov ecx, s1
mov edx, s1_LEN         ; 4
int SYSCALL_RQ

mov dword [s2], `Ei!\n` ; little endian
mov eax, SYS_WRITE      ; escrita           
mov ebx, STDOUT
mov ecx, s2
mov edx, s2_LEN         ; 16
int SYSCALL_RQ

mov eax, SYS_EXIT       ; saída
mov ebx, STATUS
int SYSCALL_RQ  