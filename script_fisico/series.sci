function [fx,term]=series(fun, x, n_sig)
// Cálculo de funções com serie de potências
// function [fx,term]=series(funcao, x, n_sig)
// onde fx é o valor da função em x
    // term é o número de termos usados para o erro especificado
    // fun é a função de entrada literal em x e n
    // onde n é o numero do termo
    // n_sig é o numero de alg. sign. da resposta - opcional
// Exemplo de chamada:
// exec('path\series.sci',-1)
// fun ='x^n/factorial(n)'
// [fx,term]=series(fun, 5, 3)
// COSSENO --> fun='(-1^n)*(x^(2*n))/factorial(2^n)'

if argn(2) < 3 then // argn(2) retorna o no de args de entrada
    n_sig = 3;
end

//Criterio de Parada
Es = 0.005*10^(2-n_sig); //inicaliza em 0.005 pois já considerou-se o percentual, ou seja, 0.5*100

//inicializações
fx = 0; n = 0; fx_old = 0;

//impressão inicial
printf("Termo    fx       Erro %%\n");

while 1 do
    fx = fx + evstr(fun);
    erro = abs((fx - fx_old)/fx);
    printf("%f %f %f\n",n+1, fx, erro*100);
    if (erro <= Es)
        break;
    end
    fx_old = fx;
    n = n+1;
end
    term = n+1;
endfunction

