function [y,t] = rk4(fun,ti,tf,h,y0)
// Método de Runge-Kutta para Sistema de N equações Diferenciais (interativo) - Ordem 4
// Onde -> y é o vetor solução (EDO's)
//      -> t é o vetor do tempo 
//---------------------------------------------------------------------
//    -> fun é o vetor de funções do sistema (EDO's)
//    -> ti é o valor inicial do tempo
//    -> tf é o valor final do tempo
//    -> h é o passo de calculo (step)
//    -> y0 é o vator contendo as condições iniciais
//
//######################################################################
//Exemplo de Chamada
//exec ('path\rk4.sci',-1) {-1 não mostra o código de execução}

//fun = '[ya(2),9.81-(0.25/68.1)*ya(2)^2]'; 
// --> Caso do EX pg. 24 (Slide de Aula)
// --> ya é o vetor avaliado por evstr(fun) (k1, k2, k3, k4)
//y0 = '[0,0]'; --> Condições Iniciais; y1(0)=0 e y2(0)=0
//[y,t] = rk4(fun,0,10,1,[0,0])
//-----------------
//Autor: Daniel HC Souza
//IMPLEMENTACAÇÃO....

//Inicializações
t(1) = ti;
y(1,:) = y0;
i = 1; ta = ti;

while ta < tf do
    ya = y(i,:);
    
    //Calculando K1 e y(0)
    k1 = evstr(fun);
    ya = y(i,:) + k1*h/2;
    
    //Atualiza o tempo t(0 + h/2)
    ta = ta + h/2;
    
    //Calculando K2 e y(0,5)
    k2 = evstr(fun);
    ya = y(i,:) + k2*h/2;
    
    //Calculando K3 e y(0,5)
    k3 = evstr(fun);
    ya = y(i,:) + k3*h;
    
    //Atualiza o tempo t(0 + h/2) --> t(h)
    ta = ta + h/2;
    
    //Calculando K4 e y(1)
    k4 = evstr(fun);
    
    //Calculando Valores para y(1) - Método de Runge-Kutta 4ªOrdem
    phi = (k1+2*(k2+k3)+k4)/6;  //Eq. de Runge-Kutta
    y(i+1,:) = y(i,:) + phi*h;  //Atualiza Valores de y()
    t(i+1) = ta;                //Atualiza Valores do Tempo

    i = i+1;                    //Proxima Iteração
end
endfunction
