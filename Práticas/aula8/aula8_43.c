#include <stdbool.h>
#include <string.h>
#include <stdio.h>

bool copy(int s, void * a, int aSize, int aIndex, void * b, int bSize, int bIndex)
{
    if(aIndex >= aSize || bIndex >= bSize || aIndex < 0 || bIndex < 0) return false;

    /*for(int i = 0; i < aIndex; i++)
        a = a + s;

    for(int i = 0; i < bIndex; i++)
        b = b + s;*/

    //memcpy(b, a, s);
    
    char *aa = (char*)a;
    char *bb = (char*)b;

    memcpy(bb + s * bIndex, aa + s * aIndex, s);

    return true;
}

int main(void)
{
    const int ASIZE = 10, BSIZE = 20;
    int a[ASIZE], b[BSIZE];
    a[3]=123;
    b[6]=321;
    copy(sizeof(int), a, ASIZE, 3, b, BSIZE, 6);  // a[3] = b[6]
    printf("a[3]=%d b[6]=%d\n", a[3], b[6]);
    return 0 ;
}