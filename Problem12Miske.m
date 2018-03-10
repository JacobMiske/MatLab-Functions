%Problem12
%QUIZ 1 2.086 Jacob Miske
%Some mechanics taken from previous function written for class in computer
%assignment. 
% The center of mass of each sub-tower 
% must be supported by the block below that given block.

% Defining the stable function

%Test case 1
W = [9 9 5];
D = [1 1 1];
Px = [0 5 2];
Py = [0 0 0];
tc1 = stable3D(W, D, Px, Py)
%Test case 2
W = [9 9 5];
D = [1 1 1];
Px = [0 5 2];
Py = [0 0.5 0.6];
tc2 = stable3D(W, D, Px, Py)

function [S] = stable3D(W,D,Px,Py)
% Find the number of the blocks:
n = length(W);  % We could use D too

% Set the initial value of S to true:
%Innocent til proven guilty
S = true;

% Loop through all possible sub-towers and check their stability: 
for i = n:-1:2
    cgwidth = W(i:end)*Px(i:end)'/sum(W(i:end)); % or cg = sum(W(i:end).*Px(i:end))/sum(W(i:end));
    if ((cgwidth<(Px(i-1)-W(i-1)/2) || (cgwidth>(Px(i-1)+W(i-1)/2)))) %If the width goes off of the COG too much, it is unstable
        S = false; %if COG off, false
    end
end

for i = n:-1:2
    cgdepth = D(i:end)*Py(i:end)'/sum(D(i:end)); % or cg = sum(D(i:end).*Px(i:end))/sum(D(i:end));
    if ((cgdepth<(Py(i-1)-D(i-1)/2) || (cgdepth>(Py(i-1)+D(i-1)/2)))) %If the depth goes off of the COG too much, it is unstable
        S = false; %if COG off, false
    end
end

end
