    
function s = gaussSeidel()
clear
    A = [-14 0 3 5 4; 2 35 -2 1 -2; 2 -1 7 -3 4; -3 1 2 -21 -2; -3 -2 4 -2 35];
    %B = [-9 32 22 -26 68]'
    B = [3 70 5 -43 28]'
    x0 = [0 0 0 0 0]'
    it = .00001
  % Función que busca de manera iterativa la matriz solucion x
  % Buscar que A este en matriz dominante
  % s = gaussSeidel(A, B, x0, it)
  % de la forma Ax = B
  % A = matriz
  % B = Resultado en filas 
  % x0 = [1; 1; 1] prueba inicial de x con las dimensiones necesarias
  % it = numero de iteraciones o tolerancia de error
  L = tril(A)
  U = A - L
  exac = A\B % \ hace la solucion x
  sol = [];
  if it < 1
    k = 1;
    errabs = 1
    while it < errabs
      x = inv(L)*(B-U*x0);
      errabs = norm(x - x0); %norm hace la diferencia del modulo de vectores
      sol = [sol; [k x' errabs]]; % ' es transpuesta
      x0 = x;
      k = k+1;
    end
  else
    for k = 1:it
      x = inv(L)*(B-U*x0);
      errabs = norm(x - x0); %norm hace la diferencia del modulo de vectores
      sol = [sol; [k x' errabs]]; % ' es transpuesta
      x0 = x;
    end
  end
  s = sol;
end
