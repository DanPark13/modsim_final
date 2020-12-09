function [distance, height] = bouncing_xy(D_0, VX_0, cor)
%BOUNCING Summary of this function goes here
%   Detailed explanation goes here

%parameters
g = -9.81; % m/s^2
Radius = 0.001; % meters
%cor = 0.85; %coefficient of restitution - controls how much energy is lost
distance(1) = 0;

%simulation parameters
t_0 = 0;
t_fin = 60*10;  %10 minutes

init = [D_0, 0];    %initial distance, initial velocity

options = odeset('Events', @event_func, 'RelTol', 2, "Refine", 20);

[time, height] = ode45(@fall, [t_0, t_fin], init, options); 

% height(length(height),2) = -height(length(height),2);
timeDiff = 1;
while timeDiff > 0.1
    [time2, height2] = ode45(@rise, [time(end), t_fin], [0, cor*-height(end, 2)], options);
    timeDiff = time2(end) - time(end);
    time = [time; time2];
    height = [height; height2];
end
%time = [time1;time2];
%height = [height1; height2];

for i = 2: length(time)
    distance(end + 1) = VX_0 * time(i);
end
distance = distance';
    function res = fall(~, U)
        y = U(1);
        v = U(2);
        
        dvdt = g;
        dydt = v;
        
        %when line = 0, save the x value that hits that x-axis onto a
        %variable.
        
        res = [dydt; dvdt];
    end

    function res = rise(~, U)
        y = U(1);
        v = U(2);
        
        dydt = v;
        dvdt = g;
        
        res = [dydt; dvdt];
    end

    function [value, isterminal, direction] = event_func(~, U)
        y = U(1);
        y_fin = Radius;
        
        value = y - y_fin;
        isterminal = 1;
        direction = -1;
    end
end