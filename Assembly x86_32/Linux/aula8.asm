section .data
SYS_EXIT    equ 1
SYS_WRITE   equ 4
STATUS      equ 0
SYSCALL_RQ  equ 128
STDOUT      equ 1
LF          equ 10

literal:    db  'CONSTANTE E VARIÁVEL EM TEMPO DE PROJETO'
literal_len equ $ - literal

literal1:       db  LF, 'Inicialização: ', LF 
literal1_len    equ   $ - literal1

literal2:       db  LF, 'Nova atribuição: ', LF 
literal2_len    equ   $ - literal2

novaLinha   db LF
; novaLinha_len    equ   $ - novaLinha

CONSTANTE: db 'Oi, '
constante_len equ $ - CONSTANTE

section .bss
variavel:   resb  15

section .text
global _start
_start:
    mov ecx, literal                ; arg1: endereço
    mov edx, literal_len            ; arg2: número de bytes
    call escrita                    ; gosub label; return

    mov ecx, literal1               ; arg1: endereço
    mov edx, literal1_len           ; arg2: número de bytes
    call escrita                    ; gosub label; return

    mov ecx, CONSTANTE              ; arg1: endereço
    mov edx, constante_len          ; arg2: número de bytes
    call escrita

    mov word [variavel], 'Ed'
    mov ecx, variavel               ; arg1: endereço
    mov edx, 2                      ; arg2: número de bytes
    call escrita

    mov ecx, literal2               ; arg1: endereço
    mov edx, literal2_len           ; arg2: número de bytes
    call escrita                    ; gosub label; return

    mov ecx, CONSTANTE              ; arg1: endereço
    mov edx, constante_len          ; arg2: número de bytes
    call escrita

    mov dword [variavel], 'Luiz'
    mov ecx, variavel               ; arg1: endereço
    mov edx, 4                      ; arg2: número de bytes
    call escrita

    mov ecx, novaLinha              ; arg1: endereço
    mov edx, 1                      ; arg2: número de bytes
    call escrita

    jmp saida                       ; goto label

escrita:
    mov eax, SYS_WRITE              ; escrita
    mov ebx, STDOUT                 ; arg0: fd: tela
    int SYSCALL_RQ                  ; chama kernel para executar escrita
    ret

saida:
    mov eax, SYS_EXIT               ; saída
    mov ebx, STATUS                 ; arg0: status/error code
    int SYSCALL_RQ                  ; chama kernel para executar saída