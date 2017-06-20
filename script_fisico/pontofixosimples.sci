function [raiz,n] = pontofixosimples(fun,xo,es)
// [raiz,n] -> variaveis de saída
//    -> raiz procurada
//    -> n é o numero de iterações realizadas
// (fun,xl,es) -> variaveis de entrada
//      -> fun é a função desejada
//      -> xo é a aproximação inicial
//      -> es é o critério de parada
//Exemplo de Chamada
//exec ('path\pontofixosimples.sci',-1) {-1 não mostra o código de execução}
//fun = 'log(x) +x'
//[raiz,n]=pontofixosimples(fun,0.1,0.1)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

if argn(2) < 3 then
    es = 0.0001;
end

//inicialização de variaveis
ea = 100; n=0; maxi=50; x = xo;

//inicio do calculo
printf("Iteração\txi\t\t|Ea|%%\n");
while (ea>es) & (n<maxi) do
    xi = evstr(fun);
    
    if xi ~= 0 then
        ea = abs((xi - x)/xi)*100;
    end
    printf("%f\t%f\t%f\n",n,xi,ea);
        
    x = xi;
    n = n+1;
end

if n>= maxi then
    raiz = 'ERRO -> Divergiu';
else
    raiz = xi;
end

endfunction
