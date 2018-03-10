%Jacob Miske
%Computer Assignment 2 2.086

%The following is mostly given code that describes the hook and its
%geometry
% Describe the shape of an object (a hook shape in 3D)
hook=[0.3  0.3  0.4  0.4  0.3*cosd(5:225)+0.1 0.28  0.3    0.2*cosd(225:-5:0)+0.1 ;
      0   -1.5 -1.5  0    0.3*sind(5:225) -0.25 -0.15  0.2*sind(225:-5:0)]; % in meters
hook=[[hook hook]; [-0.05*ones(1, length(hook)) 0.05*ones(1, length(hook))]];

% Find the cross sectional area of the object
A=(1/2)*sum(hook(1,1:end-1).*hook(2,2:end)-hook(1,2:end).*hook(2,1:end-1));

% Find the centroid (or center of gravity) of the object
cx=(1/(6*A))*sum((hook(1,1:end-1)+hook(1,2:end)).*...
(hook(1,1:end-1).*hook(2,2:end)-hook(1,2:end).*hook(2,1:end-1)));
cy=(1/(6*A))*sum((hook(2,1:end-1)+hook(2,2:end)).*...
(hook(1,1:end-1).*hook(2,2:end)-hook(1,2:end).*hook(2,1:end-1)));
cz=0; % The center of gravity is clearly zero given the way the object is defined
% If you change the object, this may no longer be true

% The function rot(a,v) forms a rotation matrix that rotates an object by
% angle a (in deg and CCW) about a unit vector v.  The rotation is about the origin.
rot = @(a,v) ...
  [cosd(a)+v(1)^2*(1-cosd(a)) v(1)*v(2)*(1-cosd(a))-v(3)*sind(a) v(1)*v(3)*(1-cosd(a))+v(2)*sind(a);
    v(2)*v(1)*(1-cosd(a))+v(3)*sind(a) cosd(a)+v(2)^2*(1-cosd(a))  v(2)*v(3)*(1-cosd(a))-v(1)*sind(a);
    v(3)*v(1)*(1-cosd(a))-v(2)*sind(a) v(3)*v(2)*(1-cosd(a))+v(1)*sind(a) cosd(a)+v(3)^2*(1-cosd(a))];

% The function trans(obj,p) translates an object obj by a vector p.
% The vector p contains the x, y, and z components of translation. 
trans=@(obj,p) obj+[p(1)*ones(1,length(obj));p(2)*ones(1,length(obj)); p(3)*ones(1,length(obj))];


% The function rotp(a,v,p,obj) rotates and translates an object obj by
% angle a about a vector v.  The rotation is about point p rather than the origin. 
rotp=@(a,v,p,obj) trans(rot(a,v)*trans(obj,-p),p);

% This code uses the functions rot, trans, and rotp

Axis = [1 1 1]/sqrt(3);

% Describe the shape of an object (a hook shape in 3D)
hook=[.3  0.3  0.4  0.4  0.3*cosd(5:225)+0.1 0.28  0.3    0.2*cosd(225:-5:0)+0.1 ;
      0   -1.5 -1.5  0    0.3*sind(5:225) -0.25 -0.15  0.2*sind(225:-5:0)]; % in meters
hook=[[hook hook]; [-0.05*ones(1, length(hook)) 0.05*ones(1, length(hook))]];

% Find the cross sectional area of the object
A=(1/2)*sum(hook(1,1:end-1).*hook(2,2:end)-hook(1,2:end).*hook(2,1:end-1));

% If you change the object, this may no longer be true
%moves hook 2 units off ground
hook(2,:)=hook(2,:)+2-cy;
cy=2;
%moves hook cx to 0
hook(1,:)=hook(1,:)-cx;
cx=0;
 
% Plot the "floor" at y=0
plot([0 7],[0 0],'k-','LineWidth',3)
 
%%%
hook(1,:)=hook(1,:);
hook_new=hook;
for t=0:.005:3
    dx=5*t; %x movement
    dy=5*sqrt(3)*t-9.8*t^2;%y movement
    hook_new=trans(hook,[dx,dy,0]); %translates the hook
    % Find the centroid or CG of hook_new
    cx=(1/(6*A))*sum((hook_new(1,1:end-1)+hook_new(1,2:end)).*...
    (hook_new(1,1:end-1).*hook_new(2,2:end)-hook_new(1,2:end).*hook_new(2,1:end-1)));
    
    cy=(1/(6*A))*sum((hook_new(2,1:end-1)+hook_new(2,2:end)).*...
    (hook_new(1,1:end-1).*hook_new(2,2:end)-hook_new(1,2:end).*hook_new(2,1:end-1)));
    
    cz=0;
    %Rotation of the hook
    hook_new=rotp(270*t,[1,1,1]/sqrt(3),[cx,cy,cz],hook_new);
    %ploting the new position
    plot(hook_new(1,:),hook_new(2,:),'k',cx,cy,'ro');
    axis equal
    %Setting limits of the animation
    xlim([-2,7]);
    ylim([0,5]);
    drawnow;
    %breaks loop when hook reaches the limits
    if max(hook_new(1,:))> max(xlim)|min(hook_new(2,:))<min(xlim) |max(hook_new(2,:))>max(ylim)|min(hook_new(2,:))<min(ylim) 
        display('End');
        break
    end
end


%Part B
%contact_time holds t that changes over time
contact_time = t;
display(t);
hold on % displays in command window

