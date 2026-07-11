#!/usr/bin/env bash
# Programa: Manipulacao de números - aula 7 (Bash)
# Ambiente: Windows (Host) / WSL: Debian / vscode 

K1=$((RANDOM % 9 + 1))
readonly K1             
n1=
DATA=(1 3 5 9 0)
i=0     # índice, subscrito, contador, offset, 'data/read pointer'

GREEN="\e[1;32m"
RESET="\e[0m"
YELLOW="\e[1;3;34;43m"
INVERT="\e[1;7m"

echo -e "${GREEN}====== LITERAL, CONSTANTE, VARIÁVEL =====${RESET}"
echo -e "\nLITERAL NUMÉRICO MÁGICO:\t${INVERT}1089${RESET}"

echo -e "\nVALOR DA VARIÁVEL ANTES DA INICIALIZAÇÃO"   
echo "n1 = ${n1}"

echo -e "\n${YELLOW}====== ATRIBUIÇÕES EM DESIGN-TIME =======${RESET}"
echo -e "INICIALIZAÇÃO DIRETA"
n1=$((n1+3))                            # 3 # n1=n1+3 se declare -i n1= 
echo "n1 = ${n1}"

echo -e "\nNOVA ATRIBUIÇÃO POR READ/DATA"
n1=${DATA[i++]}; n1=${DATA[i++]}; n1=${DATA[i++]}   # 5 # i=0 n1=1 # i=1 n1=3 # i=2 n1=5
echo "n1 = ${n1}"

echo -e "\n${YELLOW}====== ATRIBUIÇÃO EM INVOCATION TIME ====${RESET}"
echo -e "ENTRADA POR ARGUMENTO"
n1=$1
echo "n1 = ${n1}"

echo -e "\n${YELLOW}====== ATRIBUIÇÃO EM RUNTIME ============${RESET}"
echo -e "ENTRADA POR INTERAÇÃO"
read -p "Informe um valor (0-9): " x _
n1=$x
echo "n1 = ${n1}"

echo -e "\n${GREEN}====== OPERAÇÕES ARITMÉTICAS ============${RESET}"
echo "n1 + K1 = $((n1 + K1))"
echo "n1 - K1 = $((n1 - K1))"
echo "n1 * K1 = $((n1 * K1))"
echo "n1 / K1 = $((n1 / K1))"
echo "n1 % K1 = $((n1 % K1))"
echo "n1 ** K1 = $((n1 ** K1))"

echo -e "\n${GREEN}====== D E S A F I O ====================${RESET}"
read -p "Adivinhe o valor da constante K1 (1-9): " x _
echo "Seu palpite: ${x}"
(( x == K1)) && echo "Acertou!" || echo "Quase!"; echo "Era ${K1}."
