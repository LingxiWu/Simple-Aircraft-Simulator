function [dir] = direction(in)
%DIRECTION get (x, y) and (xd, yd) here and determine the right direction
%   to take. Controller calls this function.
%   % Determine the target general location: up, down, left, right, upper-right, upper-left,
% lower-left, lower-right.
loc = '';
if((in.yd == in.y) && (in.xd == in.x))
    loc = 'reached';
elseif((in.yd == in.y) && (in.xd - in.x)>0)
    loc = 'right';
elseif((in.yd == in.y) && (in.xd - in.x)<0)
    loc = 'left';
elseif((in.xd == in.x) && (in.yd - in.y)>0)
    loc = 'up';
elseif((in.xd == in.x) && (in.yd - in.y)<0)
    loc = 'down';
elseif((in.xd - in.x)>0 && (in.yd - in.y)>0)
    loc = 'upper-right';
elseif((in.xd - in.x)<0 && (in.yd - in.y)>0)
    loc = 'upper-left';
elseif((in.xd - in.x)>0 && (in.yd - in.y)<0)
    loc = 'lower-right';
elseif((in.xd - in.x)<0 && (in.yd - in.y)<0)
    loc = 'lower-left';
end

if(strcmp(loc, 'reached'))
    dir = 0;
elseif(strcmp(loc,'up'))
    if(in.theta == 0 || in.theta == 360)
        dir = 1;
    elseif(in.theta == 90)
        dir = 0;
    elseif(in.theta == 270 || in.theta == -90)
        dir = -1;
    elseif(in.theta == 180)
        dir = -1;
    end
elseif(strcmp(loc,'down'))
    if(in.theta == 0 || in.theta == 360)
        dir = -1;
    elseif(in.theta == 90)
        dir = -1;
    elseif(in.theta == 270 || in.theta == -90)
        dir = 1;
    elseif(in.theta == 180)
        dir = 0;
    end
elseif(strcmp(loc,'left'))
    if(in.theta == 0 || in.theta == 360)
        dir = -1;
    elseif(in.theta == 90)
        dir = 1;
    elseif(in.theta == 270 || in.theta == -90)
        dir = -1;
    elseif(in.theta == 180)
        dir = 0;
    end
elseif(strcmp(loc,'right'))
    if(in.theta == 0 || in.theta == 360)
        dir = 0;
    elseif(in.theta == 90)
        dir = -1;
    elseif(in.theta == 270 || in.theta == -90)
        dir = 1;
    elseif(in.theta == 180)
        dir = -1;
    end
elseif(strcmp(loc,'upper-right'))
    if(in.theta == 0 || in.theta == 360)
        dir = 1;
    elseif(in.theta == 90)
        dir = 0;
    elseif(in.theta == 270 || in.theta == -90)
        dir = 1;
    elseif(in.theta == 180)
        dir = -1;
    end
elseif(strcmp(loc,'upper-left'))
    if(in.theta == 0 || in.theta == 360)
        dir = 1;
    elseif(in.theta == 90)
        dir = 0;
    elseif(in.theta == 270 || in.theta == -90)
        dir = -1;
    elseif(in.theta == 180)
        dir = -1;
    end
elseif(strcmp(loc,'lower-left'))
    if(in.theta == 0 || in.theta == 360)
        dir = -1;
    elseif(in.theta == 90)
        dir = 1;
    elseif(in.theta == 270 || in.theta == -90)
        dir = 0;
    elseif(in.theta == 180)
        dir = 1;
    end
elseif(strcmp(loc,'lower-right'))
    if(in.theta == 0 || in.theta == 360)
        dir = -1;
    elseif(in.theta == 90)
        dir = -1;
    elseif(in.theta == 270 || in.theta == -90)
        dir = 0;
    elseif(in.theta == 180)
        dir = 1;
    end
end

end

