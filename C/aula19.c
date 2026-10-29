#include <stdio.h>
int main(void){
    char buf[] = "oi";      // array (LOUSA) onde é armazenada uma cópia do texto; o texto é mutável 
    const char *ptr = "oi"; // ponteiro (DEDO) que aponta a um texto (CARTAZ); o texto é imutável (garantido por 'const')

    printf("INICIALIZAÇÃO\n");

    printf("Array:      %s\n", buf);
    printf("Ponteiro:   %s\n", ptr);

    printf("\nTamanho do array    = %zu\n", sizeof buf);
    printf("Tamanho do ponteiro = %zu\n", sizeof ptr);


    printf("\nALTERAÇÃO / NOVA ATRIBUIÇÃO\n");

    buf[0] = 'O';           // OK:      podemos alterar os caracteres na LOUSA
    // ptr[0] = 'O';        // ERRO:    não podemos alterar os caracteres no CARTAZ

    //buf = "Olá!";         // ERRO:    a LOUSA não pode ser trocada por outra
    ptr = "Olá!";           // OK:      o DEDO pode apontar a outro CARTAZ
    
    printf("Array:      %s\n", buf);
    printf("Ponteiro:   %s\n", ptr);

    printf("\nTamanho do array    = %zu\n", sizeof buf);
    printf("Tamanho do ponteiro = %zu\n", sizeof ptr);

    return 0;
}