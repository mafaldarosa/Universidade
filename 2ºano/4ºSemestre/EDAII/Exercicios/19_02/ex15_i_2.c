#include <stdio.h>
#define TAMANHO 50000

int procura(int n,int s,int v[s])
{
    for(int i=0;i<s;i++)
    {
        if(v[i]==n)
        {
            return i;
        }
    }
    return -1;
}
int main(void)
{
    int v[TAMANHO];
    int n=0;
    for (int i=0;i<TAMANHO;i++)
    {
        v[i]=2+n;
        n=n+2;
    }

    for (int i = 1; i <= TAMANHO; ++i)
    {
        int p = procura(2 * i,TAMANHO,v[TAMANHO]);

        if (p == -1)
            printf("Não encontrou %d\n", i);
        else if(v[p] != 2 * i)
            printf("Encontrou %d na posição errada: %d\n", 2*i, p);
    }

    return 0;
}