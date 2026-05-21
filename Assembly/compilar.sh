#!/usr/bin/env bash
[ -z "$1" ] && exit 1
nasm -f elf32 "$1.asm"
ld -m elf_i386 "$1.o" -o "_aula"
rm "$1.o"
./"_aula" "${@:2}"