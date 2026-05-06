#include <stdio.h>
//void imprime_conteudo(const char[]);

void main(){
    const char SAUDACAO[] = "Oi, ";
    //const char SAUDACAO[] = {79,105,44,32,0};
    //const char SAUDACAO[] = {'O', 'i',',',' ','\0'};
    
    char nome[15] = "";

    printf("LITERAL, CONSTANTE e VARIAVEL\n");

    printf("\n1 - LITERAL CLASSICO HELLOWORLD:\n");
    printf("Oi, mundo!\n");

    printf("\n2 - VALOR PADRAO DA VARIAVEL ANTES DA INICIALIZACAO\n");
    printf("nome = %s\n", nome);

    printf("\nATRIBUICOES EM DESIGN-TIME\n");   // TEMPO DE PROJETO
    printf("\n3 - INICIALIZACAO\n");
    






    //imprime_conteudo(SAUDACAO);
}



//void imprime_conteudo(const char SAUDACO[]){
//    printf("Conteúdo de SAUDACAO: '%s'\n",STR1);
//}
