//exercicio do saltador de bungee jumping
clear

m = 60; g = 9.80665; c = 0.25; //t = 0.5 segundo até 12
i = 1;
vex(1) = 0; vnum(1) = 0; t(1) = 0; dt = 0.5;

while t(i)<12 do // faça dt ate 12
    t(i+1) = t(i)+dt;
    vex(i+1) = sqrt(g*m/c)*tanh(sqrt(g*c/m)*t(i+1));
    vnum(i+1) = vnum(i) + (g-(c/m)*(vnum(i)^2))*dt;
    i = i+1;
end
printf("A solução exata de v(%d) = %f \n",t(i), vex(i));
printf("A solução numerica de v(%d) = %f \n",t(i), vnum(i));
e = abs((vex(i)-vnum(i))/vex(i))*100;
printf ("O erro verdadeiro relativo percentual vale %f %%",e);
plot2d(t,vex,style=[color('blue4')]);
plot2d(t,vnum,style=[color('red4')]);
xgrid;
