function [raiz,n] = bissecao(fun,xl,xu,es)
// [raiz,n] -> variaveis de saída
//    -> raiz procurada
//    -> n é o numero de iterações realizadas
// (fun,xl,xu,es) -> variaveis de entrada
//      -> fun é a função desejada
//      -> xl é o limite inferior do intervalo de busca
//      -> xu é o limite superior do intervalo de busca
//      -> es é o critério de parada
//Exemplo de Chamada
//exec ('path\bissecao.sci',-1) {-1 não mostra o código de execução}
//fun = 'log(x) +x'
//[raiz,n]=bissecao(fun,0.1,2,0.1)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

// Verificação se existe raizes no intervalo
x = xu;
fu = evstr(fun);

x = xl;
fl = evstr(fun);

if fu*fl>0 then
    raiz = "Não há Raizes no intervalo fornecido";
    n = 0;
else
    if argn(2) < 4 then
        es = 0.0001;
    end
    
    //inicialização de variaveis
    ea = 100; xr_novo = xl; n=0;
    
    //inicio do calculo
    printf("Iteração\tErro\n");
    while ea > es do
        xr_velho = xr_novo;
        xr_novo = (xl+xu)/2;
        if xr_novo ~= 0 then
            ea = abs((xr_novo - xr_velho)/xr_novo)*100;
        end
        printf("%d\t\t%f\n",n,ea);
        
        x = xr_novo;
        fr = evstr(fun);
        
        x = xl;
        fl = evstr(fun);
        
        if fl*fr>0 then
            xl = xr_novo;
        else
            xu = xr_novo;
        end
        
        n = n+1;
    end
    raiz = xr_novo;
end
endfunction
