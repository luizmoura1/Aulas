import sys, random
INVERT = "\x1b[1;7m"
RESET = "\x1b[0m"
GREEN = "\x1b[1;32m"
YELLOW = "\x1b[1;34;43m"

K = random.randint(1,9)
n1 = None
DATA = [1, 3, 5, 7, 9]
READ = iter(DATA)

print(f"{GREEN}LITERAL, CONSTANTE e VARIAVEL{RESET}")

print(f"\nLiteral numerico magico:\t{INVERT}1089{RESET}")

print("\nValor da variavel antes da inicializacao: ")
print(f"n1 = {n1}")

print(f"\n{YELLOW}Atribuicoes em design-time{RESET}")
n1 = 3
print("Inicializacao direta: ")
print(f"n1 = {n1}")

n1 = next(READ);    n1 = next(READ);    n1 = next(READ)
print("\nNova atribuicao simulando read/data: ")
print(f"n1 = {n1}")

print(f"\n{YELLOW}Atribuicao em invocation-time{RESET}")    # python argv[0] argv[1]
n1 = int(sys.argv[1]) if len(sys.argv) > 1 and sys.argv[1].isdigit() else 0
print("Entrada por linha de comando: ")
print(f"n1 = {n1}")

print(f"\n{YELLOW}Atribuicao em runtime{RESET}")      
print("Entrada por interacao: ")
x = input("Digite um numero (0-9): ")
n1 = int(x) if x.isdigit() else 0                   
print(f"n1 = {n1}")

print(f"\n{GREEN}OPERACOES ARITMETICAS{RESET}")      
print(f"n1 + K = {n1 + K}")
print(f"n1 - K = {n1 - K}")
print(f"n1 * K = {n1 * K}")
print(f"n1 / K = {n1 / K}")
print(f"n1 // K = {n1 // K}")
print(f"n1 % K = {n1 % K}")
print(f"n1 ** K = {n1 ** K}")

print(f"\n{GREEN}D E S A F I O{RESET}")      
x = input("Adivinhe o valor da constante K (1-9): ")
palpite = int(x) if x.isdigit() else 0                   
print(f"Acertou! " if palpite == K else "Quase! ", end=""); print(f"Era {K}.");


