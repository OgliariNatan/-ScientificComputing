function [raiz,n] = new_raphson(fun,dx,es,maxi)
// [raiz,n] -> variaveis de saída
//    -> raiz procurada
//    -> n é o numero de iterações realizadas
// (fun,dx,es,maxi) -> variaveis de entrada
//      -> fun é a função desejada
//      -> dx é a derivada da função
//      -> es é o critério de parada
//      -> maxi é o limite de iteração
//Exemplo de Chamada
//exec ('path\new_raphson.sci',-1) {-1 não mostra o código de execução}
//fun = 'log(x) + x'
//dxdt = '(1/x) + 1'
//[raiz,n]=new_raphson(fun,0.1,0.1)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//construção do gráfico para estimar o valor inicial
a = input("Entre com o limite inferior de x: ");
b = input("Entre com o limite superior de x: ");
x = linspace(a,b,100);

fx = evstr(fun);
plot(x,fx);
xgrid;

//entrada do valor inicial
xo = input("Entre com a aproximação inicial da raiz: ");

if argn(2) < 4 then
    maxi = 50;
    if argn(2) < 3 then
        es = 0.0001;
    end
end

//inicialização de variaveis
ea = 100; n=0; x = xo;

//inicio do calculo
printf("Iteração\txi\t\t|Ea|%%\n");

while (ea>es) & (n<maxi) do
    fxi = evstr(fun);
    dxi = evstr(dx);
    
    xi = x-fxi/dxi;
    
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
