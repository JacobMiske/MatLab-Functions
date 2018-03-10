%Computer Assignment 4 Problem 2
%2.086 F17
%Jacob Miske

clc
clear all

%The track
course_ht = @(x)  0*(x<0.2)+...
    0.3*(1-cos(asin((x-0.2)/0.3))).*(x>=0.2).*(x<(0.2+0.3*sind(35)))+...
    ((0.3*(1-cosd(35)))+tand(35)*(x-0.2-0.3*sind(35))).*(x>=(0.2+0.3*sind(35)));

Wheel_rad=0.02;
fw_ht = @(x)  Wheel_rad*(x<0.2)+... %height of the front wheel
    (Wheel_rad+(0.3-Wheel_rad)*(1-cos(asin((x-0.2)/(0.3-Wheel_rad)))))...
    .*(x>=0.2).*(x<(0.2+(0.3-Wheel_rad)*sind(35)))...
    +((Wheel_rad+(0.3-Wheel_rad)*(1-cosd(35)))+tand(35)*(x-0.2-(0.3-Wheel_rad)...
    *sind(35))).*(x>=(0.2+(0.3-Wheel_rad)*sind(35)));

x=0:0.002:0.8;
figure(1)
plot(x,course_ht(x),'r','LineWidth',2)
hold on
plot(x,fw_ht(x),'g')
xlim([-0.01 1])
ylim([-0.01 .51])
axis equal
legend('road surface','path of front wheel')
hold on

%Given constants and variables
%Not all were used, problem was not worded on what would be needed
K = 0.022; %Nm/V
V_0 = 4.8; %V
R = 1.1; %ohms
m = 2.9; %kg
CoG = 0.02; %m
wheelbase = 0.15; %m
Wheel_dia = 0.04; %m
gear_ratio = 6;
position(1) = 0; %initially stopped
drag = 0.7; %drag coefficient
frontA = 17/10000; %m^2 frontal area of car
r = 0.3;

%Torque_wheel = Torque_motor*N
%Drag = 1/2 rho V^2 S C_d
%complete forward euler method with dt = 0.001s
%The car will move forward along horizontal then travel partially up the
%curve, it will never make it to the higher angle. Gravity will overcome
%the force due to torque
dt = 0.001;
v = 0;
vs = [];
counter = 1;
while position(counter) <= 0.2
    W = v(counter)/(r*gear_ratio)
    torque = (K*V_0)/(R-(K^2/R)*W);
    F_g = torque*gear_ratio/r; %gravity force equal to horizontal torque force
    a = F_g/m; %Newtons 2nd law
    v(counter+1) = v(counter) + a*dt;
    position(counter+1) = position(counter) + v(counter)*dt;
    counter = counter + 1;
    vs(counter) = v(counter)
end

figure(4)

plot(v)
axis equal
plot(position)
xlim([-0.01 1])
ylim([-0.01 .51])

g=9.81;

v_curve(counter) = v(end)
while (position(counter > 0.2) & (position(counter) < 0.37) & (counter < 300));
    angle = interp1([0.2 0.37], [0 7*pi/36], position(counter));
    W = v_curve(counter)/r*gear_ratio;
    torque = (K*v_0)/(R-(K^2/R)*W);
    Fg = torque*gear_ratio/r;
    a = Fg/m;
    v(counter+1) = v(counter) - a*dt;
    position(counter + 1) = position(counter) + v(counter)*dt;
    counter = counterr + 1;
    vs(counter) = v(counter)
end

xs = linspace(0, 0.6, 779)
plot(xs,vs, 'b-')
axis equal
plot(position)
xlim([-0.01 1])
ylim([-0.01 .51])

vs
vs(end)