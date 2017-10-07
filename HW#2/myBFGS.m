function [x, xtmp, cp, count, alpha_tmp] = myBFGS(f, fp, C, x0, atol, mitr, set)

x = x0;
alpha = 1;

cp = 1;
count = 0;
xtmp(:, 1) = x0;

alpha_tmp(1) = alpha;
%%
while (cp>0 && count<mitr)
    
    % computing the search direction
    p = -C*fp(x);
    
     % choosing whether use line search or not, and if yes, backtracking or quadratic interpolation
    if set == 0
        alpha = wlsearch(f, fp, p, x);
        xn = x + alpha*p;
    else if set == 1
            alpha = bkt(f, fp, p, x);
            xn = x + alpha*p;
        else
            xn = x + alpha*p;
        end
    end
    
    
    w = alpha*p;
    y = fp(xn) - fp(x);
    rho = (y'*w)^-1;
    C = (eye(size(C))-rho*(w*y'))*C*(eye(size(C))-rho*(y*w')) + ...
        rho*(w*w');

    % allocating the outputs
    count = count + 1;
    xtmp(:, count + 1) = xn;
    cp = norm(xn - x) - atol*(1 + norm(x));
    alpha_tmp(:, count +1) = alpha;
    x = xn;
end

end
