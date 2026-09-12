# comentário em linha inteira
readonly SAUDACAO="Oi, "  # comentário em fim de linha          
nome=                     

GREEN="\e[32m"
RESET="\e[0m"
YELLOW="\e[32;43;1;3m"
INVERT="\e[7m"

echo -e "${GREEN}LITERAL, CONSTANTE, VARIAVEL${RESET}"
echo -e "\nLiteral clássico helloworld:\t${INVERT}Oi, mundo!${RESET}"

echo -e "\nValor da variável antes da inicialização:"   
mostrar(){
    local s="${SAUDACAO}${1}"
    echo "nome: '${1}'"
    echo "${s}"
}
mostrar "${nome}"

echo -e "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}"
echo -e "Inicialização:"
nome="Ana"
mostrar "${nome}"

echo -e "\nNova atribuição:"
nome="Bela"
mostrar "${nome}"
