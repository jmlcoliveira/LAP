#include <stdio.h>
int a;      // variável a-global
int b;      // variável b-global

void p(void) { a = b; }

void f(int b) {   // parâmetro b-local
    int a = b;    // variável a-local
    p();   /* aqui */
}

int main(void) {
    a = 5; b = 6; f(7);
    printf("%d %d\n", a, b);
    return 0;
}

//a. output do programa sera 6 6
//b. output com escopo dinamico 5 6

/*41 - diga qual é ambiente no ponto indicado pelo comentário: "aqui".
    No ponto assinalado temos acesso a variavel local a, ao parametro da funcao b, funcoes f e p e
    a bibliotecas stdio.h do c
*/

/*42 - diga qual é o âmbito da variável global "b".
    O ambito de b e todo o programa abaixo da sua definicao exceto a funcao f
*/