global _start
section .bss
s: resb 16
section .text
_start:
; leitura
mov ecx, s
mov edx, 16

mov eax, 3
mov ebx, 0
int 128   


; escrita
mov ecx, s
mov edx, 16

mov eax, 4
mov ebx, 1
int 128   


; saída
mov eax, 1
mov ebx, 0
int 128  
