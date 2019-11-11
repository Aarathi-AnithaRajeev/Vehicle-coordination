clear all
clc

L=0.5*[ 1 0 -1 0 0 0;-1 2 0 0 0 -1;-1 -1 2 0 0 0;0 -1 0 1 0 0;0 0 -1 0 1 0;0 0 0 -1 -1 2];
w=[1 1.1 0.9 0.85 2 2.1]';
K=50;
N=6;
t=[0 20];
theta=2*rand(6,1);
[t,theta]=ode23(@kuramoto,t,theta,[],w,K,N,L);

n=length(theta);

for i=1:n
    thetadot(i,:)= w +((K/N)*(-L*theta(i,:)'));
end

figure
plot(t,theta)
xlabel('time')
ylabel('phase')
title('phase vs time')

figure
plot(t,thetadot)
xlabel('time')
ylabel('frequency')
title('frequency vs time')

figure
plot(theta,thetadot)
xlabel('phase')
ylabel('frequency')
title('phase plane plot')

function dtheta=kuramoto(t,theta0,w,K,N,L)
dtheta=w+((K/N)*(-L*theta0));
end
