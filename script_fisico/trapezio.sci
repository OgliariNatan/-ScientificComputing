function [I_trap, Ea] = trapezio(fun,a,b,n)
// Integração Numérica utilizando a Regra do trapezio para multiplos pontos
// Onde -> I_trap é o valor da integral definida pela função e o intervalo
//---------------------------------------------------------------------
//    -> fun é a função a ser integrada
//    -> a é o limite inferior de integração
//    -> b é o limite superior de integração
//    -> n é o numero de segmentos (intervalos) para a integração
//######################################################################
//Exemplo de Chamada
//exec ('path\trapezio.sci',-1) {-1 não mostra o código de execução}

//fun = '0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5'
//[I_trap, Ea] = trapezio(fun,0,0.8,4)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//Valores da imagem em cada ponto
h = (b-a)/n;
x = a;
f(1) = evstr(fun);
for i = 2:n+1
    x = x+h;                 //Atualiza Valor de x <-- a + h
    f(i) = evstr(fun);
//    disp(f(i))
end

S = 0;
for i = 2:n
    S = S + f(i);
end

I_trap = (h/2)*(f(1)+(2*S)+f(n+1));     //Regra do Trapézio

//Calculo do Erro verdadeiro Absoluto
Vr = integrate(fun,'x',a,b);
Ea = (Vr - I_trap)/Vr;

endfunction
