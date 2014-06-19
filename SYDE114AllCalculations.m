A = [1,2;3,4];
b = [2;-2];
I = [1,0,0;0,1,0;0,0,1];
% Where A is the Main Matrix
% Where b is the answer of Ax = b
% Where I is the identity matrix
[L,U,Permutation] = lu(A);
% L = Lower Triangular
% U = Upper Triangular
% Permutation = Permulation applied to A to make PA = LU or A = PLU
DetA = det(A);
% Determinant of A
[V, D] = eig(A);
% D is the eigenvalue matrix to fulfill Ax = Dx
% V = x is the eigenvector matrix to fulfil Ax = Dx
x = A\b;
% Rearangment and alternate notation for Ax = b => A/b = x
kA = cond(A,1);
% S is how close to singular matrix A is
N = norm(A,1);
% N is the 1st norm of A
Ai = inv(A);
% Ai = A inverse
Ni = norm(Ai,1);
% Ni is the first norm of A inverse

fprintf('Given Matricies');
display(A);
display(b);
fprintf('Inverse of A');
display(Ai);
fprintf('Determinant of A');
display(DetA)
fprintf('Lower Triangular');
display(L);
fprintf('Upper Triangular');
display(U);
fprintf('Permulation(P) in PA = LU');
display(Permutation);
fprintf('x in Ax = b');
display(x);
fprintf('Eigenvector(V) Matrix');
display(V);
fprintf('Eigenvalue(D) Matrix');
display(D);
fprintf('1st Norm of A');
display(N);
fprintf('1st Norm of A inverse');
display(Ni);
fprintf('k(A)/Conditional Number of A or how to singular A is');
display(kA);

