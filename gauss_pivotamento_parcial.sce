//sistema 4x4
//l = linha do coeficiente da matriz original
//k = linha do coeficiente da sub matriz
//i = numero de colunas
//l = i+k-1
//

function x = gausspp(A,b)
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
        //Pivotamento 
        [maior,k] = max (abs(SIS(i:n,i)));
        l = i+k-1;
        if l~=i then
            disp(SIS);
            SIS([l,i],:) = SIS([i,l],:);//troca a matriz de i por l
            disp("INVERTEU");
        end
        disp(SIS);
        //Fim do pivotamento
        for j = i+1:n 
            Mult = SIS(j,i)/SIS(i,i);
            //for k = 1:nb
                //SIS(j,k) = SIS(j,k)- SIS(i,k)*Mult;
            //end
            SIS(j,1:nb) = SIS(j,1:nb)- SIS(i,1:nb)*Mult; //for implicito
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
