#!/usr/bin/env bash
nome=$1
nasm -f elf32 "$nome.asm"
ld -m elf_i386 "$nome.o" -o "_$nome"
rm "$nome.o"
./"_$nome"