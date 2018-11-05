function s = gaussJordan()
A = [-14 0 3 5 4; 2 35 -2 1 -2; 2 -1 7 -3 4; -3 1 2 -21 -2; -3 -2 4 -2 35];
B = [3 70 5 -43 28]'
format rat
% función s = gaussJordan(A, B)
% forma Ax = B
% A = matriz cuadrada
% B = igualdad
% te da la solución exacta
l = length(A)
Aum = [A,B]
%hacer un for
for i=1:3
  E = eye(l);
  %hacer pivote
  Ae = -Aum(:,i)/Aum(i,i);
  Ae(i) = 1/Aum(i,i);
  E(:,i)=Ae;
  Aum = E*Aum
end
fprintf("\n\tSolución Real\n");
A\B
s = Aum;
end
