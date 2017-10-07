clear; clc; close all;


f = @(x) .5*x(1)^2 - .25*x(2)^4 + 1/327;
fp = @(x) [x(1); -x(2)^3];
fpp = @(x) [1 0; 0 -3*x(2)^2];


x0 = [1; 10];
atol = 1e-7;
mitr = 2000;
C0 = eye(2, 2);
%%
i = 2;
[x_n, xtmp_n, cp_n, count_n] = mynewton(f, fp, fpp, x0, atol, mitr, i);
count_n
% [x_BFGS, xtmp_BFGS, cp_BFGS, count_BFGS] = myBFGS(f, fp, C0, x0, atol, mitr, i);
% count_BFGS
