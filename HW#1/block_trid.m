function [x] = block_trid(A, b, m, n)

%Gaussian Elimination
x = zeros(size(b));

for i = 1:n-1    
    for k = 1:m
        
        b((i-1)*m + k) = b((i-1)*m + k) / A((i-1)*m + k, ((i-1)*m + k));
        
        A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + 2*m)) = ...
            A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + 2*m)) / ...
            A((i-1)*m + k, ((i-1)*m + k));

        for j = (k+1):2*m

            b((i-1)*m + j) = b((i-1)*m + j) - A((i-1)*m + j, ((i-1)*m + k)) * ...
                b((i-1)*m + k);
            
            A((i-1)*m + j, ((i-1)*m + k):((i-1)*m + 2*m)) = ...
                A((i-1)*m + j, ((i-1)*m + k):((i-1)*m + 2*m)) - ...
                A((i-1)*m + j, ((i-1)*m + k)) * A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + 2*m));

        end
    end
end


i = n;
for k = 1:m-1
  
    b((i-1)*m + k) = b((i-1)*m + k) / A((i-1)*m + k, ((i-1)*m + k));
    
    A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + m)) = ...
        A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + m)) / ...
        A((i-1)*m + k, ((i-1)*m + k));
    
    for j = (k+1):m
        
        b((i-1)*m + j) = b((i-1)*m + j) - A((i-1)*m + j, ((i-1)*m + k)) * ...
                b((i-1)*m + k);
        
        A((i-1)*m + j, ((i-1)*m + k):((i-1)*m + m)) = ...
            A((i-1)*m + j, ((i-1)*m + k):((i-1)*m + m)) - ...
            A((i-1)*m + j, ((i-1)*m + k)) * ...
            A((i-1)*m + k, ((i-1)*m + k):((i-1)*m + m));
    end
end

b(m*n) = b(n*m) / A(m*n, m*n);
A(m*n, m*n) = 1;


% Backward substitution
% x = A\b;

x(n*m) = b(n*m);

for j = (m-1):-1:1
    x((n-1)*m+ j) = b((n-1)*m+ j) - ...
        sum(A((n-1)*m+ j, (n-1)*m+ ((j+1):m))'.*x((n-1)*m+ ((j+1):m)));
end

for i = (n-1):-1:1
    for j = (m):-1:1
    x((i-1)*m+ j) = b((i-1)*m+ j) - ...
        sum(A((i-1)*m+ j, ((i-1)*m+ j+1):((i-1)*m+ 2*m))'.* ...
        x(((i-1)*m+ j+1):((i-1)*m+ 2*m)));
    end
end


end