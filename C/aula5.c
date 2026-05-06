#include <stdio.h>
#define VAR1 "Oi, "
void main(){
    //char VAR2[] = "Oi, ";
    //char VAR2[] = {79,105,44,32,0}; //ASCII
    char VAR2[] = {'O', 'i',',',' ','\0'};

    printf("Conteúdo de VAR1: '" VAR1 "'\n");
    printf("Conteúdo de VAR2: '%s'\n",VAR2);   // "Conteúdo de VAR2: '%s%s",VAR2,"'\n"
}
