function alpha = bkt(f, fp, p, x)

alpha = 1;
rho = .5;
c = 1e-4;
xn = x + alpha*p;

while (f(xn)>(f(x)+c*alpha*fp(x)'*p) && alpha>.4)
    alpha = rho*alpha;
    xn = xn + alpha*p;
end
