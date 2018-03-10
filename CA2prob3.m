%Jacob Miske
%Computer Assignment 2 2.086


%hockey.m
t=[ 1.901666667 1.906666667 1.91 1.915 1.918333333 1.923333333 1.926666667 1.931666667 1.935 1.94 1.943333333 1.948333333 1.951666667 1.956666667 1.96 1.965 1.968333333 1.973333333 1.976666667 1.981666667 1.985 1.990];
x_stick=[ 0.55257759 0.588068821 0.646524966 0.713331989 0.784314451 0.86991095 0.980560082 1.089121494 1.220647821 1.350086428 1.456560121 1.544244339 1.594349606 1.663244349 1.721700494 1.784332078 1.834437346 1.905419808 1.953437356 2.007718062 2.070349646 2.112104035];
y_stick=[ 1.086866757 1.028410612 0.965779028 0.913586041 0.861393054 0.821726384 0.779971995 0.748656203 0.727779008 0.713164972 0.713164972 0.729866727 0.742393044 0.757007081 0.769533397 0.790410592 0.811287787 0.827989543 0.844691298 0.87809481 0.91567376 0.942814114];
%Original plot to show positions
%plot(x_stick,y_stick,'rx')
%title('Motion of a Field Hockey Stick')
%xlabel('x position of the head')
%ylabel('y position of the head')
%text(x_stick(1),y_stick(1),['\leftarrow  time = ' num2str(t(1))])
%text(x_stick(end)-0.35,y_stick(end),['time = ' num2str(t(end)) '\rightarrow'])

%Part A
%forward difference
%finding vertical components of velocity
y_vel = [];
for i = 1:20
    %adding each y velocity 20 times
    y_vel(i) = ((y_stick(i+1)-y_stick(i))/t(i));
end

%Part B
%forward difference
x_vel = []; %starting empty
for i = 1:20
    %adding each x velocity 20 times
    x_vel(i) = ((x_stick(i+1)-x_stick(i))/t(i));
end

%Part C
velocities = []; %empty vectors
for i = 1:3
    velocities(i) = norm([x_vel(i), y_vel(i)]);
end

%Part D
%given data set
x_vel_big_step(1:20) = (x_stick(3:22)-x_stick(1:end-2))./(t(3:22)-t(1:end-2));

plot(t(1:20), x_vel, t(1:20), x_vel_big_step)
%given code to polyfit third data set (smooth)
p_x= polyfit(t,x_stick,5);
x_smooth=polyval(p_x,t);
x_vel_smooth=(x_smooth(2:end-1)-x_smooth(1:end-2))./(t(2:end-1)-t(1:end-2));
x_vel = x_vel * 1000;%conversion

%plot with three lines to compare
plot(t(1:20), x_vel, t(1:20), x_vel_big_step, t(1:20), x_vel_smooth)
title('Motion of a Field Hockey Stick')
xlabel('time')
ylabel('x velocity of stick')