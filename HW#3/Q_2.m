clear; clc, close all

theta = pi/24; % known parameter
tfine = 0:theta:2*pi;
Gk = [cos(theta),sin(theta);-sin(theta),cos(theta)];
Hk = [1,1];
x0 = [.25,.75]; % known initial value
N = length(tfine)-1; qf = zeros(2,N+1);
qf(:,1) = x0;
for k=1:N, qf(:,k+1) = Gk*qf(:,k); end
qxf = qf(1,:); qyf = qf(2,:);
sigmaH = .1;
sigmaG = .05;
noise = randn(size(qf)); % white noise
zxy = qf + sigmaH*noise; % measurements polluted by random noise
z = Hk*zxy;


figure(1)
hold on
plot(zxy(1, :), zxy(2, :))
plot(qf(1, :), qf(2, :), 'r')

