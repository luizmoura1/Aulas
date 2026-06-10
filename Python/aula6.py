import sys
K = "Oi, "
n1 = None

print("LITERAL, CONSTANTE e VARIAVEL")

print("Literal classico helloworld: 'Oi, mundo!'")

print("Valor da variavel antes da inicializacao: ")
print(f"n1 = {n1}")      # print("n1 = ", n1)   f"{}"
print(f"{K}{n1}")        # print(K, n1)

print("Atribuicoes em design-time")
n1 = "Ana"
print("Inicializacao (1a. atribuicao): ")
print(f"n1 = {n1}")      
print(f"{K}{n1}")        

n1 = "Bela"
print("Nova atribuicao: ")
print(f"n1 = {n1}")      
print(f"{K}{n1}")        

print("Atribuicao em invocation-time")          # python argv[0] argv[1]
n1 = sys.argv[1] if len(sys.argv) > 1 else ""   # length : comprimento
print("Entrada por linha de comando: ")
print(f"n1 = {n1}")      
print(f"{K}{n1}")        

print("Atribuicao em runtime")      
print("Entrada por interacao: ")
n1 = input("Digite um nome: ")                   
print(f"n1 = {n1}")      
print(f"{K}{n1}")        
