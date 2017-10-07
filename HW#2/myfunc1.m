function [f,g] = myfunc1(x)

f = x(1).^4 + x(1).*x(2) + (1 + x(2)).^2;

if nargout > 1
    g = [4*x(1).^3 + x(2);
        x(1) + 2*(1 + x(2))];
end