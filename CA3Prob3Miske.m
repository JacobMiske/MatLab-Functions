%CA3 2.086
%Jacob Miske
%Problem 3

clc
clear all

%Mastermind solving
%1=red 2=purple 3=yellow 4=orange 5=green 6=white

%gives me a random peg color
randpeg = randi(6, [1,1]);
%all linear paths of 1-6 combination

%There are 6^4 = 1296 possibilities of different codes since 6 colors and 4 slots
all_codes = [1 1 1 1]; %The first possibility with all red will look like this
%I ended up using MatLab's fullfact function
%%%% My first attempt %%%%
% setpegs1 = [1 2 3 4 5 6];
% setpegs2 = [6 1 2 3 4 5];
% setpegs3 = [5 6 1 2 3 4];
% setpegs4 = [4 5 6 1 2 3];
% setpegs5 = [3 4 5 6 1 2];
% setpegs6 = [2 3 4 5 6 1];
% Prm1 = perms(setpegs1);
% Prm2 = perms(setpegs2);
% Prm3 = perms(setpegs3); 
% Prm4 = perms(setpegs4); 
% Prm5 = perms(setpegs5); 
% Prm6 = perms(setpegs6); 
% allPrm = [Prm1; Prm2; Prm3; Prm4; Prm5; Prm6]
%alls = unique(allPrm, 'rows')
%%%% I wanted to show all my work

%This is correct implementation
all_codes = fullfact([6 6 6 6]);
%Uses the combination principle to generate all sets of row vectors
all_codes = unique(all_codes, 'rows'); 
%Ensures combinations are all unique

%first guess using randi to get a random row vector from all_codes in a
%solvable general case
chosenone = all_codes(randi(1296), :);
%Creates test game solutions
game1sol = [1 6 6 5];
game2sol = [2 5 1 2];

%Creates random test game case
randcase = all_codes(randi(1296), :);

%eliminated starts with all 0, therefore any code is possible
eliminated = zeros(1296,1);
%Will subtract codes that cannot be true
codes_left = all_codes(eliminated == 0);

rdot = 0;
wdot = 0;
%Creating a matrix of dot values for each possible code
dots = zeros(1296,2);


%Example 1
%Placeholder variable
guess1of1 = [1 1 2 2];
%usage of function below
elim1 = possib([1 1 2 2], [1 6 6 5])

%Since 0 represents possible codes, I flip it to ones and use it to zero
%out not possible versions in all_codes which elim is designed for
elim1 ~= elim1;
leftovers = all_codes.*elim1;


%This function takes in a guess and a solution and gives back a vector
%eliminated but it holds the information specific to my version of all_codes
function [ eliminated ] = possib(guess, solution)
%white dots are first column, red dots are second column
dots = zeros(1296,2);
all_codes = fullfact([6 6 6 6]);
for i = 1:1296
    for j = 1:4
        for k = 1:4
            %If the same color in both sets, white dot applies
            if all_codes(i,j) == solution(k)
                dots(i,1) = dots(i,1)+1;
            end
            %If the same color in the same spot, red dot applies
            if all_codes(i,j) == solution(j);
                dots(i,2) = dots(i,2)+1;
            end
        end
    end
end
%Assuming initially no matching computed
wdot = 0;
rdot = 0;
for i = 1:4
    for j = 1:4
        %If the same color in both sets, white dot applies
        if guess(i) == solution(j)
            wdot = wdot+1;
        end
        %If the same color in the same spot, red dot applies
        if guess(i) == solution(i);
            rdot = rdot+1;
        end
    end
end
dotv = [wdot, rdot];
eliminated = zeros(1296,1);
for i = 1:1296
    if dots(i,:) == dotv
        eliminated(i) = 0;
    else
        eliminated(i) = 1;
    end
end

end

