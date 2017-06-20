function x = inversa(A)
// Calculo da matriz inversa com uma fatoração LU [Capítulo 10 - pg245]
// Onde x é a matriz inversa
//    -> A é a matriz de coeficientes do sistema
//Exemplo de Chamada
//exec ('path\fatoralu.sci',-1) {-1 não mostra o código de execução}
//A = [10 2 -1; -3 -5 2; 1 1 6];
//x = inversa(A)
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

P = eye(n,n);

// Eliminação Progressiva
for i = 1:n-1           //Varredura iniciando pelo primeiro pivo (Varre as Colunas)
    //Pivotamento Parcial
    [maior,k]=max(abs(A(i:n,i))); //maior é o numero... k é o indice
    l = i + (k-1);                  //Ajusta o indice ao novo tamanho da matriz
    if l~=i then                    //Se o maior naum estiver na linha de analise troca
        A([l,i],:) = A([i,l],:);    //Troca uma linha por outra
        P([l,i],:) = P([i,l],:);    //Troca uma linha por outra
    end
    for j = i+1:n       //Varredura para diagonalizar a partir do pivo
        
        temp = A(j,i)/A(i,i); //Calculo do L21, L31....
        
        A(j,i:n) = A(j,i:n) - temp*A(i,i:n);
        A(j,i) = temp;
    end
end
disp(A,'U');
disp(P,'P');

B = eye(n,n);

//Substituição Progressiva
b = P*b;
d(1) = b(1);

for i = 2:n
    d(i) = b(i) - (A(i,1:(i-1))*d(1:(i-1)));
end
disp(d,'d')

//Substituição Regressiva
x = zeros(n,1);
x(n) = d(n)/A(n,n);

for i =n-1:-1:1
    // resolvendo com 'for' implicito'
    x(i) = (d(i)-A(i,(i+1):n)*x((i+1):n))/A(i,i);
end

endfunction
