clear; clc; close all

N = 128;
h = 1/N;
t = linspace(0, 1, N + 1);

%%
b_p(1:(find(t>=.25, 1)-1)) = 1;

b_p(find(t>=.25, 1):(find(t>=.5, 1)-1)) = 2;
 
b_p(find(t>=.5, 1):(find(t>=.7, 1)-1)) = 2 - ...
    100*(t(find(t>=.5, 1):(find(t>=.7, 1)-1))-.5).* ...
    (0.7 - t(find(t>=.5, 1):(find(t>=.7, 1)-1)));

b_p(find(t>=.7, 1):(N + 1)) = 4;

%%
eta = 1.001;
tol = 1e-8;
noise = [1e-2, 1e-2, 1e-1, 1e-1];
gamma = [1e-2, 1e-3, 1e-2, 1e-3];


%%  

D = eye(N+1, N+1);
D(2:N, 2:N) = diag(sqrt(2)*ones(N-1, 1));
D = sqrt(h/2)*D;

W = zeros(N, N+1);
for i = 1:N
    W(i, i) = -1;
    W(i, i+1) = 1;
end

%%

for i = 1:4

if mod(i, 2) == 1
noisev = randn(size(b_p))*mean(abs(b_p))*noise(i);
data = b_p + noisev;
end

figure
plot(t,data,'k','LineWidth',1)
title('Exercise #4 c - Beta = 1e-3 and noise = 1e-2')
title(['Exercise #4 c - gamma = ',...
    num2str(gamma(i)),' and noise = ', num2str(noise(i))])
xlabel('time', 'FontSize', 12, 'FontWeight','bold')
ylabel('data', 'FontSize', 12, 'FontWeight','bold')

k = 0;
nu = 1;
u = zeros(N+1, 1);
z = ones(N, 1);
y = zeros(N, 1);
while( norm(W*u - z) > tol*norm(W*u))

    B = D'*D + nu*(W'*W);
    c = D'*(D*data') - W'*y + nu*W'*z;
    
    u = B\c;
    
    zz = W*u + y/nu;
    
    ind_p = find(zz>=0);
    ind_n = find(zz<0);
    
    z(ind_p) = max(zz(ind_p) - gamma(i)/nu, 0);
    z(ind_n) = min(zz(ind_n) + gamma(i)/nu, 0);
    
    y = y + nu*(W*u - z);
    nu = nu * eta;
    
end
fprintf(['(Exercise #4 c) - gamma = ',num2str(gamma(i)), ...
    ', noise = ', num2str(noise(i)), ' Relative error = ', ...
    num2str(norm(u - b_p')/norm(b_p)), '\n'])
hold on
plot(t, u, 'r','LineWidth',1.5)
legend('Data', 'Estimation','Location','northwest')
grid on
% pause(1.2)
end




