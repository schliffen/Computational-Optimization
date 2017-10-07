    clear; clc; close all

    A = [1 0 1 2; 2 3 5 10; 5 3 -2 6; 3 5 4 12; -1 6 3 8];
    b = [4; -2; 5; -2; 1];

    k = 1;
    d = [b; zeros(size(A, 2), 1)];
    for gamma = [0, 10.^-[0 3 6 12]]

        B = [A; sqrt(gamma)*eye(size(A, 2))];
        x_gamma(:, k) = B\d;

        l2_res(k) = norm(A*x_gamma(:, k) - b);
        l2_sol(k) = norm(x_gamma(:, k));

        k = k+1;
    end

    % TSVD

    [u, s, v] = svd(A);

    [U, sv, tol] = svdtrunc(A, 1e-5);
    z = U'*b;
    y = zeros(4, 1);
    y(1:3) = z./sv;
    xn = v*y;
    xn; 
    norm(A*xn - b);
    norm(xn);


    % Results
    HW4_Q1_e = table;
    HW4_Q1_e.gamma = [0, 10.^-[0 3 6 12]]';
    HW4_Q1_e.L2_norm_of_x = l2_sol';
    HW4_Q1_e.L2_norm_of_residual = l2_res';
    HW4_Q1_e

    fprintf('(Exercise #1 e) 2-norm of the residual using TSVD (norm(A*x_gamma-b)) = %g \n',...
        norm(A*xn-b))
    fprintf('(Exercise #1 e) 2-norm of the solution using TSVD (norm(x_gamma))= %g \n',...
        norm(xn))

