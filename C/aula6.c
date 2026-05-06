#include <stdio.h>
#define MCR1 "Oi, "
void imprime_conteudo(const char STR1[]){
    printf("Conteúdo de MCR1: '" MCR1 "'\n");
    printf("Conteúdo de CST1: '%s'\n",STR1);   // "Conteúdo de CST1: '%s%s",STR1,"'\n"
}
void main(){
    #include "saudacao.txt"
    imprime_conteudo(CST1);

}
