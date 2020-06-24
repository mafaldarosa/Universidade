#include <stdio.h>

struct equipas
{
    char nome[21];
    int ganhos,empates,derrotas,pontos,marcados,sofridos;
};

int max (struct equipas arr_equipa[], int equipa)
{

    int ganhou, maximo = 0;

    for (int i = 0; i < equipa; i++)
    {
        if (arr_equipa[i].pontos > maximo)
        {
            maximo = arr_equipa[i].pontos;
            ganhou = i;
        }
    }

    for (int j = 0; j < equipa; j++)
    {
        if(j == ganhou)
        {
            j++;
        }
        if(arr_equipa[j].pontos == maximo)
        {
            return -1;
        }
    }

    return ganhou;
}

int compare(char string1[], char string2[])
{
    int i = 0;
    int flag = 0;
    while (flag == 0)
    {
        if (string1[i] > string2[i])
        {
            flag = 1;
        }
        else if (string1[i] < string2[i])
        {
            flag = -1;
        }

        if (string1[i] == '\0')
        {
            break;
        }

        i++;
    }
    return flag;
}

void jogo(int n,int j)
{
    struct equipas equipas[n];

    for (int i = 0; i < n; i++)
    {
        scanf("%s", equipas[i].nome);

        equipas[i].pontos = 0;
        equipas[i].ganhos = 0;
        equipas[i].derrotas = 0;
        equipas[i].empates = 0;
        equipas[i].sofridos = 0;
        equipas[i].marcados = 0;

    }
    char eq1[21];
    char eq2[21];
    int p1;
    int p2;
    for (int k = 0; k < j; k++)
    {
        scanf("%s %d - %s %d", eq1, &p1, eq2, &p2);
        
        if (p1 > p2)
        {
            for (int l = 0; l < n; l++)
            {
                while(compare(eq1,equipas[l].nome)==0)
                {
                    equipas[l].ganhos=equipas[l].ganhos+1;
                    equipas[l].pontos = equipas[l].pontos + 3;
                    equipas[l].marcados = equipas[l].marcados + p1;
                    equipas[l].sofridos = equipas[l].sofridos + p2;
                    break;
                }
            }
            for (int l = 0; l < n; l++)
            {
                while(compare(eq2,equipas[l].nome)==0)
                {
                    equipas[l].derrotas=equipas[l].derrotas+1;
                    equipas[l].marcados = equipas[l].marcados + p2;
                    equipas[l].sofridos = equipas[l].sofridos + p1;
                    break;
                }
            }

        } else if (p1 < p2)
        {
            for (int l = 0; l < n; l++)
            {
                while(compare(eq2,equipas[l].nome)==0)
                {
                    equipas[l].ganhos=equipas[l].ganhos+1;
                    equipas[l].pontos = equipas[l].pontos + 3;
                    equipas[l].marcados = equipas[l].marcados + p2;
                    equipas[l].sofridos = equipas[l].sofridos + p1;
                    break;
                }
            }
            for (int l = 0; l < n; l++)
            {
                while(compare(eq1,equipas[l].nome)==0)
                {
                    equipas[l].derrotas=equipas[l].derrotas+1;
                    equipas[l].marcados = equipas[l].marcados + p1;
                    equipas[l].sofridos = equipas[l].sofridos + p2;
                    break;
                }
            }
        } else
        {
            for (int l = 0; l < n; l++)
            {
                while(compare(eq1,equipas[l].nome)==0)
                {
                    equipas[l].empates=equipas[l].empates+1;
                    equipas[l].pontos = equipas[l].pontos + 1;
                    equipas[l].marcados = equipas[l].marcados + p1;
                    equipas[l].sofridos = equipas[l].sofridos + p2;
                    break;
                }
            }
            for (int l = 0; l < n; l++)
            {
                while(compare(eq2,equipas[l].nome)==0)
                {
                    equipas[l].empates=equipas[l].empates+1;
                    equipas[l].pontos = equipas[l].pontos + 1;
                    equipas[l].marcados = equipas[l].marcados + p2;
                    equipas[l].sofridos = equipas[l].sofridos + p1;
                    break;
                }
            }
        }
    }
    int vencedor;

    vencedor = max(equipas, n);

    if (vencedor == -1)
    {
        printf("torneio sem vencedora\n");
    }

    else
    {
        printf("a vencedora foi %s, com %d ponto(s)\n", equipas[vencedor].nome, equipas[vencedor].pontos);
        printf("ganhou %d jogo(s), empatou %d jogo(s) e perdeu %d jogo(s)\n", equipas[vencedor].ganhos,
               equipas[vencedor].empates, equipas[vencedor].derrotas);
        printf("marcou %d golo(s) e sofreu %d golo(s)\n", equipas[vencedor].marcados, equipas[vencedor].sofridos);
    }
}

int main()
{
    int num_equipas, jogadas;
    scanf("%d %d", &num_equipas, &jogadas);
    jogo(num_equipas,jogadas);
    
    return 0;
}