%Problem10
%2.086 Quiz 1 Jacob Miske

r = 3; %radius of the circle
x = @(t) r*(cos(t) + t.*sin(t)); %x function
y = @(t) r*(sin(t) - t.*cos(t)); %y function
t = 0:pi/100:pi/2; %range
plot(r*sin(0:pi/100:2*pi), r*cos(0:pi/100:2*pi)) % base circle as requested
axis equal % keeps things aligned well with equal axis ranges
hold on % lets me keep putting down new lines

%new functions to make my life easier, I use non-functional handles to
%drive my conditionally plotted output
x = r*(cos(t) + t.*sin(t)); %x function new
y = r*(sin(t) - t.*cos(t)); %y function new

moreThanThreshold = x < 3.4; % the more than threshold
under_x = x(moreThanThreshold) %only x's that are < 3.4 for x
under_y = y(moreThanThreshold) %only y's that are < 3.4 for x
plot(under_x, under_y, 'k') %involute curve
