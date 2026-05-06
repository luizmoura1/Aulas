# Programa: Manipulacao de texto - aula 3 (Bash)
# Ambiente: Windows / vscode / Git Bash

readonly SAUDACAO="Oi, "             # declare -r CONSTANTE |   typeset -r  CONSTANTE   |   readonly CONSTANTE
nome=                                # declare variavel     |   typeset variavel        |   variavel=                  

echo -e "\e[32mLITERAIS, CONSTANTE SAUDACAO e VARIAVEL nome\e[0m"
echo -e "\n1 - LITERAL CLASSICO HELLOWORLD:"
echo "Oi, mundo!"

# ASCII
# BS, backspace         8   x08         b
# HT, tab               9   x09         t
# LF, enter, return     10  x0A, x0a    n
# CR, home              13  x0D, x0d    r
# ESC                   27  x1B, x1b    e

# ANSI
# ESC [ val1;val2;...;valN m
#  atributos
# estilo: 1 negrito, 3 itálico, 4 sublinhado, 7 reverso, 9 riscado
# cor: 0 preto, 1 vermelho, 2 verde, 3 amarelo, 4 azul,5 magenta, 6 ciano,7 branco
# primeiro dígito: 3 = cor da letra; 4 = cor do fundo