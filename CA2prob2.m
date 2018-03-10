%Jacob Miske
%Computer Assignment 2 2.086
%Problem Number 2


%Given steplist
steplist = [2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1];

%Initial R vector
R = [1 1 1 1 1 1];
R=logical(R);
statelist = []; %stores different Rs

for i = 1:length(steplist)
    if R(steplist(i)) == 0
        R(steplist(i)) = 1;
    elseif R(steplist(i)) == 1
        R(steplist(i)) = 0;
    end
    statelist(i,:) = R;
end
statelist


%To check legality (n==1)|((n==2)&R(1))|((n>2)&&(R(n-1)&&~sum(R(1:n-2)))) 
%Resetting R to avoid confusion with script above
R = [1 1 1 1 1 1];
R= logical(R);
all_legal = 1; %Starts assuming moves are legal until illegal move is made
for i = 1:length(steplist)
    n = steplist(i);
    if (n==1)|((n==2)&R(1))|((n>2)&&(R(n-1)&&~sum(R(1:n-2))))
    else
        all_legal = 0;
    end
    if R(steplist(i)) == 0
        R(steplist(i)) = 1;
    elseif R(steplist(i)) == 1
        R(steplist(i)) = 0;
    end
end