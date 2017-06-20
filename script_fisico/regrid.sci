function [fun,a0,a1] = regrid(x,y)
// [fun,a0,a1] -> variaveis de saída
//    -> fun é a função linearizada
//    -> a0 é o coeficiente Linear
//    -> a1 é o coeficiente angular
//      fun = a0 +a1*x
// (x,y) -> variaveis de entrada
//      -> x - dados da variavel independente
//      -> y - dados da variavel dependente
//Exemplo de Chamada
//exec ('path\regrid.sci',-1) {-1 não mostra o código de execução}
//x = [1 2 5 7 9 21]
//y = [4 5 6 7 9 20]
//[fun,a,b]=regrid(x,y)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

[mx,nx] = size(x);
[my,ny] = size(y);

plot(x,y,'*');
xgrid;

sum_x = sum(x);
sum_y = sum(y);
sum_x2 = sum(x.^2);
sum_y2 = sum(y.^2);
sum_xy = sum(x.*y);

med_x = sum_x/nx;
med_y = sum_y/ny;

a1 = ((nx*sum_xy)-(sum_x*sum_y))/((nx*sum_x2)-(sum_x^2));
a0 = (med_y-(a1*med_x));

jota = linspace(x(1),x(nx));
fun = a0+a1.*jota;

plot(jota,fun,'red');

endfunction
