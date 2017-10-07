clear; clc; close all
format long
kmax = 1000;

atol = 1e-4;

J = randn(100, 50);
d  = randn(100, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 20);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 50);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 100);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


atol = 1e-6

J = randn(100, 50);
d  = randn(100, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 20);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 50);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)


J = randn(200, 100);
d  = randn(200, 1);
[zn, tmpz] = IRLS(J, d, atol, kmax);
fprintf('Size of J is = \n')
size(J)
fprintf('Tolerance is = %g \n', atol)
fprintf('1-norm of Jz-d in every 10th iteration = \n')
tmpz(1:10:end)

