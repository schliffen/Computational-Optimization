clear
clc
close all

A = [4 -4 -2 2 6 -6 -1 0 0;
    3 -3 4 -4 -9 9 0 0 0;
    7 -7 3 -3 5 -5 0 1 0;
    -1 1 0 0 0 0 0 0 1];

b = [5; 3; 9; 2];
c = [1; -1; -5; 5; -6; 6; 0; 0; 0];

[x,gap,nbas] = lpm (A,b,c);

z = zeros(3, 1);
z(1) = x(1) - x(2);
z(2) = x(3) - x(4);
z(3) = x(5) - x(6);

f = @(z) z(1) - 5*z(2) - 6*z(3);

fprintf('(Exercise #3 b) z_1 = %g\n', z(1));
fprintf('(Exercise #3 b) z_2 = %g\n', z(2));
fprintf('(Exercise #3 b) z_3 = %g\n', z(3));
fprintf('(Exercise #3 b) function value f(z) = %g\n', f(z));