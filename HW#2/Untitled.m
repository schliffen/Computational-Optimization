clear; clc; close all;
% HW#2 main script
% Defining the function, its gradient, and hessian.
f = @(x) 1+100*(x(2)-x(1)^2)^2 + (1-x(1))^2 +90*(x(4)-x(3)^2)^2 + ...
    (1-x(3))^2 + 10*(x(2)+x(4)-2)^2 + 0.1*(x(2)-x(4))^2;
fp = @(x) [-400*x(1)*(x(2) - x(1)^2) - 2*(1 - x(1));...
    200*(x(2) - x(1)^2) + 20*(x(2) + x(4) -2) + 0.2*(x(2)-x(4));
    -360*x(3)*(x(4)-x(3)^2)-2*(1-x(3));
    180*(x(4)-x(3)^2) + 20*(x(2)+x(4)-2)-0.2*(x(2)-x(4))];
fpp = @(x) [-400*x(2)+1200*x(1)^2+2, -400*x(1), 0, 0;...
    -400*x(1), 200+20+0.2, 0, 20-.2;...
    0, 0, -360*x(4)+360*3*x(3)^2 + 2, -360*x(3);...
    0, 20-0.2, -360*x(3), 180+20+.2];

% allocating the starting point, maximum iterations, and absolute
% tolerance.
x0 = [-3; -1; -3; -1];
atol = 1e-7;
mitr = 20000;
C0 = eye(4, 4);

%%
% i = 0 means usning quadratic interpolation for line search, i = 1 means
% using backtracking and else means whithout line search

i = 2;

% [x_n, xtmp_n, cp_n, count_n, alpha_n] = mynewton(f, fp, fpp, x0, atol, mitr, i);

[x_BFGS, xtmp_BFGS, cp_BFGS, count_BFGS, alpha_BFGS] = myBFGS(f, fp, C0, x0, atol, mitr, i);
