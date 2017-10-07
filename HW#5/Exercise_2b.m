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

noise = [1e-2, 1e-2, 1e-1, 1e-1];
beta = [1e-3, 1e-4, 1e-3, 1e-4];


%%  

D = eye(N+1, N+1);
D(2:N, 2:N) = diag(sqrt(2)*ones(N-1, 1));
D = sqrt(h/2)*D;

W = zeros(N, N+1);
for i = 1:N
    W(i, i) = -1;
    W(i, i+1) = 1;
end
W = W/sqrt(h);

%%

for i = 1:4

if mod(i, 2) == 1
noisev = randn(size(b_p))*mean(abs(b_p))*noise(i);
data = b_p + noisev;
end

figure
plot(t,data,'-k',...
    'LineWidth',1,...
    'MarkerSize',3,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
title('Exercise #2 b - Beta = 1e-3 and noise = 1e-2')
title(['Exercise #2 b - Beta = ',...
    num2str(beta(i)),' and noise = ', num2str(noise(i))])
xlabel('time', 'FontSize', 12, 'FontWeight','bold')
ylabel('data', 'FontSize', 12, 'FontWeight','bold')

u = (D^2 + beta(i)*(W'*W))\(D^2*data');

fprintf(['(Exercise #2 b) - beta = ',num2str(beta(i)), ...
    ', noise = ', num2str(noise(i)), ' Relative error = ', ...
    num2str(norm(u - b_p')/norm(b_p)), '\n'])

hold on
plot(t, u, 'r','LineWidth',1.5)
legend('Data', 'Estimation','Location','northwest')
grid on
pause(1.2)
end




