function s = jacobi(A, B, x0, it)
  % Función que busca de manera iterativa la matriz solucion x
  % Buscar que A este en matriz dominante
  % s = jacobi(A, B, x0, it)
  % crea la solucion Ax = B
  % A = matriz
  % B = Resultado en filas 
  % x0 = [1; 1; 1] prueba inicial de x con las dimensiones necesarias
  % it = numero de iteraciones o tolerancia de error
  D = triu(A)+tril(A)-A % hace la diagonal
  R = A - D %hace la matriz sin la diagonal
  exac = A\B % \ hace la solucion x exacta
  sol = [];
  if it < 1
    k = 1;
    errabs = 1;
    while errabs > it
      x = inv(D)*(B-R*x0);
      errabs = norm(x - x0); %norm hace la diferencia del modulo de vectores, si quieres que evalue contra valor real cambiar x0 por exac
      sol = [sol; [k x' errabs]]; % ' es transpuesta
      x0 = x;
      k++;
    end
  else
    for k = 1:it
      x = inv(D)*(B-R*x0);
      errabs = norm(x - x0); %norm hace la diferencia del modulo de vectores
      sol = [sol; [k x' errabs]]; % ' es transpuesta
      x0 = x;
    end

  end
  s = sol;
end
