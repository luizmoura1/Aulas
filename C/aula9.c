#include <stdio.h>
#define GREEN "\x1b[32m"
#define YELLOW "\x1b[3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[7m"

void saudar(const char[], char[]);

void main(){
    const char SAUDACAO[] = "Oi, ";
    //const char SAUDACAO[] = {79,105,44,32,0};
    //const char SAUDACAO[] = {'O', 'i',',',' ','\0'};
    
    char nome[15]= "";      // = ""; evita comportamento indefinido (lixo ou falha)

    printf(GREEN "LITERAIS, CONSTANTES, VARIAVEIS\n" RESET);

    printf("\n1 - LITERAL CLASSICO HELLOWORLD:\n");
    printf(INVERT "Oi, mundo!\n" RESET);

    printf("\n2 - VALOR PADRAO DA VARIAVEL ANTES DA INICIALIZACAO:\n");
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);   // TEMPO DE PROJETO
    printf("\n3 - INICIALIZACAO:\n");
    sprintf(nome, "Ana");      // não poderia inicializar dessa forma: nome = "Ana";
    saudar(SAUDACAO, nome);

    printf("\n3 - NOVA ATRIBUICAO:\n");
    sprintf(nome, "Bela");      // não poderia atribuir dessa forma: nome = "Bela";
    saudar(SAUDACAO, nome);

}

void saudar(const char S[], char n[]){
    printf("nome: '%s'\n", n);
    printf("%s%s!\n", S, n);
}
