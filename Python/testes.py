#!/usr/bin/env python3

K = 5

print("========== D E S A F I O ===========================")
x = input("Adivinhe o valor da constante K (1-9): ")
print(f"Seu palpite: {x}")


#####################################################################
print("\nPython: expressão aritmética")

# Bash: (( x == K ))
#
# Em Python, a comparação já é uma expressão que produz True/False.
# Para testar entradas como 05 e 1+4, precisamos primeiro interpretar
# x como expressão/valor aritmético.

def aritmetico(s):
    s = s.strip()

    if s == "":
        return 0

    # Simula o tratamento octal de inteiros com zero à esquerda.
    if s.isdigit() and len(s) > 1 and s.startswith("0"):
        return int(s, 8)

    # Caso numérico simples.
    if s.isdigit():
        return int(s)

    # Expressão aritmética simples, restrita a números e operadores.
    permitido = set("0123456789+-*/%() ")
    if all(c in permitido for c in s):
        try:
            return eval(s, {"__builtins__": {}}, {})
        except Exception:
            raise ValueError("erro aritmético")

    # Em Bash, um identificador pode ser interpretado como nome de variável.
    if s == "K":
        return K

    raise ValueError("erro aritmético")


try:
    resultado = aritmetico(x) == K
    print("Acertou!" if resultado else "Quase!", end="")
    print(f" Era {K}.")
except ValueError:
    print("erro")


#####################################################################
print("\nPython: expr, =")

# Adaptação do comportamento de GNU expr:
# se ambos os operandos forem inteiros decimais, comparação numérica;
# caso contrário, comparação textual.

def expr_eq(a, b):
    try:
        ia = int(a)
        ib = int(b)

        # expr trabalha com inteiros decimais; 05 = 5
        if a.lstrip("-").isdigit() and b.lstrip("-").isdigit():
            return ia == ib
    except ValueError:
        pass

    return a == b


resultado = expr_eq(x, str(K))
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")

print("\nPython: expr, ==")

# No GNU expr, == é extensão/sinônimo de =
resultado = expr_eq(x, str(K))
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")


#####################################################################
print("\nPython: texto, ==")

# Equivalente conceitual de:
# test "$x" = "$K"
#
# Aqui a comparação é textual.

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")

print("\nPython: texto, ==")

# Equivalente conceitual de:
# test "$x" == "$K"

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")


#####################################################################
print("\nPython: numérico estrito")

# Adaptação de:
# test "$x" -eq "$K"
#
# Python não possui um operador separado equivalente a -eq.
# Primeiro convertemos os operandos para inteiros.

try:
    resultado = int(x) == K
    print("Acertou!" if resultado else "Quase!", end="")
    print(f" Era {K}.")
except ValueError:
    print("erro")


#####################################################################
print("\nPython: texto, ==")

# Equivalente conceitual de:
# [ "$x" = "$K" ]

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")

print("\nPython: texto, ==")

# Equivalente conceitual de:
# [ "$x" == "$K" ]

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")


#####################################################################
print("\nPython: numérico estrito")

# Adaptação de:
# [ "$x" -eq "$K" ]

try:
    resultado = int(x) == K
    print("Acertou!" if resultado else "Quase!", end="")
    print(f" Era {K}.")
except ValueError:
    print("erro")


#####################################################################
print("\nPython: texto")

# Equivalente conceitual de:
# [[ $x = $K ]]

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")

print("\nPython: texto")

# Equivalente conceitual de:
# [[ $x == $K ]]

resultado = x == str(K)
print("Acertou!" if resultado else "Quase!", end="")
print(f" Era {K}.")


#####################################################################
print("\nPython: aritmético")

# Equivalente conceitual de:
# [[ $x -eq $K ]]

try:
    resultado = aritmetico(x) == K
    print("Acertou!" if resultado else "Quase!", end="")
    print(f" Era {K}.")
except ValueError:
    print("erro")


#####################################################################
print("\nPython: match/case")

# Equivalente conceitual de:
# case $x in
#     $K) ...
#     *)  ...
# esac

match x:
    case "5":
        print(f"Acertou! Era {K}.")
    case _:
        print(f"Quase! Era {K}.")