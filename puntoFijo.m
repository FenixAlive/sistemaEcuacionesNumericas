% despejar la variable de B en las ecuaciones y escojer una de las ecuaciones para usar en el for
%g1 = @(x,y)([sqrt(1-y^2); -x^2+y]); %x de la primera ecuación y y de la segunda
%g2 = @(x,y)([sqrt(y);sqrt(1-x^2)]); %x de la segunda ecuación y y de la primera
cr = @(x,y)([5-y; sqrt((25-x.^2)./3)]); %curva-recta
%cc = @(x,y)();%curva-curva no se como despejar la primera ecuación
F = @(x,y)([x^2+y^2-1; -x^2+y]); %funciones dejandolas en 0
x0 = [.5;.5]; %valores iniciales
Xn = [];

for i = 1:15
  x1 = (cr(x0(1), x0(2)));  %se puede cambiar entre g1 y g2 para ver cual es mejor
  ErrAbs = norm(x0-x1);
  Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
  x0 = x1;
end
Xn
