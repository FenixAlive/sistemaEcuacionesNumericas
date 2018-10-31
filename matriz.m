A = [3, -2, 4; 0, 5, 1; -4, -3, 5]
B = [9;-4;4]
det(A);
inv(A)*B;
diag(A);
triu(A);
tril(A);
Ax = A; Ax(:,1)=B; x = det(Ax)/det(A);
% regla de cramer para encontrar y
Ay = A; Ay(:,2)=B; y = det(Ay)/det(A);
% regla de cramer para z
Az = A; Az(:,3)=B; z = det(Az)/det(A);
x
y
z
sol = A\B
