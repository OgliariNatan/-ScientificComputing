//metodo rk4
//Resoluções de sistemas lineares por EDO por RK4
function [y,t] = metodo_rk4(func,ti,tf,h,y0)
    //y e o vetor para variaveis dependentes
    //y = |y1(ti)    y2(ti) |
    //    |y1(ti+h) y2(ti+h)|
    //    |.....     .......|
    //t o o vetor para variaveis independentes
    //func = é a função 
    //ti é o intsante inicial 
    //tf é o instante final 
    //h e o passo de calculo
    //yo é o vetor com varoles inicial das vari. dependentes
    //func = '[ya(2),9.81-(0.25/68.1)*ya(2)^2]';
    //inicialização
    
    i=1; t(1)=ti; y(1,:)=y0; ta = ti;
    while(ta<tf) do
        ya = y(i,:);
        k1 = evstr(func);
        ta = ta +h/2;
        ya = y(i,:) + k1*h/2;
        k2 = evstr(func);
        ya = y(i,:) + k2*h/2;
        k3 = evstr(func);
        ta = ta + h/2;
        ya = y(i,:) + k3*h;
        k4 = evstr(func);
        y(i+1,:) = y(i,:)+(h/6)*(k1+2*k2+2*k3+k4);
        t(i+1) = ta;
        i = i+1;
    end
    //exposição do grafico
    //clf();
    
    //xlabel('tempo');
    //ylabel('y1');
    //subplot(211);
    //plot(t,y(:,1));
    
    
endfunction


