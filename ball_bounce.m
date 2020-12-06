%% Description

% Ball is projected upwards in the air from ground level
% Ball's trajectory will be graphed onto a plot

%% Newton's Equations

% Variables:
% - v: final velocity
% - u: initial velocity
% - s: displacement
% - a: acceleration
% - t: time taken

% Equations
% - v = d/t
% - v = u + at
% - s = ut + 1/2a*t^2
% - v^2 = u^2 + 2*a*s
% - s = 1/2(u+v)*t
% - s = v*t - 1/2*a*t^2
 
%% Variables 

clearvars;
x_v = 1;    % m/s (Velocity in x direction)
y_v = 15;   % m/s (Velocity in y direction)
g = 9.81;   % m/s^2 (Gravity constant)
t = 0;      % s (Time)
e = 0.9;    % Coefficient of Restitution
x(1) = 0;   % m (Initial position of ball in x direction)
y(1) = 0;   % m (Initial position of ball in y direction)

%% Calculated Variables

y_v = y_v * e;
flight_time = 2 * y_v / g;           % Second equation (rearranged)
time_increment = flight_time / 20;   % Time Increment (20 Steps)

%% Simulation

while t < flight_time
    t = t + time_increment;
    
    if((y_v - 0.5 * g * t^2 >= 0))              % Last equation 
        x(end + 1) = x_v * t + x_ref;           % V = d/t
        y(end + 1) = (y_v - 0.5 * g * t^2);     % Last equation
    end
end