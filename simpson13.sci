function I=simpson13(a,b,n,fun)
    //a - limite inferior de integração
    //b - limite superior de integração
    //n - N° de intervalos
    //n+1 - N° de pontos ou segmentos
    //fun - Função literal
    
    if (modulo(n,2)~=0) then
        error("O N° de intervalos não pode ser impar");
    end
    
    x=linspace(a,b,n+1)//espaço linear entre a e b com n pontos
    fx=evstr(fun)
    soma1=0; soma2=0;
    for i=2:2:n
        soma1 = soma1 + fx(i);
    end
    for i=3:2:n-1
        soma2 = soma2 + fx(i);
    end
    I = (b-a)*(fx(1) + 4*soma1 + 2*soma2 + fx(n+1)) / (3*n);
    
endfunction
