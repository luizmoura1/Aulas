import sys
INVERT = "\x1b[1;7m"
RESET = "\x1b[0m"
GREEN = "\x1b[1;32m"
YELLOW = "\x1b[1;34;43m"

K = "Oi, "
n1 = None

def saudar():
    print(f"n1 = {n1}")      
    print(f"{K}{n1}")        

print(f"{GREEN}LITERAL, CONSTANTE e VARIAVEL{RESET}")

print(f"\nLiteral classico helloworld: '{INVERT}Oi, mundo!{RESET}'")

print("\nValor da variavel antes da inicializacao: ")
saudar()

print(f"\n{YELLOW}Atribuicoes em design-time{RESET}")
n1 = "Ana"
print("Inicializacao (1a. atribuicao): ")
saudar()

n1 = "Bela"
print("\nNova atribuicao: ")
saudar()

print(f"\n{YELLOW}Atribuicao em invocation-time{RESET}")          # python argv[0] argv[1]
n1 = sys.argv[1] if len(sys.argv) > 1 else ""   # length : comprimento
print("Entrada por linha de comando: ")
saudar()

print(f"\n{YELLOW}Atribuicao em runtime{RESET}")      
print("Entrada por interacao: ")
n1 = input("Digite um nome: ")                   
saudar()
