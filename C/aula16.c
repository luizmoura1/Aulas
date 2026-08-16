/*Programa: Manipulação de número - Aula 16 (C)
Editor: Pe / S.O.: Haiku*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define GREEN "\x1b[1;32m"
#define RESET "\x1b[0m"

int main(){
    srand(time(NULL));
    static const char DATA[10] = {'A','E','I','O','U','a','e','i','o','u',};
    char K = DATA[rand() % 10];
    int l1, palpite;

    printf(GREEN "LITERAL, CONSTANTE, VARIAVEL\n" RESET);
    
    printf("Digite uma letra: ");
    l1 = getchar();
    while (getchar() != '\n');

    printf(GREEN "\nOPERACOES RELACIONAIS\n" RESET);
    printf("l1 == K \t%d\n", l1 == K);
    printf("l1 != K \t%d\n", l1 != K);
    printf("l1 > K  \t%d\n", l1 > K);
    printf("l1 >= K \t%d\n", l1 >= K);
    printf("l1 < K  \t%d\n", l1 < K);
    printf("l1 <= K \t%d\n", l1 <= K);

    printf(GREEN "\nD E S A F I O\n" RESET);
    printf("Adivinhe a vogal (A..u): ");
    palpite = getchar();
    printf("%s Era %c.\n", (palpite == K) ? "Acertou!" : "Quase!", K);

    return 0;
}
