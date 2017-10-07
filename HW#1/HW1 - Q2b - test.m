clear; clc; close all;

% 4f =@(x) 0.5*(x-7)^2+5*abs(x);

% ezpl4ot(f)

z = -600:0.01:600;
y = 0.5*(z-7).^2+5*abs(z);

plot(z, y, 'r')
[a b] = min(y)



k = -10:.1:10;
temp = 1:length(k);
for ii = 1:size(k)
    y = 0.5*(z).^2+k(ii)*abs(z);
    [a b] = min(y);
    temp(ii) = z(b);
end
plot(k, temp)