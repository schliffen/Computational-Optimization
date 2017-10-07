clear; clc
% format long
mx = 50;
m = mx^2;
n = 1000;
A = randn(m, n);
b = randn(m, 1);
W = delsq(numgrid('S', mx + 2));
spy(W)
tic
% xls = (A'*W*A)^-1*(A'*W*b);
xls = (A'*W*A)\(A'*W*b);
toc
tic
R = chol(W);
A_new = R*A;
b_new = R*b;

xqr = A_new\b_new;
toc
f = @(x) .5*(b-A*x)'*W*(b-A*x);
f(xls)
f(xqr)