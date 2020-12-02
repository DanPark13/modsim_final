function [time, height] = bouncing_y(initialheight, mass)
%BOUNCING Summary of this function goes here
%   Detailed explanation goes here

%parameters
g = 9.81;

%simulation parameters
t_0 = 0;
t_fin = 60*10;  %10 minutes
v_0 = 0;

[time, height] = ode45(@bounce, [t_0, t_fin], v_0); %need to add event func

    function res = bounce(~, U)
        v = v_0 + (g*time)
    end
end

