<<<<<<< HEAD
//exercicio 2
a = input (" Entre com o n° para calcular a raiz ");
x_old = input ("Entre com a extimativa da raiz");
n_sig = input ("Entre com o n° de algarismos significativos");
es = 0.005*10^(2-n_sig); //Condição de parada.
x_new = 0;

while 1 do
    x_new = (x_old + (a/x_old))/2
    erro = abs((x_new - x_old)/x_new);
   
    if (erro <= es) then
        break;
    end
    x_old = x_new;
end
printf ("A raiz Quadrada é %f", x_new);
=======
//exercicio 2
a = input (" Entre com o n° para calcular a raiz ");
x_old = input ("Entre com a extimativa da raiz");
n_sig = input ("Entre com o n° de algarismos significativos");
es = 0.005*10^(2-n_sig); //Condição de parada.
x_new = 0;

while 1 do
    x_new = (x_old + (a/x_old))/2
    erro = abs((x_new - x_old)/x_new);
   
    if (erro <= es) then
        break;
    end
    x_old = x_new;
end
printf ("A raiz Quadrada é %f", x_new);
>>>>>>> 16474bcf687295f9b7dcf95f69d0a5b3f70d9e9a
