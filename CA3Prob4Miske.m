%CA3 2.086
%Jacob Miske
%Problem 4

%Part A

%Group of springs
% k1 = 30; %N/m
% k = 10; %N/m
%Creating springs matrix
k =[];
for i = 1:7
    k(i) = 10;
end
k(1) = 30;
%Creating main diagonal of the spring matrix
for i = 1:6
    K(i) = k(i)+k(i+1)
end
K(7) = 10; %Setting the springiness of the last block which is only dependent on one spring instead of two 
kdiag1 = diag(K); %Using diag to create three lines of pattern following springiness relationships
kdiag2 = -diag(k(2:7),-1);
kdiag3 = -diag(k(2:7),1);
A = kdiag1 + kdiag2 + kdiag3 %bringing it all together

%Creating force vector
F = [];
for i = 1:7
    F(i) = 0;
end
F(3) = -5;
F(5) = -5;
f = F'

%solving the linear system
u = f\A;

%Part B
%Plotting the original array of springs \
mass = [4 5.5 5.5 4 4; 0 0 1 1 0];
spring = [0 0.5 0.5+0.4*[0:pi/100:pi*2]+0.1*cos(0:pi/10:20*pi) 3.5 4;
    0.5 0.5 0.5+0.2*sin(0:pi/10:20*pi) 0.5 0.5];
plot([0 0 40],[2 -0.5 -0.5], 'k', 'LineWidth', 2)
hold on
axis off
for n = 1:7
    plot(mass(1,:) + 5.5*(n-1), mass(2,:), 'k');
    plot(spring(1,:) + 5.5*(n-1), spring(2,:), 'r')
    axis equal
    xlim([-1.5 5.5*n+1.5])
   ylim([-1.5 2.5])
end

%Taking a new set of spring positions to add on
for n=1:7
    plot(mass(1,:) + 5.5*(n-1) + u(n), mass(2,:),'k'); %move by u(n) displacement
    x = (mass(1,:) + 5.5*(n-1) + u(n)); %x position in iteration
    %checks on each block
    if n == 1
        l(n) = min(x);
    else
        l(n) = min(x) - max(mass(1,:) + 5.5*(n-2) + u(n-1));
    end
    if n == 1
        d = 0;
    else
        d = sum(l(1:n-1))+1.5*(n-1);
    end
    %Settings on graph
    plot(spring(1,:)/4*l(n)+d,spring(2,:),'r');
    axis equal
    xlim([-1.5 5.5*n+1.5])
    ylim([-1.5 2.5])
end

