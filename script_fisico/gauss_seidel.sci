function [x, iter] = gauss_seidel(A,b,lam,es,maxi)
// Método de Gauss-Seidel (interativo)
// Onde -> x é o vetor solução
//      -> iter é o numero de iterações 
//-----------------------
//    -> A é a matriz de coeficientes do sistema
//    -> b é o vetor coluna dos estimulos (resultados do sistema)
//    -> lam é o fator de relaxamento [0<lam<1 'sub-amortecido' e 1<lam<2 sobre-relaxamento]
//    -> es é o criterio de parada
//    -> maxi é o numero maximo de iterações permitidos
//######################################################################
//Exemplo de Chamada
//exec ('path\gauss_seidel.sci',-1) {-1 não mostra o código de execução}
//A = [10 2 -1; -3 -5 2; 1 1 6];
//b = [27; -61.5; -21.5];
//lam = 1.3;
//es = 0.001;
//maxi = 50;
//[x, iter] = gauss_seidel(A,b,lam,es,maxi)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//checando os dados de entrada (matriz deve ser quadrada)
[m,n] = size(A); //m é linha... n é coluna
if m~=n then
    error("A Matriz de coeficientes deve ser quadrada");
end

[mb,nb]=size(b);
if m ~=mb then
    error("O vetor de estimulos(Resultados) deve ser da ordem da matriz")
end

// Verificando argumentos de entrada e atribuindo padrões
if argn(2) < 5 then
    maxi = 50;
    if argn(2) < 4 then
        es = 0.00001;
        if argn(2) < 3 then
            lam = 1;
        end
    end
end

//gerando a matriz 'd' (vai ser a matriz 'b' modificada) e 'C' (vai ser a matriz 'A' modificada)
for i = 1:n
    for j = 1:n
        if i==j then
            b(i) = b(i)/A(i,i);
            x(i) = 0
        else
            A(i,j) = A(i,j)/A(i,i);
        end
    end
    A(i,i) = 0;
end
disp(b,'b');
disp(A,'A');

//inicialização de variaveis
ea = 100; iter =0;

//inicio do calculo
while (1) do
    for i = 1:n
        x_old = x(i);
        x(i) = b(i) - A(i,:)*x(:);
        
        //Correção do relaxamento 
        x(i) = lam*x(i) + (1-lam)*x_old;
        
        //Calculo do erro abs
        ea(i) = abs((x(i) - x_old)/x(i))*100;
    end
    
    iter = iter + 1;
    disp(x);
    
    // Verificando criterios de parada
    if (max(ea) <= es | iter==maxi ) then
        break;
    end
end
endfunction
