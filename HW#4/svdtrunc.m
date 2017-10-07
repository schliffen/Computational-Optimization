function [U sv tol] = svdtrunc(A, tol)

[U S] = svd(A, 'econ');
sv = diag(S);
ns = sum(sv > tol);

if ns < length(sv)
	tol = sv(ns+1);
	sv = sv(1:ns);
	U = U(:,1:ns);
else
	tol = 0;
end
