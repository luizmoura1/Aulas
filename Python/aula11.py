#!/usr/bin/env python3
# Programa: Estrutura de controle condicional - Aula 11  (Python)
# Ambiente: GhostBSD / vscode
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



# forma 2 - f-string com expressão condicional embutida
#print(f"{'Acertou!' if palpite == K else 'Quase!'} Era {K}.")

# forma 3 - criando uma variável e atribuindo a ela, com walrus operator, o resultado do teste
#print(f"{'Acertou!' if (certo := palpite == K) else 'Quase!'} Era {K}.")

# forma 4 - criando uma variável sem evitar repetição de ' Era {K}.'
#mensagem = f"Acertou! Era {K}." if palpite == K else f"Quase! Era {K}." 
#print(mensagem)

# forma 5 - criando uma variável evitando repetição de ' Era {K}.'
#mensagem = "Acertou!" if palpite == K else "Quase!" 
#print(f"{mensagem} Era {K}.")
