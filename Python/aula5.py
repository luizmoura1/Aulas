# regras de nomeação de variáveis:
# primeiro caractere: a-z, A-Z, _
# demais caracteres: a-z, A-Z, _, 0-9
# case sensitive; ex.: nome é diferente de NOME
SAUDACAO = "Oi"
nome = "mundo"

# print - forma básica
#print(SAUDACAO, nome)                        # Oi mundo
#print(SAUDACAO , ", " , nome , "!!!")          # Oi ,  mundo !!!

#print(SAUDACAO, nome, sep=", ", end="!!!\n")

# Estilo C: print("%s" % (var1, var2, ..., varN))
#print("%s%s" % (SAUDACAO, nome))
#print("%s, %s!!!" % (SAUDACAO, nome))

# format method - placeholder posicional: "{}".format(var1, ..., varN)
#print("{}{}".format(SAUDACAO, nome))
#print("{}, {}!!!".format(SAUDACAO, nome))
#print("{}, {}!!!".format(nome, SAUDACAO))

# format method - placeholder nomeado: "{}".format(x=var1, ..., y=varN)
#print("{s}{n}".format(s=SAUDACAO, n=nome))
#print("{s}, {n}!!!".format(s=SAUDACAO, n=nome))
#print("{s}, {n}!!!".format(n=nome, s=SAUDACAO))

# f-strings ou formatted string literals - f"{}"
print(f"{SAUDACAO}{nome}")
print(f"{SAUDACAO}, {nome}!!!")





