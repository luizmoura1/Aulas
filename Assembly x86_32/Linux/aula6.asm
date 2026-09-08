section .data
SYS_EXIT    equ 1
SYS_WRITE   equ 4
SYS_READ    equ 3
STATUS      equ 0
SYSCALL_RQ  equ 128
STDOUT      equ 1
STDIN       equ 0
LF          equ 10

msg1:       db  'Informe um nome: ', LF     ; 1a mensagem + line feed    ; db define byte
msg1_len   equ   $ - msg1
msg2:       db  LF, 'Nome informado: '      ; line feed + 2a mensagem  
msg2_len   equ   $ - msg2

section .bss
nome:   resb  12

section .text
global _start
_start:
    ;call escrita                    ; gosub label; return
    ;call leitura
    ;call escrita
    ;call escrita
    ;jmp saida                       ; goto label

;escrita:
    mov eax, SYS_WRITE              ; escrita
    mov ebx, STDOUT                 ; arg0: fd: tela
    mov ecx, msg1                   ; arg1: endereço
    mov edx, msg1_len               ; arg2: número de bytes
    int SYSCALL_RQ                  ; chama kernel para executar escrita
    ;ret

;leitura:
    mov eax, SYS_READ               ; leitura
    mov ebx, STDIN                  ; arg0: fd: teclado
    mov ecx, nome                   ; arg1: endereço
    mov edx, 12                     ; arg2: número de bytes
    int SYSCALL_RQ                  ; chama kernel para executar escrita
    ;ret

;escrita:
    mov eax, SYS_WRITE              ; escrita
    mov ebx, STDOUT                 ; arg0: fd: tela
    mov ecx, msg2                   ; arg1: endereço
    mov edx, msg2_len               ; arg2: número de bytes
    int SYSCALL_RQ                  ; chama kernel para executar escrita
    ;ret

;escrita:
    mov eax, SYS_WRITE              ; escrita
    mov ebx, STDOUT                 ; arg0: fd: tela
    mov ecx, nome                   ; arg1: endereço
    mov edx, 12                     ; arg2: número de bytes
    int SYSCALL_RQ                  ; chama kernel para executar escrita
    ;ret


saida:
    mov eax, SYS_EXIT               ; saída
    mov ebx, STATUS                 ; arg0: status/error code
    int SYSCALL_RQ                  ; chama kernel para executar saída