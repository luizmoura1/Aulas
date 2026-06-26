#!/usr/bin/env bash
# Programa: Manipulacao de números - aula 7 (Bash)
# Ambiente: Windows (Host) / WSL: Debian / vscode 
# declare -r [ -i ] |   typeset -r  [ -i ]   |   readonly           CONSTANTE [= valor]
# declare [ -i ]    |   typeset [ -i ]       |   variavel=          |   variavel [= "" ou outro valor ]

K1=$((RANDOM % 9 + 1))
readonly K1             
n1=                     # definição implícita, default, shell time, parse time                                                  

GREEN="\e[1;32m"
RESET="\e[0m"
YELLOW="\e[34;43;1;3m"
INVERT="\e[1;7m"

echo -e "${GREEN}LITERAL, CONSTANTE, VARIAVEL${RESET}"
echo -e "\nLITERAL NUMÉRICO MÁGICO: ${INVERT}1089${RESET}"

echo -e "\nVALOR DA VARIAVEL ANTES DA INICIALIZAÇÃO:"   
echo "n1 = ${n1}"

echo -e "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}"
echo -e "INICIALIZAÇÃO:"        # explícita
n1=3
echo "n1 =  ${n1}"

echo -e "\nNOVA ATRIBUIÇÃO:"
n1=5
echo "n1 =  ${n1}"

echo -e "\n${YELLOW}ATRIBUICAO EM INVOCATION TIME${RESET}"
echo -e "ENTRADA POR ARGUMENTO:"
n1=$1
echo "n1 =  ${n1}"

echo -e "\n${YELLOW}ATRIBUICAO EM RUNTIME${RESET}"
echo -e "ENTRADA POR INTERACAO:"
read -p "Informe um valor (0-9): " x   # definição implícita, dinâmica, default, shell time, parse time
n1=$x
echo "n1 =  ${n1}"

echo -e "\n${GREEN}OPERAÇÕES ARITMÉTICAS${RESET}"
echo -e "\nn1 + K1 = " $((n1 + K1))
echo "n1 - K1 = " $((n1 - K1))
echo "n1 * K1 = " $((n1 * K1))
echo "n1 / K1 = " $((n1 / K1))
echo "n1 % K1 = " $((n1 % K1))
echo "n1 ** K1 = " $((n1 ** K1))

echo -e "\n${GREEN}D E S A F I O${RESET}"
read -p "Adivinhe o valor da constante K1 (1-9): " x
echo "Seu palpite: ${x}"
(( x == K1)) && echo "Acertou!" || echo "Quase!"; echo "Era ${K1}."
