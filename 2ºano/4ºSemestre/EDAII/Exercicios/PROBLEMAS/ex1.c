#include <stdio.h>

int contagem(int a)
{
    int c = 0;

    do 
    {
        c++;
        a/=10;
    } while (a!=0);
    return c;
}

int main(void)
{
    int n;

    scanf("%d",&n);
    printf("%d\n",contagem(n));
    return 0;
}