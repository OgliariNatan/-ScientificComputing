//método de Newton-Raphson
function [raiz,n] = new_raphson(func,der,es,maxi)
    //clear;
    //func= 'log(x)=x'
    //der= '(1/x)+1'
    //x0 é a condição inicial
    //es é o criterio de parada
    //func = sen(sqrt(x))
    //contrução do grafico
    clf;
    a=input("Entre com o limite inferior de abscissa:");
    b=input("Entre com o limite superior de abscissa:");
    x=linspace(a,b,100);
    f=evstr(func);
    plot (x,f);
    xgrid;
    
    
    //inicialização
    x = input ("Entre com o valor de x inicial:");
    ea= 100; i=0; 
    if argn(2)<3 then
        es=0.0001;
        maxi = 50;
    end
    if argn(2)<4 then
        maxi = 50;
    end
    //inincia o processo interativo
    while ea > es & i <=maxi do
        
        if evstr(der)~=0 then
        x_new = x - (evstr(func)/evstr(der));
    else
        error('Derivada nula');
        end 
        
        if x_new~=0 then
            ea=abs((x_new-x)/x_new*100);
        end
        i=i+1;
        printf("%d\t %f\t %f\n", i,ea,x_new);
        x=x_new;
    end
    raiz=x_new;
    n=i; 
    
    endfunction
