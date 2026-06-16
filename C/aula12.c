/*Programa: Manipulação de texto - Aula 12 (C)
Ambiente: vscode no Lubuntu*/
#include <stdio.h>
#define GREEN "\x1b[1;32m"
#define YELLOW "\x1b[1;3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[1;7m"

void saudar(const char S[], char n[]){
    printf("nome: '%s'\n", n);
    printf("%s%s!\n", S, n);
}

int main(int argc, char *argv[]){
    const char SAUDACAO[] = "Oi, ";
    
    char nome[15]= "";
    const char *DATA[] = {"mundo", "Ana", "Bela"};
    int i = 0;  // definição de índice, subscrito, contador, offset, 'data/read pointer'

    printf(GREEN "LITERAL, CONSTANTE, VARIÁVEL\n" RESET);

    printf("\nLITERAL CLASSICO HELLOWORLD: " INVERT "Oi, mundo!\n" RESET);

    printf("\nVALOR DA VARIAVEL ANTES DA INICIALIZACAO:\n");
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);
    printf("\nInicializacao direta:\n");
    sprintf(nome, "%s", "Ana");
    // sprintf(destino, "formato", dado) -> "%s" protege contra caracteres especiais
    //nome[0] = 65;   // 'A'; //nome[1] = 'n';  // 110
    //nome[2] = 'a';  // 97 //nome[3] = '\0'; // 0
    saudar(SAUDACAO, nome);

    printf("\nNova atribuicao simulando read/data:\n");
    sprintf(nome, "%s", DATA[i++]); sprintf(nome, "%s", DATA[i++]); sprintf(nome, "%s", DATA[i++]); //sprintf(nome, "Bela");
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICAO EM INVOCATION-TIME\n" RESET);
    printf("\nEntrada por linha de comando:\n");
    sprintf(nome, "%s", argv[1] ? argv[1] : "");    // argv[0] argv[1] argv[2] argv[3] // operador ternario  if ? then : else
    saudar(SAUDACAO, nome);

    printf(YELLOW "\nATRIBUICAO EM RUNTIME\n" RESET);
    printf("\nEntrada por interacao:\n");
    printf("Digite um nome (1-14 caracteres): ");
    scanf("%14s", nome);                         // nao poderia ser dessa forma: sprintf(nome, "Ana");
    saudar(SAUDACAO, nome);

    return 0;
}
