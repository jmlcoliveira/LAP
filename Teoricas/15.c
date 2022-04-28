/*Pilha (LIFO)

1. Avalicao de expressoes
Para cada operação a executar, primeiro os seus 
argumentos são empilhados (pela ordem em que aparecem escritos) 

2.Acesso a variaveis
    1-sem recursividade nem aninhamento de funcoes (nesting)
        cada procedimento e dono duma zona de memoria propria onde as suas variaveis locais sao guardadas. 
        Todas as variaveis são estaticas, ou seja tem localizacoes de memoria fixas

    2-com recursividade mas sem aninhamento de funcoes
        variaveis globais, ou seja as variaveis declaradas fora das funcoes, 
        sao consideradas variaveis estaticas e tem localizacoes de memoria fixas. 
        variaveis locais sao criadas dinamicamente no topo duma pilha sempre que a sua funcao-dona e ativada; 
        sao removidas do topo da pilha quando a execucao da funcao-dona termina.

    3-com recursividade e com aninhamento de funcoes
        variaveis declaradas nas funcoes envolventes, as chamadas variaveis intermedias.
        guardar na ativação de cada função o respetivo ambiente de definicao (que e a funcao envolvente) 
        representado por um apontador (static link) para a ativacao mais recente da funcao envolvente na pilha.

o _start em java e chamado qd o programa inicia e executa a main e apanha excecoes. Pode ser
chamado um intermediario.

Eis o nosso formato para os registos de ativação:

          <- SP
Variável local n
...
Variável local 1
Variável local 0
PC
SL
DL        <- FP
Argumento m
...
Argumento 1
Argumento 0

as variaveis globais sao avos

*/
#include <stdio.h>
int c;
int f(int a, int b){
    c = a + b;
    return a+b;
}

void f2(int func(int a, int b)){
    printf("%d\n", func(2, 3));
}

int main(void){
    f(1, 2);
    f2(f);
    printf("%d\n", c);
    return 0;
}