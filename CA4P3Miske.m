%Computer Assignment 4 Problem 3
%2.086 F17
%Jacob Miske

%On this PSET, I feel like I learned more about struggling than the
%numerical methods, lecture was quiet and hard to understand, last pset was
%more enjoyable.

clc
clear all

load hotwire.mat
T = 300; %K initial
%heat diffusion equation T_t = k/(rho c_p) T_xx
%T_xx(i) = (T(i+1) - 2*T(i) + T(i-1))/h^2)
%T_t = (k/rho c_p) (T(i+1) - 2*T(i) + T(i-1))/h^2)
T_t = [];
T_xx = [];

%Ends of bar at T = 310K
%Parameters
dt = 0.05;
A = A;
Tf = 1;
t = 0:dt:Tf;
%Euler forward and backward
uEF = zeros(99,length(t)); uEF(:,1) = 1;
uEB = zeros(99,length(t)); uEB(:,1) = 1;

%march forward in time and update EF and EB
for j=2:length(t)
    uEF(:,j) = (eye(99)+dt*A)*uEF(:,j-1);
    uEB(:,j) = (eye(99)-dt*A)\uEB(:,j-1);
end
%Part B and C

figure;
%Keeping multiple lines
hold on;
%Graphing
plot(t,uEF(1,:),t,uEF(2,:));
plot(t,uEB(1,:),'m-',t,uEB(2,:),'g-');
legend('EF: state1','EF: state2','EB: state1','EB: state2')

u_t = A*uEB + b %u_t using euler backwards
u_t = A*uEF + b %u_t using euler forwards


%Part D

%Parameters
dt = 0.00005;
A = A;
Tf = 1;
t = 0:dt:Tf;
%Euler forward 
uEF2 = zeros(99,length(t)); uEF2(:,1) = 1;

%march forward in time and update EF 
for j=2:length(t)
    uEF2(:,j) = (eye(99)+dt*A)*uEF2(:,j-1);
end

figure;
%Keeping multiple lines
hold on;
%Graphing
plot(t,uEF2(1,:),t,uEF2(2,:));
legend('EF2: state5','EF2: state6')

u_t2 = A*uEF2 + b %u_t using euler forwards

%It seems that the euler forward method with a time step of 0.00005 does
%not encounter the same stiffness as the early attempt at finding the euler
%forward method for u_t.

%I used an example script
%Example from live script

% dt = 1/1000;
% A = [-1 1;0 -1000];
% Tf = 1;
% t = 0:dt:Tf;
% uEF = zeros(2,length(t)); uEF(:,1) = [1;1];
% uEB = zeros(2,length(t)); uEB(:,1) = [1;1];
% % march forward in time and update EF and EF
% for j=2:length(t)
%     uEF(:,j) = (eye(2)+dt*A)*uEF(:,j-1);
%     uEB(:,j) = (eye(2)-dt*A)\uEB(:,j-1);
% end
% figure; 
% hold on;
% plot(t,uEF(1,:),t,uEF(2,:));
% plot(t,uEB(1,:),'-.',t,uEB(2,:),'-.');
% legend('EF: state1','EF: state2','EB: state1','EB: state2')
% 






function [tout, yout] = ode1EF(F,tspan,y0,dt)
% ODE1EB An ODE solver using Euler Forward
%   [tout, yout] = ode1EB(F,tspan,y0,dT) uses the Euler Forward
%   method with fixed step size dt on the interval, tspan
%   to solve
%      dy/dt = F(t,y)
%   with y(tspan(1)) = y0.
%   INPUTS
%       F:     function handle for F(t,y)
%       tspan: time interval to solve over
%       y0:    initial condition for y
%       dt:    fixed sample time

tout = tspan(1):dt:tspan(2);
yout = zeros(size(tout));
yout(1) = y0;
for j = 2:length(tout)
    s = F(tout(j-1),yout(j-1));
    yout(j) = yout(j-1) + dt*s;
end
end