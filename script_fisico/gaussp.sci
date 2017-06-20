function x = gaussp(A,b)
// Eliminicação de Gauus com pivotamento [Cap5 - Slide 1..15]
// Onde x é o vetor solução
//    -> A é a matriz de coeficientes do sistema
//    -> b é o vetor coluna dos estimulos (resultados do sistema)
//Exemplo de Chamada
//exec ('path\gaussp.sci',-1) {-1 não mostra o código de execução}
//A = [10 2 -1; -3 -5 2; 1 1 6];
//b = [27; -61.5; -21.5]
//x = gaussp(A,b)
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
SIS = [A b]; //Gera uma matriz A com uma coluna adjacente b

n = n+1;

// Eliminação Progressiva
for i = 1:m-1           //Varredura iniciando pelo primeiro pivo (Varre as Colunas)
    //Pivotamento Parcial
    [maior,k]=max(abs(SIS(i:m,i))); //maior é o numero... k é o indice
    l = i + (k-1);                  //Ajusta o indice ao novo tamanho da matriz
    if l~=i then                    //Se o maior naum estiver na linha de analise troca
        SIS([l,i],:) = SIS([i,l],:);    //Troca uma linha por outra
    end
    for j = i+1:m       //Varredura para diagonalizar a partir do pivo
        GAMA = SIS(j,i)/SIS(i,i); //Pivo é o SIS(i,i)
        //PRIMEIRA POSSIBILIDADE
        //for k = i:n
        //    SIS(j,k) = SIS(j,k) - GAMA*SIS(i,k)        //Operação Elemento-a-Elemento
        //end
        
        //SEGUNDA POSSIBILIDADE - (For implicito -- variando 'k')
        SIS(j,i:n) = SIS(j,i:n) - GAMA*SIS(i,i:n)        //Operação Elemento-a-Elemento [for implicito]

        disp(SIS);//DEBUG
    end
end

// Substituição Regressiva
x = zeros(m,1);             //Cria um vetor coluna com zeros
x(m) = SIS(m,n)/SIS(m,m);   //Solução da última solução, Será a base para o calculo das proximas soluções

for i = m-1:-1:1            //para o calculo das demais soluções
    x(i) = (SIS(i,n) - SIS(i,(i+1):m)*x((i+1):m))/SIS(i,i) //Calculo do vetor solução [com somatorio implicito]
end
endfunction
