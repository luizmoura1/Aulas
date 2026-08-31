/*
Programa: Manipulação de caracteres - Aula 16 (C)
Ambiente: Lubuntu/VS Code (client) e Haiku OS (server)
Ferramentas: ssh, nano, gcc
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define GREEN "\x1b[1;32m"
#define RESET "\x1b[0m"

int main(){
    srand(time(NULL));
    const char DATA[] = {'A','E','I','O','U','a','e','i','o','u'};
    char K = DATA[rand() % 10];
    int l1, palpite; 

    printf(GREEN "LITERAL, CONSTANTE, VARIAVEL\n" RESET);
   
    printf("Digite uma letra: ");
    l1 = getchar();
    while(getchar() != '\n');
    printf("\nl1 = %d\n", l1);

    printf(GREEN "\nOPERACOES RELACIONAIS\n" RESET);
    printf("l1 == K \t%d\n", l1 == K);
    printf("l1 != K \t%d\n", l1 != K);
    printf("l1 > K  \t%d\n", l1 > K);
    printf("l1 >= K \t%d\n", l1 >= K);
    printf("l1 < K  \t%d\n", l1 < K);
    printf("l1 <= K \t%d\n", l1 <= K);

    printf(GREEN "\nD E S A F I O\n" RESET);
    printf("Adivinhe a vogal K (A...u): ");
    palpite = getchar();
    printf("\n%s Era %c.\n", (palpite == K) ? "Acertou!" : "Quase!", K);

    return 0;
}
