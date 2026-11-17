#!/usr/bin/env python3
# Programa: Estrutura de controle condicional if e match de 1 via- Aula 15 (Python)
# Ambiente: Lubuntu / VS Code
import random
K = random.randint(1,9)

print(f"IF e MATCH com via única")      
x = input("Adivinhe o valor da constante K (1-9): ")
palpite = int(x) if x.isdigit() else 0
print(f"Seu palpite: {x}")

print("\n1) if simples:")
mensagem = "Quase!"
if palpite == K:
    mensagem = "Acertou!"
print(mensagem + f" Era {K}.")

print("\n2) match simples:")
mensagem = "Quase!"
match palpite == K:
    case True:
        mensagem = "Acertou!"
print(mensagem + f" Era {K}.")


print("\n3) if com walrus:")
mensagem = "Quase!"
if certo := palpite == K:               # parênteses opcionais
    mensagem = "Acertou!"
print(mensagem + f" Era {K}. {certo}")

print("\n4) match com walrus:")
mensagem = "Quase!"
match certo := palpite == K:            # parênteses opcionais
    case True:
        mensagem = "Acertou!"
print(mensagem + f" Era {K}. {certo}")


print("\n5) if com walrus isolado:")
(certo := palpite == K)
mensagem = "Quase!"
if certo:
    mensagem = "Acertou!"
print(mensagem + f" Era {K}. {certo}")

print("\n6) match com walrus isolado:")
(certo := palpite == K)
mensagem = "Quase!"
match certo:
    case True:
        mensagem = "Acertou!"
print(mensagem + f" Era {K}. {certo}")


print("\n7) match com subject simples e pattern wildcard com guarda:")
mensagem = "Quase!"
match palpite:
    case _ if palpite == K: 
        mensagem = "Acertou!"
print(mensagem + f" Era {K}.")

print("\n8) match com subject simples, pattern wildcard com guarda e walrus:")
mensagem = "Quase!"
match palpite:
    case _ if certo := palpite == K:    # parênteses opcionais
        mensagem = "Acertou!"
print(mensagem + f" Era {K}. {certo}")



