//precisão simples
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main()
{
    float a = 1, b = 3000.001, c = 3, x1, x2, delta;

    delta = sqrt(b*b - 4*a*c);
    x1 = (-b + (delta))/2*a;
    x2 = (-b - (delta))/2*a;
    printf("O valor da 1° raiz vale: %.3f\n O Valor da 2° raiz vale: %.3f\n",x1, x2);

    x1 = (-2*c) / (b + (delta));
    x2 = (-2*c) / (b - (delta));
    printf("\n\n\nO valor da 1° raiz vale: %.3f\n O Valor da 2° raiz vale: %.3f\n",x1, x2);

    return 0;
}
