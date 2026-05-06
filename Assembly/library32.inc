; library32.inc - biblioteca de constantes (Linux x86 32-bit)

; Caracteres de controle (ASCII)
LF  equ 10  ; line feed '\n'    0x0a    0ah

; Vetor de interrupção
SYSCALL_RQ  equ 128 ; uso: int  SYSCALL_RQ  ; hexadecimal é mais comum: 0x80 ou 80h

; Códigos de retorno ao SO (exit status):
STATUS  equ 0   ; operação concluída com sucesso

; Descritores padrão (fd, file descriptors):
STDIN   equ 0   ; teclado
STDOUT  equ 1   ; tela

; System calls (eax: número da syscall; após 'int  SYSCALL_RQ', eax: valor de retorno da syscall):
SYS_EXIT    equ 1   ; void exit(int status) ; ebx: arg0 = STATUS
SYS_READ    equ 3   ; ssize_t read(int fd, void *buf, size_t count) ; ebx: arg0 = fd  ; ecx: arg1 = buf ; edx: arg2 = count
SYS_WRITE   equ 4   ; ssize_t write(int fd, void const *buf, size_t count) ; ebx: arg0 = fd  ; ecx: arg1 = buf ; edx: arg2 = count



