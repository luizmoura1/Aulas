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
saudar(){
    #echo "nome: '${nome}'"
    #echo "${SAUDACAO}${nome}!"
    local s="${SAUDACAO}${1}!"
    echo "nome: '${1}'"
    echo "${s}"
}
saudar "${nome}"

echo -e "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}"
echo -e "3 - INICIALIZAÇÃO:"
nome="Ana"
saudar "${nome}"

echo -e "\n4 - NOVA ATRIBUIÇÃO:"
nome="Bela"
saudar "${nome}"

echo -e "\n${YELLOW}ATRIBUICAO EM INVOCATION TIME${RESET}"
echo -e "5 - ENTRADA POR ARGUMENTO EM LINHA DE COMANDO:"
nome=$1
saudar "${nome}"

echo -e "\n${YELLOW}ATRIBUICAO EM RUNTIME${RESET}"
echo -e "6 - ENTRADA POR INTERACAO:"
read -p "Informe um nome: " x   # definição implícita, dinâmica
nome=$x
saudar "${nome}"

echo -e "\n${GREEN}RESUMO${RESET}"
echo -e "Constante SAUDACAO:\t'${SAUDACAO}'"
echo -e "Variavel nome:\t\t'${nome}'"
