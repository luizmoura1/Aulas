#include <stdio.h>
#define GREEN "\x1b[1;32m"
#define YELLOW "\x1b[1;3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[1;7m"

void saudar(const char[], char[]);

void main(int argc, char *argv[]){
    //const char SAUDACAO[] = "Oi, ";
    const char SAUDACAO[] = {79,105,44,32,0};
    //const char SAUDACAO[] = {'O', 'i',',',' ','\0'};
    
    char nome[15]= "";      // = ""; evita comportamento indefinido (lixo ou falha)

    printf(GREEN "LITERAIS, CONSTANTES, VARIAVEIS\n" RESET);

    printf("\nLITERAL CLASSICO HELLOWORLD:\n");
    printf(INVERT "Oi, mundo!\n" RESET);

    printf("\nVALOR DA VARIAVEL ANTES DA INICIALIZACAO:\n");
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);   // TEMPO DE PROJETO
    printf("\nInicializacao (1a. atribuicao):\n");
    //sprintf(nome, "Ana");      // nao poderia inicializar dessa forma: nome = "Ana";
    nome[0] = 65;    //'A';
    nome[1] = 'n';
    nome[2] = 'a';
    nome[3] = '\0';

    saudar(SAUDACAO, nome);

    printf("\nNova atribuicao:\n");
    sprintf(nome, "Bela");      // nao poderia atribuir dessa forma: nome = "Bela";
    saudar(SAUDACAO, nome);


    printf(YELLOW "\nATRIBUICAO EM INVOCATION-TIME\n" RESET);   // TEMPO DE INVOCACAO
    printf("\nEntrada por linha de comando:\n");
    sprintf(nome, argv[1] ? argv[1] : "");          // argv[0] argv[1] argv[2] argv[3] // operador ternario  if ? then : else
    saudar(SAUDACAO, nome);

    
    printf(YELLOW "\nATRIBUICAO EM RUNTIME\n" RESET);   // TEMPO DE EXECUCAO
    printf("\nEntrada por interacao:\n");
    printf("Digite um nome (1-14 caracteres): ");
    scanf("%14s", nome);                         // nao poderia ser dessa forma: sprintf(nome, "Ana");
    saudar(SAUDACAO, nome);

}

void saudar(const char S[], char n[]){
    printf("nome: '%s'\n", n);
    printf("%s%s!\n", S, n);
}
