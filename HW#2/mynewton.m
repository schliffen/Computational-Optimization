function [x, xtmp, cp, count, alpha_tmp] = mynewton(f, fp, fpp, x0, atol, mitr, set)

x = x0;
cp = 1;
count = 0;
xtmp(:, 1) = x;
alpha = 1;
alpha_tmp(1) = alpha;
%%
while (cp>0 && count<mitr)
    
    % search direction
    p = - fpp(x)^-1*fp(x);
    
    % choosing whether use line search or not, and if yes, backtracking or quadratic interpolation
    if set == 0;
        alpha = wlsearch(f, fp, p, x);
        xn = x + alpha*p;
    else if set == 1
        alpha = bkt(f, fp, p, x);
        xn = x + alpha*p;
        else
            xn = x + p;
        end
    end
    
    % computing the stopping criterion
    cp = norm(xn - x)-atol*(1+norm(x));
    
    x = xn;
    
    % allocating the outputs
    count = count + 1;
    xtmp(:, count + 1) = x;
    alpha_tmp(:, count + 1) = alpha;
end


end