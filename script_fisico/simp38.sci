function [I_simp38, Ea] = simp38(fun,a,b,n)
// Integração Numérica utilizando a Regra de 3/8 de Simpsom (Newton-Cotes)
// Onde -> I_simp38 é o valor da integral definida pela função e o intervalo
//---------------------------------------------------------------------
//    -> fun é a função a ser integrada
//    -> a é o limite inferior de integração
//    -> b é o limite superior de integração
//    -> n é o numero de segmentos (intervalos) para a integração
//######################################################################
//Exemplo de Chamada
//exec ('path\simp38.sci',-1) {-1 não mostra o código de execução}

//fun = '0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5'
//[I_simp38, Ea] = simp38(fun,0,0.8,4)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//Verificação de integridade
par = modulo(n,3);
if par ~=0 then
    error("Regra de 3/8 de Simpsom somente para intervalos Impares Multiplos de 3");
end

//Valores da imagem em cada ponto
h = (b-a)/n;
x = a;
f(1) = evstr(fun);
for i = 2:n+1
    x = x+h;                 //Atualiza Valor de x <-- a + h
    f(i) = evstr(fun);
//    printf("f(%d) = %.4f\n",i,f(i));
end

S3 = 0;
j = 1;
for i = 2:n
    if j < 3 then
        S3 = S3 + f(i);
//        printf("S3(%d) --> %.4f\n",i,S3);
    else
        j = 0;
    end
    j = j+1;
end

S2 = 0;
for i = 4:3:n
    S2 = S2 + f(i);
//    printf("S2(%d) --> %.4f\n",i,S2);
end

I_simp38 = (3*(b-a))*(f(1)+(3*S3)+(2*S2)+f(n+1))/(8*n);      //regra de 3/8 de Simpsom

//Calculo do Erro verdadeiro Absoluto
Vr = integrate(fun,'x',a,b);
Ea = (Vr - I_simp38)/Vr;

endfunction
