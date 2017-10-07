function [zn, tmpz] = IRLS(J, d, atol, kmax)

z0 = J\d;
eta = 1e-12;

zn = z0;
tmpz(1, :) = norm(J*zn-d, 1);
z = 0;
k = 0;
while (norm(zn - z) >  atol*(1+norm(z))) && k<kmax
    
    z = zn;
    r = J*z-d;
    diagW = 1./(abs(r) + eta);
    W = diag(diagW);
    zn = (sqrt(W) * J)\(sqrt(W) * d);
    k = k +1;
    tmpz(k+1, :) = norm(J*zn-d, 1);
end