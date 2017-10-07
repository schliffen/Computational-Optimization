clear; clc; close all;

m = 3;
n = 500;

% mblock = [1, -.1, -.1; -.1, 1, -.1; -.1, -.1 ,1];
% lblock = [.1, .5, .5; -.5, .1, .5; -.5, -.5, .1];
% ublock = [.1, -.5, -.5; .5, .1, -.5; .5, .5, 1];

mblock = 5*randn(m, m);
lblock = 5*randn(m, m);
ublock = 5*randn(m, m);

% mblock = 1;
% lblock = 2;
% ublock = 4;

nm = n*m;

A = zeros(nm, nm);
for k = 1:n
    A((k-1)*m+1:k*m, (k-1)*m+1:k*m) = mblock;
    if k > 1, A((k-1)*m+1:k*m, (k-2)*m+1:(k-1)*m) = lblock; end
    if k < n , A((k-1)*m+1:k*m, k*m+1:(k+1)*m) = ublock; end
end
spy (A)

x0 = ones(nm, 1);
b = A*x0;

cond(A)

[x] = block_trid(A, b, m, n);

norm(A*x - b)