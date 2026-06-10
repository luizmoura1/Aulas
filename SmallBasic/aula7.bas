REM SmallBASIC - Aula 7
rem created: 31/05/2026
# Objetivo: manipulacao de numero
' Ambiente: Windows 11 / vscode

randomize timer
n = int(9*rnd()+1)  ' numero inteiro  = int((superior - inferior + 1)*rnd()+1)

# DADOS
const K = n
RESET = "\e[0m"
INVERT = "\e[7m"
GREEN = "\e[32m"
YELLOW = "\e[34;43;1;3m"

# COMANDOS
? GREEN; """========== LITERAL, CONSTANTE e VARIAVEL ====
Literal Numerico Magico: """; RESET; INVERT; 1089; RESET

? "\n1 - Valor da variavel antes de inicializacao:
? "n1 = " ; n1              ' atribuição implícita

n1 = 3
? YELLOW; "\n========== Atribuicoes em design-time ======="; RESET
? "\n2 - Inicializacao (1a atribuicao):
? "n1 = " ; n1

n1 = 5
? "\n3 - Nova atribuicao:
? "n1 = " ; n1

n1 = command()
? YELLOW; "\n========== Atribuicao em invocation-time ===="; RESET
? "\n4 - Entrada por linha de comando:
? "n1 = " ; n1

? YELLOW; "\n========== Atribuicao em runtime ============"; RESET
? "\n5 - Entrada por interacao:
input "Informe um numero (1 - 9): " , x     ' atribuição implícita, dinâmica
n1 = x
? "n1 = " ; n1

? GREEN; "\nOPERACOES ARITMETICAS"; RESET
? "\nn1 + K = " ; n1 + K
? "n1 - K = " ; n1 - K
? "n1 * K = " ; n1 * K
? "n1 / K = " ; n1 / K
? "n1 \ K = " ; n1 \ K
? "n1 % K = " ; n1 % K
? "n1 mod K = " ; n1 mod K
? "n1 ^ K = " ; n1 ^ K

? GREEN; "\nD E S A F I O"; RESET
input "Adivinhe o valor da constante (1-9): ", x
? "Seu palpite: " ; x
palpite = iff(x == K,"Acertou!","Quase!" )
? palpite ; " Era "; K
