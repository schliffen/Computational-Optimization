function [x, max_alpha, itr] = HLSD (A, b, tol) 
  
x = zeros(size(A, 2), 1);

r = b - A*x;
s = A*r;
alpha = r'*r/(s'*r);
max_alpha = alpha;
j = 0;
nb = norm(b);
while (norm(r) > tol*nb)
    
    j = j+1;
    s = A*r;
    if mod(j, 2) == 0
        alpha = r'*r/(s'*r);
        if alpha > max_alpha
            max_alpha = alpha;
        end
    end
    x = x + alpha*r ;
    r = r - alpha*s;
    
end

itr = j + 1;

end