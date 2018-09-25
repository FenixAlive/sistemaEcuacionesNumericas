% pedir funcion f(x,y), g(x,y), J(x,y)
% si la j inversa no es cuadrada primero multiplicarla por la transpuesta an
c = 1; % es cuadrada 1, no es cuadrada 0

g1 = @(x,y)([sqrt(1-y^2); -x^2+y]);
g2 = @(x,y)([sqrt(y);sqrt(1-x^2)]);
F = @(x,y)([x^2+y^2-1; -x^2+y]);
x0 = [.5;.5]; 
Xn = [];

for i = 1:15
  x1 = (g2(x0(1), x0(2)));  
  ErrAbs = norm(x0-x1);
  Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
  x0 = x1;
end
Xn
