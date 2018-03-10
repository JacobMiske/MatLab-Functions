%Computer Assignment 4 Problem 4
%2.086 F17
%Jacob Miske
clc
clear all

%Part A
%Testing two postulates on the nature of GLS
%Given:
LS=[1 2 3 4 5 6 7 8 9;
    2 3 1 5 6 4 8 9 7;
    3 1 2 6 4 5 9 7 8;
    4 5 6 7 8 9 1 2 3;
    5 6 4 8 9 7 2 3 1;
    6 4 5 9 7 8 3 1 2;
    7 8 9 1 2 3 4 5 6;
    8 9 7 2 3 1 5 6 4;
    9 7 8 3 1 2 6 4 5];

GS=['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I';
    'G' 'H' 'I' 'A' 'B' 'C' 'D' 'E' 'F';
    'D' 'E' 'F' 'G' 'H' 'I' 'A' 'B' 'C';
    'B' 'C' 'A' 'E' 'F' 'D' 'H' 'I' 'G';
    'H' 'I' 'G' 'B' 'C' 'A' 'E' 'F' 'D';
    'E' 'F' 'D' 'H' 'I' 'G' 'B' 'C' 'A';
    'C' 'A' 'B' 'F' 'D' 'E' 'I' 'G' 'H';
    'I' 'G' 'H' 'C' 'A' 'B' 'F' 'D' 'E';
    'F' 'D' 'E' 'I' 'G' 'H' 'C' 'A' 'B'];

GLS=@(i,j) {LS(i,j) GS(i,j)} %Example
GLS(4,9)

GraecoLatin = 1; % Initially true, until proven false. If "0", then the postulate fails for the given matrices

%For postulate I
%If LS and GS contain only unique elements in each given row and column,
%then the resultant doubles must also be unique and no two cells contain
%the same ordered pair

%initally true, to be potentially proven false if not following postulate I
LSlogical = 1;
GSlogical = 1;

for i = 1:9
    %Runs test on each row, one by one, starting with empty arrays
    letters = [];
    numbers = [];
    %Goes through columns in a given row (i) and fills up the letters and
    %numbers arrays
    for j = 1:9
        letters = cat(2, letters, GS(i, j));
        numbers = cat(2, numbers, LS(i,j));
    end
    %Test unique nature of the arrays
    if length(letters) == length(unique(letters))
        %thus there are no repeats
        continue
    else
        GSlogical = 0;
    end
    if length(numbers) == length(unique(numbers))
        %thus there are no repeats
        continue
    else
        LSlogical = 0;
    end
    %If every array is unique 
end

%And for column analysis, (i) and (j) are flipped in the (j) 'for' loop
for i = 1:9
    %Runs test on each row, one by one, starting with empty arrays
    letters = [];
    numbers = [];
    %Goes through columns in a given row (i) and fills up the letters and
    %numbers arrays
    for j = 1:9
        letters = cat(2, letters, GS(j, i));
        numbers = cat(2, numbers, LS(j,i));
    end
    %Test unique nature of the arrays
    if length(letters) == length(unique(letters))
        %thus there are no repeats
        continue
    else
        GSlogical = 0;
    end
    if length(numbers) == length(unique(numbers))
        %thus there are no repeats
        continue
    else
        LSlogical = 0;
    end
    %If every array is unique 
end

%Final test on GLS 
if LSlogical & GSlogical == 1
    GraecoLatin = 1;
else
    GraecoLatin = 0;
end

%Part B
%Generating full list of possibilities for 6 numbers, 1 to 9
abcdef = fullfact([9 9 9 9 9 9])
%It is necessary that at least 4 different variables are unique to
%eachother. Therefore a similar method can be used as in Part A where the
%uniqueness of the possible solutions to find disaster can be ruled out.

%starting with empty list of possibilities to later test
possibilities = [];
HDIGlogical = 1; %How Did It Go logical

%Using "numbers" again to find comparitive uniqueness. New logical.
%Although this method involves one heavy computation (the one below) which
%exceeds 531441 calls, this computation only needs to be done once and will
%speed up calls to How_Did_It_Go in the future.
tic
for i = 1:531441
    %Runs test on each row, one by one, starting with empty arrays
    numbers = abcdef(i,:);
    if 4 <= length(unique(numbers))
        %thus there are at most, 2 repeats
        possibilities(i,:) = numbers;
    else
        HDIGlogical = 0; %this should be 0 here at first and later resolved to 1 if the code works correctly
    end
    %If every array is unique 
end
toc
%This, when uncommented, bit removes the null possibilities within fullfact.

% b = size(possibilities)
% possibilities = (possibilities)'
% possibilities(possibilities == 0) = [];
% possibilities = reshape(possibilities, b(2)-1, b(1));

%the resultant 'possibilities' should now limit the number of calls
%necessary for a hypothetical "How_Did_It_Go" function significantly by
%using this Graeco-Latin similar method.


