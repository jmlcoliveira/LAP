/* Tratamento de erros
biblioteca padrão contém um módulo chamado setjmp que fornece 
um mecanismo de saltos não locais que permite tratar exceções a baixo nível.
*/
#include <stdio.h>

int append(char strg[], char c){
    int i=0;
    for(;strg[i]!='\0'; i++);
    strg[i]=c;
    strg[i+1]='\0';
    //strg[i+2]='\0';
}

int main(void){
    char s[] = "ddd";
    append(s, 'c');
    printf("%s\n", s);
}