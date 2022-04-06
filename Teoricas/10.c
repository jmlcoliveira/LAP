#include <stdio.h>
/*Ligacoes (Bindings)
    Uma ligacao consiste numa associacao entre duas entidades.
    entidades podem ser nomes, localizacoes de memoria, tipos, objetos, etc.

    Ex: x=5;


Momento de estabelecimento duma ligação

    Em JS a ligacao e toda feita em tempo de execucao.

    -Quanto mais tarde se estabelecem as ligacoes mais flexivel e a linguagem.
    -Quanto mais cedo se estabelecem as ligacoes, mais rapida e a linguagem.

    1- a.f(x) vs 2 - f x
    O 1 apesar de ser mais lento, permite maior flexibilidade (Object orientend)


Classificao das ligacoes

    -Estaticas: efetuadas antes da execução do programa
    -Semidinamicas: efetuadas em tempo de execução mas determinadas em grande parte antes de o programa começar a correr.
        Em java os nomes das funcoes sao substituidos pela posicao da funcao na tabela com as varias funcoes do objeto.
    -Dinamicas: efetuadas completamente em tempo de execução.


Tempo de vida de uma ligacao

    Periodo de tempo da execucao dum programa durante a qual essa ligacao persiste.
    As ligações estaticas persistem durante a execução de TODO o programa. 
    As ligações semidinamicas e dinamicas persistem geralmente apenas durante PARTE da execucao do programa.
*/

/*Ambiente (conjunto de ligacoes para nomes)
    Todos os nomes que sao visiveis num determinado ponto do programa

Ambito (escopo) duma ligacao
    Regiao do programa na qual esse nome tem os atributos estabelecidos pela declaracao que introduz a ligacao.
    Os blocos "{ }" sao ambitos

Resolucao de nomes
    processo de descoberta do significado (ou seja, da ligacao) de 
    alguns nomes num ponto do programa onde esses nomes sao usados.
*/

int a; //variavel global, visivel em todo o programa
int main(void){
    int i; //i e acessivel ate a chaveta, mas tem um "buraco" pois e redefinido dentro das chavetas interiores
    int b = 5; //b so e acessivel apartir deste ponto
    i = a + b;
    {
        int i = 0;
        int j = i + 2; //o compilador tem que saber qual o "i" que esta a ser usado.
                        // faz isso atravez da resolucao de nomes
        int k = i + j;
        printf("%d %d %d\n", i, j, k);
    }
    printf("%d %d\n", i, b); 	
    return 0;
}