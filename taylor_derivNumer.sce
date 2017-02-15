//Usando a aproximação por diferença progressiva O(h), diferença Progressão regressiva O(h) e por diferença centrada O(h^2).
//estimar a derivada 1° de f(x) = 25x^3 - 6x^2 + 7x - 88
//para x = 2, com passo de 0,5 e 0,25. 
// camparar com o vbalor real.

clear
xi = input('Entre com o valor de xi: ');
h = input('Entre com o passo de cálculo: ');
disp('Entre com os coef da f. polinomial entre ')
vetor = input(' no formato [a0 a1 ... an] : ');
f = poly(vetor,'x','c');
disp(f, 'f(x)');
flinha = derivat(f);
disp(flinha,'f´(x)');
