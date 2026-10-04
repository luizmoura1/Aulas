#!/usr/bin/env python3
# Programa: Estrutura de controle condicional - Aula 13  (Python)
# Ambiente: server: Haiku client: Lubuntu / VS Code
import random

K = random.randint(1,9)

print(f"D E S A F I O")      
x = input("Adivinhe o valor da constante K (1-9): ")
palpite = int(x) if x.isdigit() else 0
print(f"\nSeu palpite: {x}\n")

# forma 1 - bloco match-case de 2 vias   switch-case, case -> SELECT CASE de alguns dialetos do BASIC
match palpite == K:
    case True:
        print(f"Acertou! Era {K}.")
    case False:
        print(f"Quase! Era {K}.")

# forma 2 - sem repetir " Era {K}."
match palpite == K:
    case True:
        print("Acertou!", end="")
    case False:
        print("Quase!", end="")
print(f" Era {K}.")

#forma 3 - criar uma variável 'mensagem' para armazenar a string 
match palpite == K:
    case True:
        mensagem = "Acertou!"
    case False:
        mensagem = "Quase!"
print(mensagem + f" Era {K}.")

"""
# forma 4 - bloco if/elif/else de múltplas (3) vias
if palpite == K:    # then
    print(f"Acertou! Era {K}.")
elif palpite > K:
    print(f"Passou! Era {K}.")
else:
    print(f"Faltou! Era {K}.")

# forma 5 - bloco if/elif/else de múltplas (3) vias - evitar repetição
if palpite == K:    # then
    print("Acertou!", end="")
elif palpite > K:
    print("Passou!", end="")
else:
    print(f"Faltou!", end="")
print(f" Era {K}.")

# forma 6 - bloco if/elif/else de múltplas (3) vias - criando variável mensagem
if palpite == K:    # then
    mensagem = "Acertou!"
elif palpite > K:
    mensagem = "Passou!"
else:
    mensagem = "Faltou!"
print(f"{mensagem} Era {K}.")  #print(mensagem + f" Era {K}.") #print(f"mensagem Era {K}.")

# forma 7 - bloco if/elif/else com variável para guardar True/False com operador walrus (:=)
if (certo := palpite == K):    # then
    mensagem = "Acertou!"
elif palpite > K:
    mensagem = "Passou!"
else:
    mensagem = "Faltou!"
print(f"{certo}: {mensagem} Era {K}.")
"""
