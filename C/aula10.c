#include <stdio.h>
#define GREEN "\x1b[1;32m"
#define YELLOW "\x1b[1;3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[1;7m"

void saudar(const char[], char[]);

void main(int argc, char *argv[]){
    const char SAUDACAO[] = "Oi, ";
    //const char SAUDACAO[] = {79,105,44,32,0};
    //const char SAUDACAO[] = {'O', 'i',',',' ','\0'};
    
    char nome[15]= "";      // = ""; evita comportamento indefinido (lixo ou falha)

    printf(GREEN "LITERAIS, CONSTANTES, VARIAVEIS\n" RESET);

    printf("\nLITERAL CLASSICO HELLOWORLD:\n");
    printf(INVERT "Oi, mundo!\n" RESET);

    printf("\nVALOR DA VARIAVEL ANTES DA INICIALIZACAO:\n");
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);   // TEMPO DE PROJETO
    printf("\nInicializacao (1a. atribuicao):\n");
    sprintf(nome, "Ana");      // não poderia inicializar dessa forma: nome = "Ana";
    saudar(SAUDACAO, nome);

    printf("\nNova atribuicao:\n");
    sprintf(nome, "Bela");      // não poderia atribuir dessa forma: nome = "Bela";
    saudar(SAUDACAO, nome);


    printf(YELLOW "\nATRIBUICAO EM INVOCATION-TIME\n" RESET);   // TEMPO DE INVOCACAO
    printf("\nEntrada por linha de comando:\n");
    sprintf(nome, argv[1]);          // argv[0] argv[1] argv[2] argv[3]
    saudar(SAUDACAO, nome);

    /*
    printf(YELLOW "\nATRIBUICOES EM RUNTIME\n" RESET);   // TEMPO DE PROJETO
    printf("\nEntrada por interacao:\n");
    //sprintf(nome, "Ana");
    saudar(SAUDACAO, nome);*/

}

void saudar(const char S[], char n[]){
    printf("nome: '%s'\n", n);
    printf("%s%s!\n", S, n);
}
