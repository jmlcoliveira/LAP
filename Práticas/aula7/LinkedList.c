#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "LinkedList.h"
#include <stdarg.h>

typedef struct Node {
    Data data;
    List next;
} Node;

static List newNode(Data val, List next)
{
    List n = malloc(sizeof(Node));
    if( n == NULL )
        return NULL;
    n->data = val;
    n->next = next;
    return n;
}

//Meter nas cabulas
List listMakeRange(Data a, Data b)
{  // TECNICA ESSENCIAL: Ir fazendo crescer a lista no ultimo no'.
    if( a > b )
        return NULL;
    double i;
    List l = newNode(a, NULL), last = l;
    for( i = a + 1 ; i <= b ; i++ )
        last = last->next = newNode(i, NULL);
    return l;
}

/* Outra maneira, mais palavrosa, de escrever a funcao anterior:

List listMakeRange(Data a, Data b)
{
    if( a > b )
        return NULL;
    double i;
    List l = newNode(a, NULL);
    List last = l;
    for( i = a + 1 ; i <= b ; i++ ) {
        List q = newNode(i, NULL);
        last->next = q;
        last = q;
    }
    return l;
}
*/

int listLength(List l) {
    int count;
    for( count = 0 ; l != NULL ; l = l->next, count++ );
    return count;
}

bool listGet(List l, int idx, Data *res)
{
    int i;
    for( i = 0 ; i < idx && l != NULL ; i++, l = l->next );
    if( l == NULL )
        return false;
    else {
        *res = l->data;
        return true;
    }
}

List listPutAtHead(List l, Data val)
{
    return newNode(val, l);
}

List listPutAtEnd(List l, Data val)
{
    if( l == NULL )
        return newNode(val, NULL);
    else {
        List p;
        for( p = l ; p->next != NULL ; p = p->next ); // Stop at the last node
        p->next = newNode(val, NULL);  // Assign to the next of the last node
        return l;
    }
}

List listFilter(List l, BoolFun toKeep)
{  // TECNICA ESSENCIAL: Adicionar um no' auxiliar inicial para permitir tratamento uniforme.
      // Tente fazer sem o no' suplementar e veja como fica muito mais complicado.
    Node dummy;
    dummy.next = l;
    l = &dummy;
    while( l->next != NULL )
        if( toKeep(l->next->data) )
            l = l->next;
        else {
            List del = l->next;
            l->next = l->next->next;
            free(del);
        }
    return dummy.next;
}

void listPrint(List l)
{
    for( ; l != NULL ; l = l->next )
        printf("%lf\n", l->data);
}

static bool isEven(Data data) {
    return (int)data % 2 == 0;
}

static bool isOdd(Data data) {
    return (int)data % 2 != 0;
}

List listClone(List l) {
    if(l==NULL) return NULL;
    List last = newNode(l->data, NULL);
    List head = last;
    l=l->next;
    for( ; l != NULL ; l = l->next)
        last = last->next = newNode(l->data, NULL);
    
    return head;
}

List listAppend(List l1, List l2){
    if(l1 == NULL)
        return listClone(l2);
    
    List l = l1;

    while(l->next != NULL)
        l = l->next;

    l->next = listClone(l2);
    return l1;
}

List listRev(List l){
    List rev = NULL;
    for (; l != NULL; l = l-> next)
        rev = listPutAtHead(rev, l->data);
    return rev;
}

List listRevInPlace(List l){
    //TODO
    return NULL;
}

Data glob;
int count = 0;
bool toKeep(Data d){
    if(count == 0 && d == glob){
        count++;
        return true;
    }
    return d != glob;
};

List listUniq(List l){
    List n = l;
    for(; l != NULL; l = l->next){
        glob = l->data;
        count=0;
        n = listFilter(n, &toKeep);
    }
    return n;
}

List listNew(int n, ...)
{
    va_list va;
    List l = NULL;
    va_start(va, n);
    while( n-- )
        l = ListPutAtEnd(l, va_arg(va, double));
    va_end(va);
    return l;
}

void listTest(void) {
    List l = listMakeRange(1.0, 8.0);
    List l2 = listMakeRange(1.0, 8.0);
    listPrint(l);
    printf("----------\n");
    listPrint(l2);
    printf("----------\n");
    List l12 = listAppend(l, l2);
    listPrint(l12);
    printf("----------\n");
    listPrint(listUniq(l12));
}