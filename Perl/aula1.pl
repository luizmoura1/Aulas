# comentário em linha inteira
$SAUDACAO="Oi, ";  # comentário em fim de linha   ;sigil scale ; simples, um único valor          
$nome;                     

$GREEN="\e[32m";
$RESET="\e[0m";
$YELLOW="\e[32;43;1;3m";
$INVERT="\e[7m";

print "${GREEN}LITERAL, CONSTANTE, VARIAVEL$RESET";
print "\nLiteral clássico helloworld:\t";
print $INVERT, "Oi, mundo!", 
$RESET;

print "\nValor da variável antes da inicialização:\n";   
print "nome: '$nome'\n";
print "$SAUDACAO$nome\n";

print "\n${YELLOW}ATRIBUICOES EM DESIGN-TIME${RESET}\n";
print "Inicialização:\n";
$nome="Ana";
print "nome: '$nome'\n";
print "$SAUDACAO$nome\n";

print "\nNova 
atribuição:";
print   "\n"    ;
$nome="Bela";
print 
"nome: '$nome'\n" ;
print 
"$SAUDACAO$nome\n"
;
