function alpha = wlsearch(f, fp, p, x)

alpha = 1;
sigma = 1e-4;
alphamin = 0.4;
xn = x + alpha*p;
fx = f(x);
fpx = fp(x)'*p;
fxn = f(xn);

while (fxn > (fx + sigma*alpha*fpx)) && (alpha>alphamin)
    
    mu = -.5*fpx*alpha^2/(fxn - fx - alpha*fpx);
    
    if mu < .1
        
        mu = .5;
        
    end
    
    alpha = mu*alpha;
    xn = x + alpha*p;
    fxn = f(xn);
    
end
