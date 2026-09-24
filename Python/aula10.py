#!/usr/bin/env python3
# Programa: Expressões condicionais - Aula 10  (Python)
# Ambiente: Lubuntu e/ou Windows WSL:Debian / vscode
import random

K = random.randint(1,9)

print(f"D E S A F I O")      
x = input("Adivinhe o valor da constante K (1-9): ")
palpite = int(x) if x.isdigit() else 0

# forma 1 - frequentemente chamada de 'ternário'
print(("Acertou!" if palpite == K else "Quase!") + f" Era {K}.")

# forma 2 - f-string com expressão condicional embutida
print(f"{'Acertou!' if palpite == K else 'Quase!'} Era {K}.")

# forma 3 - criando uma variável e atribuindo a ela, com walrus operator, o resultado do teste
print(f"{'Acertou!' if (certo := palpite == K) else 'Quase!'} Era {K}.")

# forma 4 - criando uma variável sem evitar repetição de ' Era {K}.'
mensagem = f"Acertou! Era {K}." if palpite == K else f"Quase! Era {K}." 
print(mensagem)

# forma 5 - criando uma variável evitando repetição de ' Era {K}.'
mensagem = "Acertou!" if palpite == K else "Quase!" 
print(f"{mensagem} Era {K}.")
