function I=trap(a,b,n,fun)
    //a - limite inferior de integração
    //b - limite superior de integração
    //n - N° de intervalos
    //n+1 - N° de pontos ou segmentos
    //fun - Função literal
    
    x=linspace(a,b,n+1)//espaço linear entre a e b com n pontos
    fx=evstr(fun)
    soma=0;
    for i=2:n
        soma = soma + fx(i);
    end
    I = (b-a)*(fx(1) + 2 * soma + fx(n+1)) / (2*n);
    
endfunction
