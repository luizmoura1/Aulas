/*
Programa: EXPRESSÃO CONDICIONAL - operador ternário nativo em C - Aula 20 
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(void){
    srand(time(NULL));
    const int K = rand() % 9 + 1;

    int palpite;        //= 0;    
    char buf[32];       // array (LOUSA) onde é armazenada uma cópia do texto; o texto é mutável 
    const char *ptr;    // ponteiro (DEDO) que aponta a um texto (CARTAZ); o texto é imutável (garantido por 'const')

    printf("D E S A F I O \n");
    printf("Adivinhe o valor da constante K (1-9): ");
    scanf("%d", &palpite);
    printf("Seu palpite: %d\n", palpite);

    printf("\nForma 1: condição direta, resultado no printf\n");
    printf("%s Era %d.\n", palpite == K ? "Acertou!" : "Quase!", K);

    const int certo = (palpite == K);
    printf("\nForma 2: condição em uma variável, resultado no printf\n");
    printf("%s Era %d.\n", certo ? "Acertou!" : "Quase!", K);

    printf("\nForma 3: array que monta o texto e o guarda\n");
    snprintf(buf, sizeof buf, "%s Era %d.\n", certo ? "Acertou!" : "Quase!", K);
    printf("%s\n", buf);

    printf("Forma 4: ponteiro que só aponta para um literal\n");
    ptr = certo ? "Acertou!" : "Quase!";
    printf("%s Era %d.\n", ptr, K);

    return 0;
}