#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define SIZE 2000003

// Hash table do site mas adaptada ao exercicio feito: https://www.tutorialspoint.com/data_structures_algorithms/hash_table_program_in_c.htm
struct Hash {
    int s1;
    int s2;
    bool ligacao;
};

struct Hash *hashArray[SIZE] = {NULL};

int hashkey(int s1, int s2) {
    int key = s1*100+s2*10;
    return key % SIZE;
}

int search(int s1, int s2)
{
    int aux = hashkey(s1,s2);
    while(hashArray[aux]!= NULL)
    {
        if (hashArray[aux]->s1 == s1 && hashArray[aux]->s2 == s2 && hashArray[aux]->ligacao == true)
        {
            return aux;
        }
        aux++;
    }
    return -1;
}

void insert(int s1,int s2) {

    struct Hash *item = (struct Hash*) malloc(sizeof(struct Hash));
    item->s1 = s1;
    item->s2 = s2;
    item->ligacao = true;

    int hashIndex = hashkey(s1,s2);
    while(hashArray[hashIndex] != NULL) {
        if (hashArray[hashIndex]->ligacao == false)
        {
            break;
        }
        ++hashIndex;
    }

    hashArray[hashIndex] = item;
}

void delete(int s1, int s2)
{
    int hashIndex = search(s1,s2);
    if(hashIndex != -1)
        hashArray[hashIndex]->ligacao = false;

}
int main()
{
    int tm;
    scanf("%d",&tm);
    getchar();
    char op;
    while(scanf("%s",&op)!=EOF)
    {
        int s1,s2;
        int connections;
        int first,from,to,last;
        int yes_counter;
        switch(op)
        {
            case '+':
                scanf("%d %d",&s1,&s2);
                insert(s1,s2);
                break;
            case '-':
                scanf("%d %d",&s1,&s2);
                delete(s1,s2);
                break;
            case '?':
                yes_counter = 0;
                scanf("%d", &connections);
                scanf("%d", &from);
                first = from;
                for (int i = 0; i < connections; i++) {

                    scanf("%d", &to);
                    if(search(from, to) != -1)
                        yes_counter++;
                    from = to;
                }
                last = to;
                if (yes_counter == connections)
                    printf("yes [%d..%d]\n", first, last);
                else
                    printf("no [%d..%d]\n", first, last);
                break;
        }
    }
    return 0;
}