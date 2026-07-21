/*Programa: Manipulação de número - Aula 14 (C)
Ambiente: vscode no GhostBSD*/
#include <stdio.h>
#include <stdlib.h>
#define GREEN "\x1b[1;32m"
#define YELLOW "\x1b[1;3;34;43m"
#define RESET "\x1b[0m"
#define INVERT "\x1b[1;7m"

int main(int argc, char *argv[]){
    const int K = 1;
    int n1;

    const int DATA[] = {1, 3, 5, 9, 0};
    int i = 0; 

    printf(GREEN "LITERAL, CONSTANTE, VARIAVEL\n" RESET);

    printf("\nLiteral numerico magico:%s\t%d%s\n", INVERT, 142857, RESET);   // "\nLiteral numerico magico:\t" INVERT "142857" RESET

    printf("\nValor da variavel antes da inicializacao\n");
    printf("n1 = %d\t", n1);

    printf(YELLOW "\nATRIBUICOES EM DESIGN-TIME\n" RESET);
    printf("Inicializacao direta\n");
    n1 = 3; //para números não é assim que se inicializa ou se atribui: sprintf(n1, "%d", 3);
    printf("n1 = %d\t", n1);
 
    printf("\nNova atribuicao simulando read/data\n");
    n1 = DATA[i++]; n1 = DATA[i++]; n1 = DATA[i++];
    printf("n1 = %d\t", n1);

    printf(YELLOW "\nATRIBUICAO EM INVOCATION-TIME\n" RESET);
    printf("Entrada por linha de comando\n");
    n1 = argv[1] ? atoi(argv[1]) : 0;
    printf("n1 = %d\t", n1);
    
    printf(YELLOW "\nATRIBUICAO EM RUNTIME\n" RESET);
    printf("Entrada por interacao\n");
    printf("Digite um numero (0-9): ");
    scanf("%d", &n1);
    printf("n1 = %d\t", n1);

    return 0;
}
