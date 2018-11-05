function newton()
syms x;
syms y;
syms J(x,y);
syms F(x,y);
  % se debe entrar a la función para pasar los datos
  % si J no es cuadrada darle valor 0 a c
  c = 0; % es cuadrada 1, no es cuadrada 0


  f = @(x,y)(exp(-x^2-3*y^2)-exp(-31/12));
  
  %f1x = diff(F1(1),x); %derivada parcial de x de f
  %f1y = diff(F1(1),y); %derivada parcial de y de f
  g = @(x,y)(5*x.^2+3*y.^2-139/12);
  g1x = @(x,y)(10*x); %derivada parcial de x de g
  g1y = @(x,y)(6*y); %derivada parcial de y de g
  % si son 3 variables usar h y f1z, g1z
  h = @(x,y)(x.^2+x*y-y.^2-95/36);
  h1x = @(x,y)(2*x-y);
  h1y = @(x,y)(-2*y-x);
  x0 = [1;1]; % poner las variables necesarias

  F = @(x,y)([f(x,y);g(x,y);h(x,y)]); % en su caso agregar h y demas
  F1 = F(x,y);
  J = @(x,y)([diff(F1(1),x), diff(F1(1),y); diff(F1(2),x), diff(F1(2),y); diff(F1(3),x), diff(F1(3),y)]);
  Xn = [];

  if(c == 0)
    for i = 1:16
      x1 = x0-inv(J(x0(1),x0(2))'*J(x0(1),x0(2)))*J(x0(1),x0(2))'*F(x0(1),x0(2));
      ErrAbs = norm(x0-x1);
      Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
      x0 = x1;
    end
  else
    for i = 1:16
      x1 = x0-inv(J(x0(1),x0(2)))*F(x0(1),x0(2));
      ErrAbs = norm(x0-x1);
      Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
      x0 = x1;
    end
  end
  Xn
end
