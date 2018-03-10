%Jacob Miske
%Computer Assignment 2 2.086

%I am having some issues with the logicals involved here. I believe my
%methods are solid.
%Test case 1
W1 = [9 9 5 7 7 5 3];
P1 = [0 -1 -3 -3 -5 -7 -9];
tc1 = buildable(W1,P1)
tc2 = Stable(W1,P1)

%Test case 2
W2=[8 8 5];
P2=[0 3 6];
tc3 = buildable(W2, P2)
tc4 = Stable(W2, P2)

%Test case 3
W3=[9 9 5];
P3=[0 5 2];
tc5 = buildable(W3,P3)
tc6 = Stable(W3,P3)

%Test case 4
W4=[8 7 5];
P4=[0 1 5];
tc7 = buildable(W4,P4)
tc8 = Stable(W4, P4)


%I am having an issue with the logicals, the code I have written is on the
%right track but I lack the knowledge on how I can use the logicals
%effectively. I would like to further learn about this in lecture. 
function[ B ] = buildable( W,P )
%Buildability function, returns true if block tower can be assembled one by
%one piece
for i = 1:length(W)-1 %iterate through the addition of each block
    leftside(i) = P(i)-(W(i)/2); %finding left side of the block
    rightside(i) = P(i)+(W(i)/2); %finding right side of the block
    if P(i+1) > leftside(i) && P(i+1) < rightside(i)
        B = true;
    else
        B = false;
    end
end
if CG(W,P) > rightside(1) || CG(W,P) < leftside(1)
    B = false;
end
if CG(W,P) < rightside(1) || CG(W,P) > leftside(1)
    B = true;
end
end

function [ S ] = Stable(W, P)
%Stable function, returns 1 if stable, returns 0 if unstable.
%W vector holds widths widths and P holds postitions
S = 1; %Assumed true until proven false
for i = 1:length(W)-1
    leftside = P(i+1)-(W(i+1)/2); %finding left side of the block
    rightside = P(i+1)+(W(i+1)/2); %finding right side of the block
    if P(i) > leftside || P(i) < rightside
        S = true;
    else
        S = false;
    end
end
end

%Center of Gravity of the entire stack
function [ G ] = CG(W,P)
n = length(W); %should be same as length(P)
weight_sum = 0; %start at 0 weight
weight = 0;
for i = 1:n
    weight = weight+W(i);
    weight_sum = weight_sum + P(i)*W(i);
end
G = weight_sum/weight;
end
