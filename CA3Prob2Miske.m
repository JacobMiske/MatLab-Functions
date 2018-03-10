%CA3 2.086
%Jacob Miske
%Problem 2
%Examining a flow of air down a tube
clc
clear
%parameters
D = 0.1; %m diameter of tube
mflow = 0.0193; % kg/sec
syms P
rho = 1.23; %kg/m^3 air density
avrv = 2.0; %m/s
d = 0.025; %m diameter of holes in tube
%part A; assuming all velocites are the same
%following formula
%velocity = (1/10)*(avrv)*(D^2)/(d^2);
%Creating vector space
v = [];
for j = 1:10 %each hole
    v(j) = (1/10)*(avrv)*((D^2)/(d^2));
end
%All v(j) are equal to 3.2m/s
%Part B; 
%Modelling mass flow rate loss
%Creating vector space
v_tube = [];
%Before hitting the holes, mass flow is 0.0193 kg/s
for i= 1:10 %each hole
    v_hole = (0.0193 - (rho*(pi/4)*d^2)*sum(v(1:i)))/(rho*(pi/4)*D^2);
    v_tube(i) = v_hole;%subtract mass flow lost
end
v_tube(10) = 0; %At the end of the tube, there is zero potential for v_tube to have a velocity since mass flow has dropped off
%It appears that Matlab doesn't find 0 here because of a truncation error
v_tube;
%Part C
%Using bernoulli's equation and static pressure. Baseline for dynamic pressure
%Setting inlet velocity 
V = avrv; %m/s
P = (1/2)*rho*v(5)^2 + (1/2)*rho*v_tube(5)^2 - (1/2)*rho*V^2; %Pa
%Creating vector space for pressures along holes
p = [];
%Running through the iteration of each pressure for 10 holes
for i = 1:10
    p(i) = P - (1/2)*rho*v_tube(i)^2;
end

%Part D
%Taking a new guess using bernoulli's equation
%v_u = sqrt(2*p/rho)
v_u = [];
for i = 1:10
    v_u(i) = sqrt(2*p(i)/rho);
end

%Part E
%Mass conversation on sum of exit velocities
%Taking part d as correct but (v) is not
flow=[];
coefficient = [];
for j = 1:10
    flow(j) = (0.0193 - (rho*(pi/4)*d^2)*sum(v_u(1:j)));
    flow(10) = 0;%Baseline truncation
    coefficient(j) = (flow(j) /(rho*(pi/4)*d^2)); %Using a linear path proportionality to find v
    %coefficient(9) - (2.6899) gives separation overall from proportional
    %guess to true zero
    %7.3717/10 is added to v_u to get v
end
v2 = v_u + ((coefficient(9) - v_u(10))/10);
v = v2; %setting new v as this proportionally fixed v
%This sums to 32 roughly without truncation fix
%This also makes sense as velocity increases

%Part F
%Bring it all together with new v vector

%These for loops will use the new v found in (e)
%From partb, to use mass flow
for i= 1:10 %each hole
    v_hole = (0.0193 - (rho*(pi/4)*d^2)*sum(v(1:i)))/(rho*(pi/4)*D^2);
    v_tube(i) = v_hole;%subtract mass flow lost
end
%From partc, to use bernoulli's pressure and statics
for i = 1:10
    p(i) = P - (1/2)*rho*v_tube(i)^2;
end
%From partd, to use bernoulli's velocity
for i = 1:10
    v_u(i) = sqrt(2*p(i)/rho);
end
%From parte, to use the proportionality to get true v
flow=[];
coefficient = [];
for j = 1:10
    flow(j) = (0.0193 - (rho*(pi/4)*d^2)*sum(v_u(1:j)));
    flow(10) = 0;%Baseline truncation
    coefficient(j) = (flow(j) /(rho*(pi/4)*d^2)); %Using a linear path proportionality to find v
    %coefficient(9) - (2.6899) gives separation overall from proportional
    %guess to true zero
    %7.3717/10 is added to v_u to get v
end
v2 = v_u + ((coefficient(9) - v_u(10))/10);
v = v2;
