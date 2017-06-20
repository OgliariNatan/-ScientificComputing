function [a,r2] = reglinear(x,y)
// [fun,a0,a1] -> variaveis de saída
//    -> a0 é o coeficiente Linear
//    -> a1 é o coeficiente angular
//    -> r2 é o coeficiente e determinção
//      fun = a0 +a1*x
// (x,y) -> variaveis de entrada
//      -> x - dados da variavel independente
//      -> y - dados da variavel dependente
//Exemplo de Chamada
//exec ('path\reglinear.sci',-1) {-1 não mostra o código de execução}
//x = [1 2 5 7 9 21]
//y = [4 5 6 7 9 20]
//[a,r2]=reglinear(x,y)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

[mx,nx] = size(x);
[my,ny] = size(y);

if nx ~= ny then
    disp("Dados incompatíveis - Tamanho dos dados desiguais");
    error;
end

plot(x,y,'*');
xgrid;

disp("Digite:");
disp("<1> Para Ajuste - Por uma Reta");
disp("<2> Para Ajuste - Por uma Exponencial");
disp("<3> Para Ajuste - Por uma Potência Simples");
disp("<4> Para Ajuste - Por uma EQ. de taxa de crescimento saturado de ordem m");

op = input("-->");

if op == 1 then //Ajuste por uma reta
    [sum_x,sum_y,sum_x2,sum_y2,sum_xy,med_x,med_y] = calc(x,y,nx,ny)
    [a,r2] = coefs(nx,sum_x,sum_y,sum_xy,sum_x2,sum_y2,med_x,med_y);
    
    jota = linspace(x(1),x(nx));
    fun = a(1)+a(2).*jota;
    
elseif op == 2 then //Ajuste por uma Exponencial
    y = log(y);

    [sum_x,sum_y,sum_x2,sum_y2,sum_xy,med_x,med_y] = calc(x,y,nx,ny)
    [a,r2] = coefs(nx,sum_x,sum_y,sum_xy,sum_x2,sum_y2,med_x,med_y);
    
    alpha = exp(a(1));
    betha = a(2);
    
    jota = linspace(x(1),x(nx));
    fun = alpha*exp(betha.*jota);
    
elseif op == 3 then //Ajuste por uma Potencia Simples
    y = log(y);
    jota = linspace(x(1),x(nx));
    x = log(x);
    
    [sum_x,sum_y,sum_x2,sum_y2,sum_xy,med_x,med_y] = calc(x,y,nx,ny)
    [a,r2] = coefs(nx,sum_x,sum_y,sum_xy,sum_x2,sum_y2,med_x,med_y);
    
    alpha = 10^a(1);
    betha = a(2);
    
    fun = alpha.*jota^betha;
    
elseif op == 4 then //Ajuste por Taxa de crescimento - Ordem m
    m = input("Digite a Ordem de saturação <m>:")
    y = 1/y;
    jota = linspace(x(1),x(nx));
    x = (1/x)^m;
    
    [sum_x,sum_y,sum_x2,sum_y2,sum_xy,med_x,med_y] = calc(x,y,nx,ny)
    [a,r2] = coefs(nx,sum_x,sum_y,sum_xy,sum_x2,sum_y2,med_x,med_y);
        
    alpha = 1/a(1);
    betha = (alpha*a(2))^1/m;
    
    fun = alpha/(((betha^m) ./(jota.^m))+1)
//    fun = alpha.*(jota.^m) ./ ((betha^m).+(jota.^m));
end

plot(jota,fun,'red');
endfunction

function [a,r2] = coefs(nx,sum_x,sum_y,sum_xy,sum_x2,sum_y2,med_x,med_y)
    a(2) = ((nx*sum_xy)-(sum_x*sum_y))/((nx*sum_x2)-(sum_x^2)); //Coeficiente Angular
    a(1) = (med_y-(a(2)*med_x));                                //Coeficiente Linear
    r2 = ((nx*sum_xy-sum_x*sum_y)/(sqrt(nx*sum_x2-sum_x^2)*sqrt(nx*sum_y2-sum_y^2)))^2;
endfunction

function [sum_x,sum_y,sum_x2,sum_y2,sum_xy,med_x,med_y] = calc(x,y,nx,ny)
    sum_x = sum(x);
    sum_y = sum(y);
    sum_x2 = sum(x.^2);
    sum_y2 = sum(y.^2);
    sum_xy = sum(x.*y);
    med_x = sum_x/nx;
    med_y = sum_y/ny;
endfunction
