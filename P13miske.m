%Jacob Miske
%2.086 Quiz 2 P13

%Pretty buggy, the graph shows the mass dropping only in x, which it does
%but does not show the y drop. I have the code here but not enought time to
%elaborate how the mass would reach a point where it would stop translating
%more in y and start tranlating more in x

clc
clear all
%constants
y(1)=0; x(1)=10;
v_x(1)=1.5; v_y(1)=0;
m=0.1; g=9.8; dt=0.0001;
t=1;
%Forward euler
while y(t)>0
    v=[v_x(t) v_y(t)];
    springF=10*norm([x; y])-10; %Spring force is k * length extended or compressed past normal point
    Fy=-m*g-springF*v_y(t)/norm(v);
    Fx=-springF*v_x(t)/norm(v);
    v_y(t+1)=v_y(t)+(Fy/m)*dt;
    v_x(t+1)=v_x(t)+(Fx/m)*dt;
    y(t+1)=y(t)+v_y(t)*dt;
    x(t+1)=x(t)+v_x(t)*dt;
    t=t+1;
end

%Backend while loop for forward euler
y(t)=0;
v_y(t)=-v_y(t);

while v_y(t)>=0
    v=[v_x(t) v_y(t)];
    springF=10*norm([x; y])-10; %Spring force is k * length extended or compressed past normal point
    Fy=-m*g-springF*v_y(t)/norm(v);
    Fx=-springF*v_x(t)/norm(v);
    v_y(t+1)=v_y(t)+(Fy/m)*dt;
    v_x(t+1)=v_x(t)+(Fx/m)*dt;
    y(t+1)=y(t)+v_y(t)*dt;
    x(t+1)=x(t)+v_x(t)*dt;
    t=t+1;
end

%plotting x,y points throughout time
plot(x,y)