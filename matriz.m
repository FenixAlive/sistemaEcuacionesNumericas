A = [3, -2, 4; 0, 5, 1; -4, -3, 5]
B = [9;-4;4]
det(A)
inv(A)*B
diag(A)
triu(A)
tril(A)
% regla de cramer para encontrar y
Ay = A; Ay(:,2)=B; det(Ay)/det(A)
% regla de cramer para z
Az = A; Az(:,3)=B; det(Az)/det(A)

