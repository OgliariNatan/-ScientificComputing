function ye = pi_Newton(p,y,xe)
    //ye é o valor interpolado da variavel independente da variavel dependente
    //x é um vetor com os valores conhecidos com as var. independentes
    //y é um vetor com os valores conhecidos com as var. dependentes
    //xe é o valor da variavel independente onde a interpolaçõa é calculada
    n = length (p);
    if n~=length(y) then
        error("Entrada de dados errados");
    end
    //coeficientes 
    A(:,1)=p';
    A(:,2)=y';
    l = n;
    k = 0;
    for j=3:n+1 
        for i=l:-1:2
            A(i-1,j) = (A(i,j-1) - A(i-1,j-1)) / (A(i+k,1) - A(i-1,1));
            //disp(A);
        end
        l=l-1;
        k = k + 1;
    end
    //ye = 0; //COMENTAR ESTA LINHA
    //Calculo do valor extrapolado newton
    //pg 26 = 27
    ye = 0;
    for d = n:-1:1
        jota = 1;
        for j = 1:d-1
            jota = jota*(xe-x(j));
        end
        ye = ye + jota*A(d);
        
    end
endfunction
