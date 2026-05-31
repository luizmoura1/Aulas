# Programa: Manipulacao de números - aula 6 (Bash)
# Ambiente: Windows (Host) / WSL: Debian / vscode 
# declare -r CONSTANTE |   typeset -r  CONSTANTE   |   readonly CONSTANTE
# declare variavel     |   typeset variavel        |   variavel=           |   variavel=""

readonly K1=1             
n1=                     # definição implícita, default, shell time, parse time                                                  

GREEN="\e[32m"
RESET="\e[0m"
YELLOW="\e[34;43;1;3m"
INVERT="\e[7m"

echo -e "${GREEN}LITERAL, CONSTANTE e VARIAVEL${RESET}"
echo -e "\n1 - LITERAL NUMÉRICO MÁGICO:"
echo -e "${INVERT}1089${RESET}"

echo -e "\n2 - VALOR DA VARIAVEL ANTES DA INICIALIZAÇÃO:"   
mostrar(){
    echo "n1: ${n1}"
}
mostrar "${n1}"

echo -e "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}"
echo -e "3 - INICIALIZAÇÃO:"        # explícita
n1=3
mostrar "${n1}"

echo -e "\n4 - NOVA ATRIBUIÇÃO:"
n1=5
mostrar "${n1}"

echo -e "\n${YELLOW}ATRIBUICAO EM INVOCATION TIME${RESET}"
echo -e "5 - ENTRADA POR ARGUMENTO EM LINHA DE COMANDO:"
n1=$1
mostrar "${n1}"

echo -e "\n${YELLOW}ATRIBUICAO EM RUNTIME${RESET}"
echo -e "6 - ENTRADA POR INTERACAO:"
read -p "Informe um n1: " x   # definição implícita, dinâmica, default, shell time, parse time
n1=$x
mostrar "${n1}"


