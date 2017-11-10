 function [ out, state ] = controller( in, state )
% Takes flight parameters of an aircraft and outputs the direction control

% in: Data Structure that stores input information for the aircraft
% controller. 
%       (in.x, in.y): Current Location of the aircraft
%       (in.xd, in.yd): Destination of aircraft
%       in.theta: Current direction of motion
%       in.m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%           - To access data (say x) from in.m, use in.m.x
%
% out : Data Structure that stores the output information from the aircraft
%       out.val: +1, 0, -1 ( +1 - turn left, 0 - go straight, -1 - turn right)
% 
% state: 
%       any state used by the controller


% Initialize state
% if (isempty(state))
%     state.mode = 0; 
% end

% Code to generate controller output
% if (state.mode == 0)
%     out.val = +1;
%     state.mode = 1;
% elseif (state.mode == 1)
%     out.val = 0;
%     state.mode = 0;
% end

out_original_1 = direction(in);

% determine if two aircrafts could communicate with each other.
if(~isempty(in.m))
    out_original_2 = direction(in.m);
    [next_loc_x_1, next_loc_y_1] = nextLoc(in, out_original_1);
    [next_loc_x_2, next_loc_y_2] = nextLoc(in.m,out_original_2);
    if((next_loc_x_1 == next_loc_x_2)&&(next_loc_y_1 == next_loc_y_2))
        % colliding...
        % choose a random direction:
        if(out_original_1 == 0)    
            dirs = [-1, 1];
            randomDir = dirs(randperm(length(dirs),1));
        elseif(out_original_1 == 1)
            dirs = [-1, 0];
            randomDir = dirs(randperm(length(dirs),1));
        elseif(out_original_1 == -1)
            dirs = [1, 0];
            randomDir = dirs(randperm(length(dirs),1));
        end
        out.val = randomDir;
    else
        out.val = out_original_1;
    end  
else
    out.val = out_original_1;
end

return 








