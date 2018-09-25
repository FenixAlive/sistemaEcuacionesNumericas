function newton()
  % se debe entrar a la función para pasar los datos
  % si J no es cuadrada darle valor 0 a c
  c = 1; % es cuadrada 1, no es cuadrada 0
  f = @(x,y)(x);
  f1x = @(x,y)(1); %derivada parcial de x de f
  f1y = @(x,y)(1); %derivada parcial de y de f
  g = @(x,y)(x);
  g1x = @(x,y)(1); %derivada parcial de x de g
  g1y = @(x,y)(1); %derivada parcial de y de g
  % si son 3 variables usar h y f1z, g1z
  %h = @(x,y)(x);
  %h1x = @(x,y)(1);
  %h1y = @(x,y)(1)
  x0 = [-4;-2]; % poner las variables necesarias

  F = @(x,y)([f(x,y);g(x,y)]); % en su caso agregar h y demas
  J = @(x,y)([f1x(x,y), f1y(x,y); g1x(x,y), g1y(x,y)]);
  Xn = [];

  if(c == 0)
    for i = 1:7
      x1 = x0-inv(J(x0(1),x0(2))'*J(x0(1),x0(2)))*J(x0(1),x0(2))'*F(x0(1),x0(2));
      ErrAbs = norm(x0-x1);
      Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
      x0 = x1;
    end
  else
    for i = 1:7
      x1 = x0-inv(J(x0(1),x0(2)))*F(x0(1),x0(2));
      ErrAbs = norm(x0-x1);
      Xn = [Xn;[i x1' norm(F(x1(1),x1(2))) ErrAbs]]; % ' la comilla simple es para hacer en columnas las filas
      x0 = x1;
    end
  end
  Xn
end
