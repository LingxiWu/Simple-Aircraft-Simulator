function [x,y] = nextLoc(in, dir)
% nextLoc: take the direction and (x,y) from in, determine the next
% position of the aircraft on the grid.

theta = wrapTo360(dir*90 + in.theta);
    
% Calculate the position of in1 at the end of this step.
if(theta == 0 || theta == 360)
    x = in.x + 1;
    y = in.y;
elseif(theta == 90)
    x = in.x;
    y = in.y + 1;
elseif(theta == -90 || theta == 270)
    x = in.x;
    y = in.y - 1;
else
    x = in.x - 1;
    y = in.y;
end
    
end

