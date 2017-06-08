//
//  Autor: Jonas Vieira de Souza
//
//  TODO: Interpolador de Lagrange
//  Exemplo de chamada:
//  $$ exec( caminho + 'interpolador_lagrange.sci', -1 );
//  $$ x [1 2 5 7 9 21];
//  $$ y [4 5 6 7 9 20];
//  $$ pa = 15; 
//  $$ [ vi ] = interpolador_lagrange( x, y, pa );
//
//  Retornos:
//  $$ vi   $$ variavel independente do interpolado
//
//  Argumentos:
//  $$ _x   $$ vetor de valores da Variavel Dependente
//  $$ _y   $$ vetor de valores da Variavel Independente
//  $$ _pa  $$ ponto de avalição do Polinônio Interpolador
//

function vi = interpolador_lagrange( _x, _y, _pa )    
    //Sendo o tamanho dos vectores correspondentes a ordem+1 de lagranje
    [ mx, nx ] = size(_x);
    [ my, ny ] = size(_y);    
    if nx ~= ny then
        disp("Dados incompatíveis - Tamanho dos dados desiguais");
        error("x e y devem ter a mesma dimensão");
    end    
    // Termos do Polinomio interpolador de Lagrange
    for i = 1:nx
        L(i) = 1;
        for j = 1:nx
            if j ~= i then
                L(i) = L(i)*((_pa-_x(j))/(_x(i)-_x(j)))
            end
        end
        printf("L(%d) = %.4f\n",i,L(i));
        // Olhar Slide 13 (pg 35) - Esta Devolvendo o Polinomio.
    end    
    //Avaliando o ponto no polinomio interpolador de Lagrange
    vi = 0;
    for i = 1:nx
        printf("L(%d)*y(%d) = %.4f\n",i,i,(L(i)*_y(i)));
        vi = vi + (L(i)*_y(i))
    end
endfunction
