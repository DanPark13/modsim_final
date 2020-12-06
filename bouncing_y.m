function [time, height] = bouncing_y(D_0)
%BOUNCING Summary of this function goes here
%   Detailed explanation goes here

%parameters
g = -9.81; % m/s^2
Radius = 0.001; % meters
cor = 0.85; %coefficient of restitution - controls how much energy is lost

%simulation parameters
t_0 = 0;
t_fin = 60;  %1 minutes

init = [D_0, 0];    %initial distance, initial velocity


options = odeset('Events', @event_func, 'RelTol', 2, "Refine", 10);

[time1, height1] = ode45(@fall, [t_0, t_fin], init, options); 

% height(length(height),2) = -height(length(height),2);

[time2, height2] = ode45(@rise, [1.428, t_fin], [0, cor*-height1(length(height1), 2)], options);

%%%%%%%%%%%%%%% HOW DO WE MAKE THE 1.428 automated?

time = [time1;time2];
height = [height1; height2];

    function res = fall(~, U)
        y = U(1);
        v = U(2);
        
        dvdt = g;
        dydt = v;
        
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