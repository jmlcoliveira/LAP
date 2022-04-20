#include <stdio.h>
#include <stdlib.h>

/*int func(int x){
    return x*x;
}*/


typedef int IntFunction(void);
//typedef IntFunction IntFunctionArray[100];


int f(int a, int b){
    printf("a: %d b: %d\n", a,b);
    return 0;
}

int main(void){
    int i = 0;
    f(i++, i++);
    printf("%f\n", 1+1.0);

}