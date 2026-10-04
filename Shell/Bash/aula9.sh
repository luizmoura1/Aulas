#!/usr/bin/env bash
# Programa: Estruturas de controle condicional - aula 9 (Bash)
# Ambiente: server: Raspberry Pi 1  client: Lubuntu / VS Code 

K=$((RANDOM % 9 + 1))
readonly K             

echo -e "\n====== D E S A F I O ===================="
read -p "Adivinhe o valor da constante K (1-9): " x
echo "Seu palpite: ${x}"

#Forma 1: if inline
if (( x == K)); then echo "Acertou! Era ${K}."; else echo "Quase! Era ${K}."; fi

#Forma 2: if inline + variável 'mensagem' para armazenar a string
if (( x == K)); then mensagem="Acertou!"; else mensagem="Quase!"; fi
echo "${mensagem} Era ${K}."

#Forma 3: bloco if-else
if (( x == K)) 
then 
    echo "Acertou! Era ${K}." 
else
    echo "Quase! Era ${K}." 
fi

#Forma 4: if inline + variável 'mensagem' para armazenar a string
if (( x == K))
then 
    mensagem="Acertou!"
else 
    mensagem="Quase!"
fi
echo "${mensagem} Era ${K}."
