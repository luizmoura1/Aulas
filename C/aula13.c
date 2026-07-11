/*Programa: Manipulação de texto - Aula 13 (C)
Ambiente: vscode no Lubuntu*/
#include <stdio.h>
#define GREEN "\x1b[1;32m"
#define YELLOW "\x1b[1;3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[1;7m"

#define SAUDAR(S, n) printf("nome: '%s'\t", n); printf("%s%s!\n", S, n);
//void saudar(const char[], char[]);
void saudar(const char S[], char n[]){
    printf("nome: '%s'\t", n);
    printf("%s%s!\n", S, n);
}

const char GREETING[] = "Hi, "; // {'H', 'i', ',', ' ', '\0'} | {72, 105, 44, 32, 0}
char name[16];  // inicializa com zeros automaticamente por ser global

#define GREET() printf("name: '%s'\t", name); printf("%s%s!\n", GREETING, name);
//void greet();
void greet(){   // acessa GREETING e name diretamente - variaveis globais dispensam parametros
    printf("name: '%s'\t", name);
    printf("%s%s!\n", GREETING, name);
}


int main(int argc, char *argv[]){
    const char SAUDACAO[] = "Oi, "; // {'O', 'i', ',', ' ', '\0'} | {79, 105, 44, 32, 0}
    char nome[16];  // = "" | {'\0'} | {0} para evitar lixo e risco de Undefined Behavior/crash por ser local

    const char *DATA[] = {"mundo", "Ana", "Bela"};
    int i = 0; 

    printf(GREEN "LITERAL, CONSTANTE, VARIAVEL\n" RESET);

    printf("\nLiteral classico Helloworld:\t" INVERT "Oi, mundo!\n" RESET);

    printf("\nValor da variavel antes da inicializacao\n");
    saudar(SAUDACAO, nome);
    SAUDAR(SAUDACAO, nome);
    greet();
    GREET();

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);
    printf("Inicializacao direta\n");
    sprintf(nome, "%s", "Ana");
    //nome[0] = 'A';    nome[1] = 'n';  nome[2] = 'a';  nome[3] = '\0';
    //nome[0] = 65;     nome[1] = 110;  nome[2] = 97;   nome[3] = 0;
    //sprintf(&nome[0], "%c", 'A');    sprintf(&nome[1], "%c", 'n');  sprintf(&nome[2], "%c", 'a');  sprintf(&nome[3], "%c", '\0');
    //sprintf(&nome[0], "%c", 65);     sprintf(&nome[1], "%c", 110);  sprintf(&nome[2], "%c", 97);   sprintf(&nome[3], "%c", 0);
    saudar(SAUDACAO, nome);
    SAUDAR(SAUDACAO, nome);
    sprintf(name, "%s", "Ana");
    greet();
    GREET();

    printf("\nNova atribuicao simulando read/data\n");
    sprintf(nome, "%s", DATA[i++]); sprintf(nome, "%s", DATA[i++]); sprintf(nome, "%s", DATA[i++]);
    saudar(SAUDACAO, nome);
    SAUDAR(SAUDACAO, nome);
    i=0;    // ATENÇÃO: para evitar Undefined Behavior e Segmentation Fault
    sprintf(name, "%s", DATA[i++]); sprintf(name, "%s", DATA[i++]); sprintf(name, "%s", DATA[i++]);
    greet();
    GREET();

    printf(YELLOW "\nATRIBUICAO EM INVOCATION-TIME\n" RESET);
    printf("Entrada por linha de comando\n");
    sprintf(nome, "%s", argv[1] ? argv[1] : "");
    saudar(SAUDACAO, nome);
    SAUDAR(SAUDACAO, nome);
    sprintf(name, "%s", argv[1] ? argv[1] : "");
    greet();
    GREET();

    printf(YELLOW "\nATRIBUICAO EM RUNTIME\n" RESET);
    printf("Entrada por interacao\n");
    printf("Digite um nome (1-14 caracteres): ");
    scanf("%14s", nome);
    saudar(SAUDACAO, nome);
    SAUDAR(SAUDACAO, nome);
    printf("Digite outro nome (1-14 caracteres): ");
    scanf("%14s", name);
    greet();
    GREET();

    return 0;
}
