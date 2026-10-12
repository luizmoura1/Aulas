/*
Programa: Expressões relacionais e lógicas - Aula 18(C)
Ambiente: Lubuntu/VS Code
*/
#include <stdio.h>
void testar(int a, int b){
    printf("a = %d, b = %d\n", a, b);

    printf("Expressões relacionais:\n");
    printf("a == b \t%d\n", a == b);
    printf("a != b \t%d\n", a != b);
    printf("a > b \t%d\n", a > b);
    printf("a < b \t%d\n", a < b);

    printf("Expressões lógicas:\n");
    printf("a && b \t%d\n", a && b);
    printf("a || b \t%d\n", a || b);
    printf("!a \t%d\n", !a);
    printf("!b \t%d\n", !b);

    printf("=======================\n");
}

int main(){
    testar(1,2);
    testar(2,2);
    testar(0,2);
    testar(0,0);
    return 0;
}