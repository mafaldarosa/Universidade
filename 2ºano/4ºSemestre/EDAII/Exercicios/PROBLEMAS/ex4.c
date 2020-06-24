#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TAMANHO 1101

void descodificar(char texto[])
{
    int tm=strlen(texto);
    char aux[TAMANHO];
    int count=0;
    int c=0,k=0,i=0;
    for( i=0;i<tm-1;i++) // percorrer o array texto
    {
        aux[k]=texto[i];
        for(int j=0;j<=c;j++) // vai ver os caracteres do array aux
        {
            if (aux[j] == texto[i + 1])  // ver se o caracter é igual
            {
                printf("%c",aux[j]); // sef for igual aparece na consola essa letra
                for (int f = 0; f < tm - 1; f++) //colocar o aux a 0 porque já não precisa da informação anterior
                {
                    aux[f] = 0;
                }
                i = i + 1;
                k = -1;
                c=0;
            }
            else
            {
                c=i;
            }
        }
        k++; // balancear o k=-1 para quando houver caracter igual e ao fim de colocar o aux a 0, poder começar no indice 0
        count++;
    }
    printf("\n");
}

int main()
{
    char str[TAMANHO];
    while(scanf("%s",str)!=EOF){
        descodificar(str);
        memset(str,0,TAMANHO);
    }
    return 0;
}