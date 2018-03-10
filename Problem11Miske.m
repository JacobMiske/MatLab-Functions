%Problem11
%2.086 Quiz 1 Jacob Miske
%Falling ball
%Given values
h = 20; %m
g = 9.8; % m/s^2
vt = 31; %m/s
vi = vt*sqrt(1-exp(-2*g*h/vt^2)) %m/s
%Constitutive Ratio code, used later in loop
% C_R = 0.9;
% vr = vi*C_R;
% h_bounce = -(vt^2/g)*log(cos(atan(vr/vt)))

%Start off with zero bounces
n = 0;
for i = 1:30 %that should do it
    C_R = 0.9; %declare ratio
    vr = vi*C_R; %detract from vr speed
    h_bounce = -(vt^2/g)*log(cos(atan(vr/vt))) %declare bounce according to the new speed off the bounce
    vi = vt*sqrt(1-exp(-2*g*h_bounce/vt^2)) %declare new max falling velocity according to new h_bounce height
    if h_bounce > 0.05 %Limit for what is a bounce at 5cm, as the limit decreases, bounces goes to infinity.
        n = n+1; %C++ style addition
    else
        break %Once this conditional met, break out
    end
end
n 
%Tell me what the bounces are 
