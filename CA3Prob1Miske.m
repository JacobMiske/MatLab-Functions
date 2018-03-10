%CA3 2.086
%Jacob Miske
%Problem 1
clc
clear
%Given code and file
load('foot_3D')
plot3(foot_xyz(1,:), foot_xyz(2,:), foot_xyz(3,:), 'k.') %Original foot in black
axis equal

%Shows change in foot shape when contraction added
hold on

%Part A
%Matrix given
A = [2, 0, 0; 0, 1, 0; 0, 0, 0.6];
%Changing points in foot_xyz
foot_dilation_contraction = A*foot_xyz;
%plotting contraction points in red
plot3(foot_dilation_contraction(1,:), foot_dilation_contraction(2,:), foot_dilation_contraction(3,:), ' ro')
%keep contraction points
hold on

%Part B
%Given material
vectors = [2 1 0; 2 1 1; 2 1 4];
plotv(vectors, 'g') %Plotting vectors in green
hold on


%Part C
%Given matrix of vectors in same plane
B = [2 1 0; 2 1 1]' %Projection vector
P = B*inv(B'*B)*B' %Projection matrix
foot_projection = P*foot_xyz;
%Places orthogonal 'flat foot' projection
plot3(foot_projection(1,:), foot_projection(2,:), foot_projection(3,:), 'bo')

