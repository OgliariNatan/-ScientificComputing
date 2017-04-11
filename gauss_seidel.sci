function [x,iter] = gauss_seidel(A,b,lam,es,maxi)
    //Método GaussSeidel com relaxamento
    //[x,iter] = gauss_seidel(A,b,[lam,es,maxi])
    //x é o vetor solução
    //A é a matriz de coeficientes
    // b é o vetor de entradas 
    //lam é o fator de relachamento, default=1
    //es é o criterio de parada, default=0.00001%
    //maxi é o numero maximo de iteração, default=50
    
    //checagem dos parametros de entrada
    
    //checagem de argumentos
    if argn(2)<3 then
        lam = 1;
    end
    if argn(2)<4 then
        es = 0.00001;
    end
    if argn(2)<5 then
        maxi = 50;
    end
    //fim checagem de argumento
    //matriz quadrada
    [m,n] = size(A)//obter a dimenção de A
    if m~=n then
        error('A: deve ser quadrada');//verifica se a matriz é quadrada
    end
    
    [i,j] = size(b)//Obtem o tamanho de b
    if i~=m | j~=1 then
        error ('b: deve ser n de A');
    end
    //Fim da matriz quadrada 
    //Fim da checagem dos parametros de entrada
    
    //Montar os vetores x,d e a matriz C
    
    for i=1:n 
        for j=1:n
            if i~=j then
                A(i,j) = A(i,j)/A(i,i);
            end
        end
        d(i) = b(i)/A(i,i);
        A(i,i) = 0;
        x(i) = 0;
        ea(i)=1;
    end
    //Fim Montar os vetores x,d e a matriz C    
    //implementar o algoritimo de gauss-seidel com relachamento (pg 10 e 11)
    iter = 0;
    
    while max(ea(i))>es & iter<maxi do
        for i=1:n
            xold = x(i);
            x(i) = d(i) - A(i,:) * x(:);
            //calcula o valor relaxado de x(i)
            x(i) = x(i)*lam + xold*(1-lam);
            ea(i) = abs((x(i)-xold)/x(i))*100;
        end
        iter = iter + 1;        
    end
endfunction
