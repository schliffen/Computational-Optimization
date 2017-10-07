clear; clc; close all;

m = 3;
n = 7;

mblock = [1, -.1, -.1; -.1, 1, -.1; -.1, -.1 ,1];
lblock = [.1, .5, .5; -.5, .1, .5; -.5, -.5, .1];
ublock = [.1, -.5, -.5; .5, .1, -.5; .5, .5, 1];
nm = n*m;

A = zeros(nm, nm);
for k = 1:n
    A((k-1)*m+1:k*m, (k-1)*m+1:k*m) = mblock;
    if k > 1, A((k-1)*m+1:k*m, (k-2)*m+1:(k-1)*m) = lblock; end
    if k < n , A((k-1)*m+1:k*m, k*m+1:(k+1)*m) = ublock; end
end
spy (A)

% B = zeros(size(A));
% B = A;
% for i = 1:nm
%     for j = 1:nm
%         if i>j
%             B(i, j) = 0;
%         end
%     end
% end
% figure
% spy(B)