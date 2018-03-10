%Problem9 
%2.086 Quiz 1 Jacob Miske

%Given values
XYZ = [40.8573 -0.0053 0;
    -16.5284 28.6280 0;
    -20.4332 -35.3808 0;
    -26.28241 1.9750 70;
    11.7016 -24.2179 60;
    15.1224 22.2429 73.5888] %meters

%List holders
mins=[];

for i = 1:6 %number of points in XYZ
    for j = 1:6 %number of points 
        %I compare every point to itself and every other point
        %The max was found too which was unnecessary but I was curious to see if I was doing
        %something right and had all the data
        %After I have the lists of each, I just run throught with max and
        %min operations
        minnorm= norm([XYZ(j,:), XYZ(i,:)]);
        mins = [mins minnorm];
        max(mins)
        min(mins)
    end
end
