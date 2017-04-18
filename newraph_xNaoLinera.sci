//método de Newton-Raphson_x Não linear
function [x,n] = newraph_x(func,jac,es,maxi)
    //calculo das raizes não lineares
    //clear;
    //func= é o vetor de matriz na forma literal
    //jac = é a matriz jacobiana na forma literal
    //es é o criterio de parada
    //maxi é o numero maximo de iteração
    //contrução do grafico
    //func = '[x(1)^2+x(1)*x(2)-10; x(2)+3*x(1)*x(2)^2-57]'
    //jac = '[2*x(1)+x(2) x(1); 3*x(2)^2 1+6*x(1)*x(2)]'
    //[x,n] = newraph_x(func,jac,0.1,50)
    
    //inicialização
    x0 = input ("Entre com o valor de x0 inicial:");
    n=0; x = x0;
    ea= 100; n=0; 
    if argn(2)<3 then
        es=0.0001;
    end
    if argn(2)<4 then
        maxi = 50;
    end
    //inincia o processo interativo para sistemas não lineares x_i+1 = x_1 -j\f
    while (ea>es) & (n<=maxi) do
        f = evstr(func);
        j = evstr(jac);
        y = j\f;
        xi = x-y;
        n=n+1;
        
        if xi~=0 then 
            ea=max(abs(y./xi))*100;
        end
        x=xi;
    end
    
    if n>maxi then
       raiz = 'divergiu';
    else
        raiz = xi; 
    end
    endfunction
