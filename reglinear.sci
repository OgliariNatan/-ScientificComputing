function  [a,r2] = reglinear(x,y)
    //verificação dos dados
    n=length(x);
    if(n~=length(x)) then
        error('Dados inconsistentes, x e y devem ter o mesmo tamanho');
    end
    //grafico esperimental
    plot(x,y,'*');
    xgrid;
    //Criação de um vetor x "continuo"
    xa = linspace(min(x), max(x), 100);
    //escolha de eixo ou transformaçõa linear
    disp('Digite:');
    disp('<1> Para ajuste por uma reta');
    disp('<2> Para ajuste por uma exponencial');
    disp('<3> Para ajuste por uma potencia simples');
    disp('<4> por uma eq. de taxa de crecimento saturado de ordem m');
    op = input("Sua escolha é: ");
    //ajuste de eixo ou transformaçõa linear
    if (op == 2) then
        y = log(y);
    elseif (op == 3) then
        y=log10(y);
        x=log10(x);
    elseif (op ==4) then
        disp("Entre com a ordem m do modelo: ");
        m = input("A ordem é: ");
        y = 1 ./y;
        x = 1 ./x^m;
    end
    //calculo dos somatorios necessarios
    somax=(sum(x)); somay=(sum(y)); somaxy=sum(x.*y);
    somaxx=sum(x.^2); somayy=sum(y.^2);
    //Termos das equações
    A = n*somaxy - somax*somay;
    B = n*somaxx - somax^2;
    C = n*somayy - somay^2;
    //Calculo de a0(a(1)), a1(a(2)) e r^2
    a(2) = A/B;
    a(1) = somay/n - a(2)*somax/n;
    r2 = (A/(sqrt(B)*sqrt(C)))^2;
    //transformação inversa e equação da curva
    if (op == 1) then
        ya = a(1) + a(2)*xa;
     elseif (op == 2) then
         alfa = %e^a(1);
         betha = a(2);
         ya = alfa*%e.^(betha*xa);
     elseif (op == 3) then
         alfa = 10^a(1);
         betha = a(2);
         ya = alfa*(xa.^betha);
     else 
         alfa = 1/a(1);
         betha = (alfa*a(2))^(1/m);
         ya = (alfa*(xa.^m)) ./ (betha^m + xa.^m);
    end
    //plota o grafico linearizado 
    plot(xa,ya);
endfunction
