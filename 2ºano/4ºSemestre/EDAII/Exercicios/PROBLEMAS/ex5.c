#include <stdio.h>
#include <stdlib.h>
#define MAX_TAMANHO 200003

struct endereco
{
    int interface;
    int mult;
};

struct endereco enderecos[MAX_TAMANHO];
//quicksort
int compara(const void * a, const void * b)
{
    struct endereco *posi1 = (struct endereco *)a;
    struct endereco *posi2 = (struct endereco *)b;
    
    return ( posi1->mult - posi2->mult );
}

//pesquisa
int pesquisa(int k, int i,int f)
{
    if(i > f) {
        return -1;
    }
    else
    {
        int m = (i+f)/2;
        if(k < enderecos[m].mult) {
            return pesquisa(k, i, m - 1);
        }
        else if(k > enderecos[m].mult){
            return pesquisa(k, m + 1, f);
        }
        else{
            return m;
        }
    }
}

int main()
{
    int n;
    int a,b,c,d,mult;
    int primeiro,segundo,terceiro,inter;
    scanf("%d",&n);

    for (int i=0;i<n;i++)
    {
        scanf("%d.%d.%d.0 %d",&primeiro,&segundo,&terceiro,&inter);
        if(primeiro == 0 && segundo == 0 && terceiro == 0)
        {
            enderecos[i].mult = 1;
            enderecos[i].interface = inter;
        }
        else
        {
            enderecos[i].mult=primeiro*1000000+segundo*1000+terceiro;
            enderecos[i].interface = inter;
        }
        
    }
    
    qsort(enderecos, n, sizeof(struct endereco), compara);

    while(scanf("%d.%d.%d.%d",&a,&b,&c,&d) != EOF){
        mult=a*1000000+b*1000+c;
        
        int aux = pesquisa(mult,0,n);
        int deaf = pesquisa(1,0,n);
        if(aux == -1)
        {
            if(deaf == -1)
            {
                printf("no route\n");
            }
            else
            {
                printf("%d\n", enderecos[deaf].interface);
            }
        }
        else
        {
             printf("%d\n", enderecos[aux].interface);
        }
    }
    
    return 0;
}
