%Computer Assignment 4 Problem 1
%2.086 F17
%Jacob Miske
clc
clear all

syms x
load('747.mat')

%Part A
%x = [v p phi r]' %slip velocity %roll rate % roll angle % yaw rate
x_0 = [0 1 0 0]' %initial condition
A = [-0.0999 0 0.1153 -1.0;
    -1.6038 -1.0932 0 0.2850;
    0 1 0 0;
    0.4089 -0.0395 0 -0.2454];
x_dot = @(t, x) A*x
colorstring = 'kbgrmcy';
[t, x] = ode45(x_dot, [0 20], x_0)
figure
%Plotting out lines
for i = 1:4
    plot(t, x(:,i), 'Color', colorstring(i)) %Plots the four descriptive ODE solutions
    hold on
end
legend('slip velocity', 'roll rate', ' roll angle', 'yaw rate')
xlabel('t'); ylabel('x');


%Part B
%Using generic eig, built in function
[v, D] = eig(A)
Dcol = diag(D)
%pulling out parts with complex roots
Dutch_val = [D(2,2) D(3,3)]
Dutch_vec = [V(:,2) V(:,3)]


%Part C
x_02 = [0 1 1 0]'
x_neu = [real(Dutch_vec(:,1)/real(Dutch_vec(3,1)))];


[t2, x2] =ode45(x_dot, [0 20], x_02);
figure(2)
for i = 1:4
    plot(t2, x2(:,i), 'Color', colorstring(i+3)) %Plots the four descriptive ODE solutions
    hold on
end
legend('slip velocity', 'roll rate', ' roll angle', 'yaw rate')
xlabel('t'); ylabel('x');


%Part D
CG = mean(V)
angle = trapz(A(:,4))
Axis = [1 1 1]
figure
trimesh(F,V(:,3),V(:,1),V(:,2))

%For frame shift steady, uncomment below
% for i =0:0.0001:20
%     angles = angle*i;;
%     x = 200*sind(60)*t;
%     y = -9.8*t.^2 + 10*sind(60)*t+2;
%     rotate(angle, Axis, V);
%     translate(newplane, [x y 0]);
%     plot(newplane)
%     xlim([0 20])
%     ylim([0 7])
%     drawnow
% end

%For viewframe shift
%Uncomment below loop
for el = 40 : -.2 : -30
    view(30, el)
    drawnow
end 

xlabel('x'); ylabel('y'); zlabel('z') 