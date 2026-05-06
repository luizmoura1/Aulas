# PYTHON -  7 formas de se escrever: Oi, mundo! 
SAUDACAO = "Oi"
nome = "mundo"

# 1) Concatenação com + (somente strings; aqui usada sem atribuição; justaposição): expr1 + "sep" + ... + exprN + "end"
print(SAUDACAO + ", " + nome + "!")

# 2) Uso dos argumentos nomeados sep e end: expr1, ..., exprN, sep="sep", end="end"
print(SAUDACAO, nome, sep=", ", end="!\n")

# 3) Estilo C (legado): "%s ... %s" % (expr1, ..., exprN)
print("%s, %s!" % (SAUDACAO, nome))

# 4) format com placeholder posicional: "{} ... {}".format(expr1, ..., exprN)
print("{}, {}!".format(SAUDACAO, nome))

# 5) format com placeholder nomeado: "{a} ... {z}".format(a=expr1, ..., z=exprN)
print("{x}, {y}!".format(y=nome, x=SAUDACAO))

# 6) f-strings (avaliam expressões inline): f"{expr1} ... {exprN}"
print(f"{SAUDACAO}, {nome}!")

# 7) Template strings (substituição externa; sem avaliação de expressões no modelo)
from string import Template
t = Template("$a, $z!")
print(t.substitute(a=SAUDACAO, z=nome))