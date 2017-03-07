//método da sacante
function [raiz,n] = secante(func,delta,es,maxi)
    //clear;
    //func= 'log(x)=x'
    //delta e a pertubação 
    //maxi o numero maximo de interção
    //es é o criterio de parada
    //func = sen(sqrt(x))
    //contrução do grafico
    clf;//limpa o grafico
    a=input("Entre com o limite inferior de abscissa:");
    b=input("Entre com o limite superior de abscissa:");
    x=linspace(a,b,100);
    f=evstr(func);
    plot (x,f);
    xgrid;
    
    
    //inicialização
    x = input ("Entre com o valor de x inicial:");
    ea= 100; i=0; 
     if argn(2)<2 then
        delta = 1d-6;
    end
    if argn(2)<3 then
        es=0.0001;
    end
    if argn(2)<4 then
        maxi = 50;
    end
   
    //inincia o processo interativo
    while ea > es & i <=maxi do
        fxi = evstr(func);
        x = x + delta;
        fxi_1 = evstr(func);
        //formula da secante
        x_new = (x-delta) - (fxi*delta)/(fxi_1-fxi);
                
        if x_new~=0 then
            ea=abs((x_new-x)/x_new)*100;
        end
        i=i+1;
        printf("%d\t %f\t %f\n", i,ea,x_new);    
        x=x_new;
        
    end
    raiz=x_new;
    n=i; 
    
    endfunction
