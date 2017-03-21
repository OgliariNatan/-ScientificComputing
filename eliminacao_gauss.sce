//algoritimo de gauss n =3
//a11 x1 +a12 x2 +a13 x3 = b1
//a21 x1 +a22 x2 +a23 x3 = b2
//a31 x1 +a32 x2 +a33 x3 = b3

//eliminação regressiva 
//iteração 1 e 2; i=1; j=2 && j=3 (j=i+1 até n)
//multiplica: a21/a11 a31/a11 => aij/aii
//nb = n+1

//matriz aumentada
//|a11 a12 a12 b1(a14)| (1)
//|a21 a22 a23 b2(a24)| (2)
//|a31 a32 a33 b3(a34)| (3)

//(2)-(1)multiplica(1)
//(3)-(1)multiplica(2)

//|a11                  a12                 a13                 b1             |
//|a21-(a11*a21/a11)    a22-(a12*a21/a11)   a23-(a13*a21/a11)   b1-(b1*a21/a11)|
//|a31-(a11*a31/a11)    a32-(a12*a31/a11)   a33-(a13*a31/a11)   b3-(b1*a31/a11)|

//a(j,k) = a(j,k) - a(j,k)*multiplicador

//para descobri o x
//x(n)= bn^n-1/ann^n-1

function x = gaussi(A,b)
clear
    //x é o vetor solução 
    //a é a matriz de coeficientes
    //b é o vetor estimulos
    [m,n] = size(A)//obter a dimenção de a
    if m~=n then
        error('A: deve ser quadrada');//verifica se a matriz é quadrada
    end
    
    nb = n + 1;
    SIS = [A b]//junta as matriz A e b em uma matriz nova
    
    //eliminação progressiva
    for i = 1:n-1 //i vai de 1 ate n-1
        for j = i+1:n 
            Mult = SIS(j,i)/SIS(i,i);
            for k = 1:nb
                SIS(j,k) = SIS(j,k)- SIS(i,k)*Mult;
            end
            //SIS(j,1:nb) = SIS(j,1:nb)- SIS(i,1:nb)*Mult; //for implicito
            disp(SIS);// Mostrando todos os passos da eliminação
        end
    end
    //disp (SIS);
    
    //subistituição regressiva
    x = zeros(n,1);
    x(n) = SIS(n,nb)/SIS(n,n);
    
    for i = n-1:-1:1
        x(i) = (SIS(i,nb) - SIS(i,(i+1):n)*x((i+1):n)) / SIS(i,i);
    end
    
endfunction
