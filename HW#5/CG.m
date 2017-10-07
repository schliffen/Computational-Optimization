function [x, max_alpha, itr] = CG (A, b, tol) 
  
x = zeros(size(A, 2), 1);

r = b - A*x;
p = r; 
delta = r'*r; 
max_alpha = 0;
j = 0;
nb = norm(b);
while (norm(r) > tol*nb) 
    j = j+1; 
    s = A*p; 
    alpha = delta/(s'*p) ;
    if alpha > max_alpha
        max_alpha = alpha;
    end
    x = x + alpha*p ;
    r = r - alpha*s;
    beta = 1/delta;
    delta = r'*r;
    beta = delta*beta;
    p = r + beta*p; 
end

itr = j + 1;

end