clear
xi = input('Entre com o valor de xi: ');
h = input('Entre com o passo de cálculo: ');
disp('Entre com os coef da f. polinomial entre ')
vetor = input(' no formato [a0 a1 ... an] : ');
f = poly(vetor,'x','c');
disp(f, 'f(x)');
flinha = derivat(f);
disp(flinha,'f´(x)');
