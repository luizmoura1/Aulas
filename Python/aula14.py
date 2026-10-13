#!/usr/bin/env python3
# Programa: Estrutura de controle condicional match/case- Aula 14 (Python)
# Ambiente: Fedora / VS Code
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

#forma 4 - subject: expressão não relacional; pattern: wildcard com guarda; bloco de 1 via
mensagem = "Quase!"
match palpite:
    case _ if palpite == K:
        mensagem = "Acertou!"
print(mensagem + f" Era {K}.")

#forma 5 - subject: expressão não relacional; pattern: wildcard com e sem guarda; bloco de 2 vias
match palpite:
    case _ if palpite == K:
        mensagem = "Acertou!"
    case _:
        mensagem = "Quase!"
print(mensagem + f" Era {K}.")

#forma 6 - subject: expressão não relacional; pattern: wildcard com e sem guarda; bloco de 3 vias
match palpite:
    case _ if palpite == K:
        mensagem = "Acertou!"
    case _ if palpite > K:
        mensagem = "Passou!"
    case _:
        mensagem = "Faltou!"
print(mensagem + f" Era {K}.")

'''
match subject:
    case pattern1:
        comando1
    case pattern2:
        comando2
    ...
    case _:
        comando default    

Na estrutura match subject / case pattern o comportamento depende do pattern:
Name Capture Pattern: associa o valor do subject a um nome, substituindo eventual valor anterior
Wildcard Pattern (_): aceita qualquer valor, sem capturá-lo
Literal Pattern: compara o valor de subject com um literal

Wildcard sem 'guarda': opcional; se presente, deve ser único e o último caso
'''