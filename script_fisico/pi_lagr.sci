function ye = pi_lagr(x,y,xe)
// ye -> Valor do resultado
// (x,y,xe) -> variaveis de entrada
//    -> x é o vetor de valores da Variavel Dependente
//    -> y é o vetor de valores da Variavel Independente
//    -> xe é o ponte de avalição do Polinônio Interpolador
//Exemplo de Chamada
//exec ('path\pi_lagr.sci',-1) {-1 não mostra o código de execução}
//x = [1 2 5 7 9 21]
//y = [4 5 6 7 9 20]
//ye=pi_lagr(x,y,xe)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

[mx,nx] = size(x); // --> lenght(x)
[my,ny] = size(y); // --> lenght(y)

if nx ~= ny then
    disp("Dados incompatíveis - Tamanho dos dados desiguais");
    error("x e y devem ter a mesma dimensão");
end

// Termos do Polinomio interpolador de Lagrange
for i = 1:nx
    L(i) = 1;
    for j = 1:nx
        if j ~= i then
            L(i) = L(i)*((xe-x(j))/(x(i)-x(j)))
        end
    end
    printf("L(%d) = %.4f\n",i,L(i));
    // Olhar Slide 13 (pg 35) - Esta Devolvendo o Polinomio.
end

//Avaliando o ponto no polinomio interpolador de Lagrange
ye = 0;
for i = 1:nx
    printf("L(%d)*y(%d) = %.4f\n",i,i,(L(i)*y(i)));
    ye = ye + (L(i)*y(i))
end
endfunction
