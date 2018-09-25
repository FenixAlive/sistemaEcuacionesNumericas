function s = gaussJordan(A, B)
% función s = gaussJordan(A, B)
% forma Ax = B
% A = matriz cuadrada
% B = igualdad
l = length(A)
Aum = [A,B]
%hacer un for
for i=1:l
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
