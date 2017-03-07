//exercicio de iteração com ponto fixo
function [raiz,n] = simples(func,x0,es)
    //n é o numero de interações
    //x0 é a condição inicial
    //es é o criterio de parada
    //func = sen(sqrt(x))
    //inicialização
    ea= 100; x=x0; i=0;
    if argn(2)<3 then
        es=0.0001;
    end
    //inincia o processo interativo
    while ea > es & i <=50 do
        x_new = evstr(func);
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
