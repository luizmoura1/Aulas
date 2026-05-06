REM SmallBASIC
rem created: 01/11/2025
# Objetivo: manipulacao de numero
' Ambiente: Windows 11 / sbasicg

' numero inteiro  = int((superior - inferior + 1)*rnd()+1)
randomize timer
n = int(9*rnd()+1)

# DADOS
const K = n

# COMANDOS
? """\e[32m========== V A R I A V E I S ==========\e[0m
1 - Literal Numerico:"""
? "\e[7m41\e[0m

? "\n2 - Valor std antes de inicializacao:
? "Numero n1 = " ; n1

n1 = 3
? "\n3 - Inicializacao (1a atribuicao):
? "Numero n1 = " ; n1

n1 = 5
? "\n4 - Nova atribuicao:
? "Numero n1 = " ; n1

? "\n5 - Atribuicao interativa:
input "Informe um numero (1 - 9): " , n1
? "Numero n1 = " ; n1

? "\n\e[32mOPERACOES ARITMETICAS:\e[0m
? "n1 + K = " ; n1 + K
? "n1 - K = " ; n1 - K
? "n1 * K = " ; n1 * K
? "n1 / K = " ; n1 / K
? "n1 \ K = " ; n1 \ K
? "n1 % K = " ; n1 % K
? "n1 mod K = " ; n1 mod K
? "n1 ^ K = " ; n1 ^ K

? "\n\e[32mD E S A F I O\e[0m
input "Adivinhe o valor da constante (1-9): ", n1
palpite = iff(n1 == K,"Acertou!","Errou!" )
? palpite ; "\nEra "; K
