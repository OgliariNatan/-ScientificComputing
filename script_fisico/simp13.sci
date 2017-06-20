function [I_simp13, Ea] = simp13(fun,a,b,n)
// Integração Numérica utilizando a Regra de 1/3 de Simpsom (Newton-Cotes)
// Onde -> I_simp13 é o valor da integral definida pela função e o intervalo
//---------------------------------------------------------------------
//    -> fun é a função a ser integrada
//    -> a é o limite inferior de integração
//    -> b é o limite superior de integração
//    -> n é o numero de segmentos (intervalos) para a integração
//######################################################################
//Exemplo de Chamada
//exec ('path\simp13.sci',-1) {-1 não mostra o código de execução}

//fun = '0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5'
//[I_simp13, Ea] = simp13(fun,0,0.8,4)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//Verificação de integridade
par = modulo(n,2);
if par ~=0 then
    error("Regra de 1/3 de Simpsom somente para intervalos pares");
end

//Valores da imagem em cada ponto
h = (b-a)/n;
x = a;
f(1) = evstr(fun);
for i = 2:n+1
    x = x+h;                 //Atualiza Valor de x <-- a + h
    f(i) = evstr(fun);
//    disp(f(i))
end

S4 = 0;
for i = 2:2:n
    S4 = S4 + f(i);
end

S2 = 0;
for i = 3:2:n
    S2 = S2 + f(i);
end

I_simp13 = ((b-a)/(3*n))*(f(1)+(4*S4)+(2*S2)+f(n+1));       //Regra de 1/3 de Simpson

//Calculo do Erro verdadeiro Absoluto
Vr = integrate(fun,'x',a,b);
Ea = (Vr - I_simp13)/Vr;

endfunction
