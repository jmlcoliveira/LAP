#include <stdio.h>

int i = 1, j = 1, k = 1, l = 1 ;

void f(void) {
    int i = 2, j = 2 ;
    void h(void) {        // função aninhada
        int i = 3 ;
        l = i + j + k ;
    }
    void g(void p(void)) {     // outra função aninhada com parâmetro funcional
        int i = 7, j = 7, k = 7, l = 7 ;
        p() ;
    }
    g(h) ;
}

int main(void)
{
    f() ;
    printf("%d\n", l) ;
    return 0 ;
}

/* Estado da pilha no inicio de h

    A SP - aponta para o fim da pilha
    O FP aponta para base da funcao que estamos a chamar

    26 PC - ?
    25 SL - 10
    24 DL - 17
    _______p________ p que é h
    23 l - 7
    22 k - 7
    21 j - 7
    20 i - 7
    19 PC - ?
    18 SL - 10 como esta definido dentro da funcao f, aponta para o DL do f
    17 DL - 10
    16 SLH - 10 - SL onde o h esta definido (dentro de f que tem DL na pos 10)
    15 p &h           endereco da funcao h, no teste colocar ?
    _______g_________ recebe argumento h
    14 j - 2
    13 i - 2
    12 PC - ?
    11 SL - 0
    10 DL - 7
    _______f__________ nao recebe argumentos
    9 PC - ? aponta para a instrucao maquina a ser executada
    8 SL - 0 pq a main esta no top level serve para aceder as variaveis nao locais
    7 DL - 0 aponta para a funcao que chamou
    ______main________
    6 l - 1
    5 k - 1
    4 j - 1
    3 i - 1
    2 PC - ?
    1 SL - ?
    0 DL - ?
    ______start_______
    start inicializa variaveis globais e chama a funcao main
*/