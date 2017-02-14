
//exercicio 1
function [fx,term]=series(fun, x, n_sig)
// Cálculo de funções com serie de potências
// function [fx,term]=series(funcao, x, n_sig)
// onde fx é o valor da função em x
//     term é o número de termos usados para o erro especificado
//     fun é a função de entrada literal em x e n
//     onde n é o numero do termo
// n_sig é o numero de alg. sign. da resposta - opcional
// Exemplo de chamada:
// exec('path\series.sci',-1)
// fun ='(-1)^n * x^(2*n)/factorial(2*n)'
// [fx,term]=series(fun, %pi/6, 3)
//
if argn(2) < 3 then // argn(2) retorna o no de args de entrada
n_sig = 3;
end
es = 0.005*10^(2-n_sig); //Condição de parada
fx_old = 0;
fx = 0;
n = 0;
printf ("Termo     fx     erro%%\n");

while 1 do
    fx = fx + evstr(fun);
    erro = abs((fx - fx_old)/fx);
    printf("%f  %f %f \n", n+1, fx, erro*100);
    if (erro <= es) then
        break;
    end
    fx_old = fx;
    n = n + 1;
end

term = n+1;
endfunction
