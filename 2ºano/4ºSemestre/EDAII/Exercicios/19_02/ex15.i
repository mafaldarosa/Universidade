#include <stdio.h>
#define TAMANHO 50000

int main(void)
{
    int v[TAMANHO];
    int n=0;
    printf("[");
    for (int i=0;i<TAMANHO;i++)
    {
        v[i]=2+n;
        n=n+2;
        if(i<TAMANHO-1)
        {
            printf("%d,",v[i]);
        }
        else
        {
            printf("%d]",v[i]);
        }
    }
    return 0;
}