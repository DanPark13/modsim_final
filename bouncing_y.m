function [time, height] = bouncing_y(D_0)
%BOUNCING Summary of this function goes here
%   Detailed explanation goes here

%parameters
g = -9.81;
Radius = 0.001;
%simulation parameters
t_0 = 0;
t_fin = 60*10;  %10 minutes

init = [D_0, 0];    %initial distance, initial velocity
endtime = odeset('Events', @event_func, 'RelTol', 1e-5);


[time, height] = ode45(@fall, [t_0, t_fin], init, endtime); 
    
    function res = fall(~, U)
        y = U(1);
        v = U(2);
        
        dvdt = g;
        dydt = v;
        
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

