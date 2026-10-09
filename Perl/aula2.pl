$SAUDACAO="Oi, ";        
$nome;                     

$GREEN="\e[32m";
$RESET="\e[0m";
$YELLOW="\e[32;43;1;3m";
$INVERT="\e[7m";

print "${GREEN}LITERAL, CONSTANTE, VARIAVEL$RESET\n\n";
print "Literal clássico helloworld:$INVERT\tOi, mundo!$RESET\n\n";

print "Valor da variável antes da inicialização:\n";
print "nome: '$nome'\n";
print "$SAUDACAO$nome!\n\n";

print "${YELLOW}ATRIBUICOES EM DESIGN-TIME$RESET\n";
print "Inicialização:\n";
$nome="Ana";
print "nome: '$nome'\n";
print "$SAUDACAO$nome!\n\n";

print "Nova atribuição:\n";
$nome="Bela";
print "nome: '$nome'\n";
print "$SAUDACAO$nome!\n";
