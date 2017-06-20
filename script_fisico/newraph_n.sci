function [x, iter] = newraph_n(fun,jac,es,maxi)
// Método de Newton Raphson para N equações (interativo) - Sistemas de Equações não lineares
// Onde -> x é o vetor solução
//      -> iter é o numero de iterações 
//---------------------------------------------------------------------
//    -> fun é o vetor de funções do sistema
//    -> jac é Matriz Jacobiana do Sistema(Derivadas Parciais das equações)
//    -> es é o critério de parada
//    -> maxi é o limite de iteração
//######################################################################
//Exemplo de Chamada
//exec ('path\newraph_n.sci',-1) {-1 não mostra o código de execução}

//fun = '[x(1)^2+x(1)*x(2)-10; x(2)+3*x(1)*x(2)^2-57]';
//jac = '[2*x(1)+x(2) x(1); 3*x(2)^2 1+6*x(1)*x(2)]';
//es = 0.00001;
//maxi = 50;
//[x, iter] = newraph_n(fun,jac[,es,maxi])
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//Inicializações
if argn(2) < 4 then
    maxi = 50;
    if argn(2) < 3 then
        es = 0.0001;
    end
end

//checando os dados de entrada (matriz deve ser quadrada)
//[mf,nf] = size(jac); //m é linha... n é coluna
//if mf~=nf then
//    error("A Matriz de funções deve ser quadrada");
//end

//[mj,nj] = size(jac); //m é linha... n é coluna
//if mj~=nj then
//    error("A Matriz Jacobiana deve ser quadrada");
//end

//Entrada dos valores iniciais
x = input("Entre com as aproximações iniciais = ");
i = 0; ea = 100;

//inicio do calculo
while  ea>es &  i<maxi then
    f = evstr(fun);
    J = evstr(jac);
//    disp(J);
//    disp(f);
    //Pode ser substituido por uma funções elaborada em aula como: gaussp/gaussi/gauss_seidel
    y = J\f;
//    disp(y);
    //Eq. do Método Newton-Raphson
    //[J]{x(i+1) = -{f}+[J]{x(i)}
    //Resulta em:
    //x = x - J\f
    xi = x - y;
    
    if xi ~= 0 then
        //ea = abs((xi - x)/xi)*100; sendo y = xi - x
        ea = max(abs(y./xi))*100;
    end
    
    x = xi; 
    i = i+1;
end

if i == maxi then
    x = 'ERRO ---> DIVERGIU';
end

iter = i;

endfunction
