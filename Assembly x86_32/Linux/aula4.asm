section .data
SYS_EXIT    equ 1
STATUS      equ 0
SYSCALL_RQ  equ 0x80
SYS_WRITE   equ 4
STDOUT      equ 1

string:         db  'Oi, mundo!', `\n`  ;define byte;string = 'Oi,mundo!';backtick/backquote/crase/acento grave
string_length   equ   $ - string

section .text
global _start
_start:
    mov eax, SYS_WRITE              ; escrita
    mov ebx, STDOUT                 ; arg0: fd: tela
    mov ecx, string                 ; arg1: endereço
    mov edx, string_length          ; arg2: número de bytes
    int SYSCALL_RQ                  ; chama kernel para executar escrita

    mov eax, SYS_EXIT               ; saída
    mov ebx, STATUS                 ; arg0: status/error code
    int SYSCALL_RQ                  ; chama kernel para executar saída