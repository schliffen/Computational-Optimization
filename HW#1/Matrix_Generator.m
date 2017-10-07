clear; clc; close all;


n = 70;
m = 3;

tmp = rand((3*n-2)*m^2, 1);

A = sparse(m*n, m*n);

mblock = 5*randn(m, m);
lblock = 5*randn(m, m);
ublock = 5*randn(m, m);

A = zeros(m*n, m*n);
for k = 1:n
    A((k-1)*m+1:k*m, (k-1)*m+1:k*m) = mblock;
    if k > 1, A((k-1)*m+1:k*m, (k-2)*m+1:(k-1)*m) = lblock; end
    if k < n , A((k-1)*m+1:k*m, k*m+1:(k+1)*m) = ublock; end
end

x0 = ones(m*n, 1);
b = A*x0;

fprintf('condition number of the matrix = %g \n', condest(A))

tic
[x] = block_trid(A, b, m, n);
toc
fprintf('norm of error between x and x* = %g \n', norm(A*x - b))
