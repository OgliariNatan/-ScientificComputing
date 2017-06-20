function ye = pi_new(x,y,xe)
// ye -> Valor do interpolado da Variavel Idependente
// (x,y,xe) -> variaveis de entrada
//    -> x é o vetor de valores da Variavel Dependente
//    -> y é o vetor de valores da Variavel Independente
//    -> xe é o ponto de avalição do Polinônio Interpolador
//Exemplo de Chamada
//exec ('path\pi_new.sci',-1) {-1 não mostra o código de execução}
//x = [1 2 5 7 9 21]
//y = [4 5 6 7 9 20]
//ye=pi_new(x,y,xe)
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

[mx,nx] = size(x); // --> lenght(x)
[my,ny] = size(y); // --> lenght(y)

if nx ~= ny then
    disp("Dados incompatíveis - Tamanho dos dados desiguais");
    error("x e y devem ter a mesma dimensão");
end

b = y;

//Encontrando os termos do polinomio de Newtom
// f(n-1) = b1+b2(x-x1)+...+bn(x-x1)(x-x2)...(x-xn)
for i = 2:nx
    for j = nx:-1:i
        b(j) = (b(j)-b(j-1))/(x(j)-x(j-(i-1))); //
    end
end
disp(b,"Termos de b -->");

//Avaliando o ponto no polinomio interpolador
ye = 0;
for i = nx:-1:1
    jota = 1;
    for j = 1:i-1
        jota = jota*(xe-x(j));
    end
    ye = ye + jota*b(i);
end
endfunction
