#include <stdio.h>
#include <stdlib.h>

void f(int *x, int *y){
    *x = 4;
    *y = 5;
}

int* f2(){
    int* a = malloc(2*sizeof(int));
    a[0]=1;
    a[1]=2;
    return a;
}

int main(void){
    int x;
    int y;
    f(&x, &y);
    printf("x:%d y:%d\n", x, y);
    int *a = f2();
    printf("x:%d y:%d\n", a[0], a[1]);
    const int i = 3;
    int *ptr = &i;
    *ptr = 100;
    printf("i:%d\n", i);
}

/*Um vetor e um apontador constante que aponta para memoria modificavel*/