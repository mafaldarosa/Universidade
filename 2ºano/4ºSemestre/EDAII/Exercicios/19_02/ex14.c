#include <stdio.h>
int main(void)
{
    int n;
    scanf("%d",&n);
    printf("%d\n",n);

    int a,b;
    scanf("%d + %d =",&a,&b);
    printf("%d\n",(a+b));

    float p;
    scanf("%f",&p);
    printf("%f\n",p);

    float c,d;
    scanf(" (%f,%f)",&c,&d);
    printf("(%.3f,%.3f)\n",c,d);

    return 0;
}