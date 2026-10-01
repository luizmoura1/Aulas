#!/usr/bin/env python3
# Programa: Estrutura de controle condicional - Aula 12  (Python)
# Ambiente: Fedora Linux / vscode
import random

K = random.randint(1,9)

print(f"D E S A F I O")      
x = input("Adivinhe o valor da constante K (1-9): ")
palpite = int(x) if x.isdigit() else 0

# forma 1 - bloco if/else clássico de 2 vias
if palpite == K:    # then
    print(f"Acertou! Era {K}.")
else:
    print(f"Quase! Era {K}.")

# forma 2 - criando a variável mensagem para guardar a string
if palpite == K:    # then
    mensagem = f"Acertou! Era {K}."
else:
    mensagem = f"Quase! Era {K}."
print(mensagem)

#forma 3 - bloco if/else de 1 via; atribuição imperativa com valor padrão 
mensagem = f"Quase! Era {K}."
if palpite == K:    # then
    mensagem = f"Acertou! Era {K}." # nova atribuição; sobrescrita
print(mensagem)

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
