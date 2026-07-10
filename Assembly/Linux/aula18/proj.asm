global _start
s:  db `Oi!`
_start: mov eax, 4           
mov ebx, 1
mov ecx, s
mov edx, 3
int 128   
mov eax, 1  ; mov ebx, 0
int 128  
