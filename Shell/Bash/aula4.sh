# Programa: Manipulacao de texto - aula 4 (Bash)
# Ambiente: Windows (Host) / WSL: Debian / vscode 

readonly SAUDACAO="Oi, "             # declare -r CONSTANTE |   typeset -r  CONSTANTE   |   readonly CONSTANTE
nome=                                # declare variavel     |   typeset variavel        |   variavel=           |   variavel=""                  

GREEN="\e[32m"
RESET="\e[0m"
YELLOW="\e[33;3m"
INVERT="\e[7m"

echo -e "${GREEN}LITERAL, CONSTANTE e VARIAVEL${RESET}"
echo -e "\n1 - LITERAL CLASSICO HELLOWORLD:"
echo -e "${INVERT}Oi, mundo!${RESET}"

echo -e "\n2 - VALOR PADRAO DA VARIAVEL ANTES DA INICIALIZAÇÃO:"
echo "nome: '${nome}'"
echo "${SAUDACAO}${nome}"

echo -e "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}"
echo -e "3 - INICIALIZAÇÃO:"
nome="Ana"
echo "${SAUDACAO}${nome}"

echo -e "\n4 - NOVA ATRIBUIÇÃO:"
nome="Bela"
echo "${SAUDACAO}${nome}"
