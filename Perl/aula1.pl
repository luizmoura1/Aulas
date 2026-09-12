# comentário em linha inteira
$SAUDACAO="Oi, ";  # comentário em fim de linha; scale;     sigil; valor único, simples        
$nome;                     

$GREEN="\e[32m";
$RESET="\e[0m";
$YELLOW="\e[32;43;1;3m";
$INVERT="\e[7m";

print "${GREEN}LITERAL, CONSTANTE, VARIAVEL${RESET}";
print "\n\nLiteral clássico helloworld:\t${INVERT}Oi, mundo!${RESET}";

print "\n\nValor da variável antes da inicialização:\n";
print "nome: '${nome}'\n";
print "${SAUDACAO}${nome}!\n";

print "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}";
print "\nInicialização:\n";
$nome="Ana";
print "nome: '${nome}'\n";
print "${SAUDACAO}${nome}!\n";

print "\nNova atribuição:\n";
$nome="Bela";
print "nome: '${nome}'\n";
print "${SAUDACAO}${nome}!\n";
