clear; clc; close all
l = 2:6;
matrix.l = l;
N = 2.^l - 1;
tol = 1e-5;
k = 1;
for i = N
    
    
    
    h = 1/(i+1);
    A = delsq(numgrid('S',i+2));
    b = h^2*ones(i^2, 1);
    
    matrix.size(k) = i^2;
    matrix.cond(k) = (1-cos(sqrt(i^2)*pi/(sqrt(i^2)+1)))/...
        (1-cos(pi/(sqrt(i^2)+1)));
    
    [~, matrix.max_alpha_cg(k), matrix.itr_cg(k)] =...
        CG (A, b, tol);
    [~, matrix.max_alpha_sd(k), matrix.itr_sd(k)] =...
        SD (A, b, tol);
    [~, matrix.max_alpha_hlsd(k), matrix.itr_hlsd(k)] =...
        HLSD (A, b, tol);
    k = k+1;
    
end

HW1_Part_1c = table;
HW1_Part_1c.l = matrix.l';
HW1_Part_1c.n = matrix.size';
HW1_Part_1c.Condition_Number = matrix.cond';
HW1_Part_1c.Iteration_count_CG = matrix.itr_cg';
HW1_Part_1c.Iteration_count_SD = matrix.itr_sd';
HW1_Part_1c.Iteration_count_HLSD = matrix.itr_hlsd';
HW1_Part_1c.Max_alpha_CG = matrix.max_alpha_cg';
HW1_Part_1c.Max_alpha_SD = matrix.max_alpha_sd';
HW1_Part_1c.Max_alpha_HLSD = matrix.max_alpha_hlsd';

HW1_Part_1c
