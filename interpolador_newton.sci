//
//  Autor: Jonas Vieira de Souza
//
//  TODO: Função para ajuste de curvas por regressão linear
//  Exemplo de chamada:
//  $$ exec( caminho + 'regressao_linear.sci', -1 );
//  $$ x [1 2 5 7 9 21];
//  $$ y [4 5 6 7 9 20];
//  $$ [ vi ] = interpolador_newton( x, y );
//
//  Retornos:
//  $$ vi   $$ variavel independente do interpolado
//
//  Argumentos:
//  $$ _x   $$ vetor de valores da Variavel Dependente
//  $$ _y   $$ vetor de valores da Variavel Independente
//  $$ _pa  $$ ponto de avalição do Polinônio Interpolador
//
clc
function v_indep = interpolador_newton( _x, _y, _pa )
    [ mx, nx ] = size(_x);
    [ my, ny ] = size(_y);
    if nx ~= ny then
        disp("Dados incompatíveis - Tamanho dos dados desiguais");
        error("x e y devem ter a mesma dimensão");
    end
    b = _y;
    //Encontrando os termos do polinomio de Newtom
    // f(n-1) = b1+b2(x-x1)+...+bn(x-x1)(x-x2)...(x-xn)
    for i = 2:nx
        for j = nx:-1:i
            b(j) = (b(j)-b(j-1))/(_x(j)-_x(j-(i-1))); //
        end
    end
    disp(b,"Termos de b -->");    
    //Avaliando o ponto no polinomio interpolador
    v_indep = 0;
    for i = nx:-1:1
        jota = 1;
        for j = 1:i-1
            jota = jota*(_pa-_x(j));
        end
        v_indep = v_indep + jota*b(i);
    end
endfunction
