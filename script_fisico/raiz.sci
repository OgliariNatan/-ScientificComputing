function [x]=raiz(a, n_sig)
//Cálculo de Raiz Quadrada pelo método Babilonia
//function x=raiz(a, n_sig); 
//Onde  x é a raiz de 'a'
//      n_sig é o número de alg. sig. da resposta - 'opcional'
//exemplo de chamada
// x=raiz(5,4)
    
if argn(2) < 2 then // argn(2) retorna o no de args de entrada
    n_sig = 3;
end

//Criterio de Parada
Es = 0.005*10^(2-n_sig); //inicaliza em 0.005 pois já considerou-se o percentual, ou seja, 0.5*100

//inicializações
x = 1; x_old = 1;

//impressão inicial
printf("Termo    Erro %%\n");

while 1 do
    x = (x + a/x)/2;
    erro = abs((x - x_old)/x);
    printf("%f %f\n", x, erro*100);
    if (erro <= Es)
        break;
    end
    x_old = x;
end
endfunction
