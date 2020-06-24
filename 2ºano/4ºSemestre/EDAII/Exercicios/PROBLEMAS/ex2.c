#include <stdio.h>

void jogo(int a) 
{
    int montes_feijoes[a];
    for (int i = 0; i < a; i++) 
    {
        scanf("%d", &montes_feijoes[i]);
    }
    int b=0; //move o i
    int c=2; //move o j
    int i = montes_feijoes[b];
    int j = montes_feijoes[a - 1];
    int bela = 0;
    int alex = 0;
    int jogada=1;
    while (jogada != a+1) 
    {
        if (jogada % 2 != 0) //Alex
        { 
            if (i > j) 
            {
                alex += i;
                i = montes_feijoes[b + 1];
                b++;

            } 
            else if (i < j) 
            {
                alex += j;
                j = montes_feijoes[a-c];
                c++;
            } 
            else
                alex +=j;
        } 
        else  //jogada%2==0
        {
            if (jogada % 4 == 0) //Bela2
            { 
                if (i < j) 
                { 
                    bela += j;
                    j = montes_feijoes[a-c];
                    c++;
                } 
                else if (i > j) 
                {
                    bela += i;
                    i = montes_feijoes[b+1];
                    b++;
                } 
                else
                {    
                    bela += j;
                }
            } 
            else //Bela1
            {
                if (i > j) 
                {
                    bela += j;
                    j = montes_feijoes[a-c];
                    c++;
                } 
                else if (i < j) 
                {
                    bela += i;
                    i = montes_feijoes[b+1];
                    b++;
                } 
                else
                {    
                    bela += j;
                }
            }
        }
        jogada ++;
    }
    if (bela > alex) 
    {
        printf("Bela ganha com %d contra %d\n", bela, alex);
    } 
    else if (bela < alex) 
    {
        printf("Alex ganha com %d contra %d\n", alex, bela);
    } 
    else
    {    
        printf("Alex e Bela empatam a %d\n", bela);
    }
}
int main(void)
{
    int tamanho;
    scanf("%d",&tamanho);
    jogo(tamanho);
}