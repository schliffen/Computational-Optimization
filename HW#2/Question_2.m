clear; clc; close all;
% HW#2 Question 2
% Defining the function, its gradient, and hessian.
f = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
fp = @(x) [100*2*(-2*x(1))*(x(2)-x(1)^2) - 2*(1 - x(1)); 100*2*(x(2) - x(1)^2)];
fpp = @(x) [-400*(x(2) - x(1)^2) + 800*x(1)^2 + 2, -400*x(1); ...
    -400*x(1) 200];


% allocating the starting point, maximum iterations, and absolute
% tolerance.
x0 = [0; 12];
atol = 1e-7;
mitr = 2000;
C0 = eye(2, 2);

%%
% i = 0 means usning quadratic interpolation for line search, i = 1 means
% using backtracking and else means whithout line search

i = 0;

[x_n, xtmp_n, cp_n, count_n, alpha_n] = mynewton(f, fp, fpp, x0, atol, mitr, i);

[x_BFGS, xtmp_BFGS, cp_BFGS, count_BFGS, alpha_BFGS] = myBFGS(f, fp, C0, x0, atol, mitr, i);


Newton_method = table;
Newton_method.Iteration_Number = (0:count_n)';
Newton_method.x_1 = xtmp_n(1, :)';
Newton_method.x_2 = xtmp_n(2, :)';
Newton_method.step_size = alpha_n';
for i = 1:count_n+1
common1(i, 1) = f(xtmp_n(:, i));
end
Newton_method.function_value = common1;
Newton_method


BFGS_method = table;
BFGS_method.Iteration_Number = (0:count_BFGS)';
BFGS_method.x_1 = xtmp_BFGS(1, :)';
BFGS_method.x_2 = xtmp_BFGS(2, :)';
BFGS_method.step_size = alpha_BFGS';
for i = 1:count_BFGS+1
common2(i, 1) = f(xtmp_BFGS(:, i));
end
BFGS_method.function_value = common2;
BFGS_method



