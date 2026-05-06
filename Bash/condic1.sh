#!/usr/bin/env bash
GREEN="\e[32;1m"
YELLOW="\e[33;3m"
RESET="\e[0m"
N1=5

echo -e "${GREEN}USO DE PSEUDO IF-THEN-ELSE${RESET}"
echo
read -p "Digite um valor (1-9): " x
echo
echo -e "${YELLOW}Com operadores lógicos, onde ((condição)) é comando1: ((condição)) && comando2 || comando3${RESET}"
(( x == N1 )) && echo "Parabéns, você acertou! Era $N1." || echo "Você tentou $x, mas era $N1."

echo
echo -e "${YELLOW}Com operador ternário em contexto numérico: \$((condição ? y : z))${RESET}"
echo "Retorno numérico: $(( x == N1 ? 1 : 0 ))" # Os valores poderiam ser quaisquer números, idealmente diferentes; não necessariamente 1 e 0

echo
echo -e "${YELLOW}Comparação conceitual:${RESET}"
echo -e "\t\t exit status\t resultado numérico"
(( x == N1 ))   # avalia novamente para capturar $? (exit status)
echo -e "\t\t \$? = $? \t \$((...)) = $(( x == N1 ))"
echo
echo -e "Sucesso => \t \$? = 0 \t \$((...)) = 1 \t <= Verdadeiro, acerto"
echo -e "Falha   => \t \$? = 1 \t \$((...)) = 0 \t <= Falso, erro"


