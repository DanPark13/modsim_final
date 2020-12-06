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
% - v = u + at
% - s = ut + 1/2a*t^2
% - v^2 = u^2 + 2*a*s
% - s = 1/2(u+v)*t
% - s = v*t - 1/2*a*t^2
 
%% Variables 

clearvars;
cor = 0.9;     % Coefficient of Restitution
x_v = 1;    % m/s (Velocity in x direction)
y_v = 15;   % m/s (Velocity in y direction)
g = 9.81;   % m/s^2 (Gravity constant)
t = 0;      % s (Time)
x(1) = 0;   % m (Initial position of ball in x direction)
y(1) = 0;   % m (Initial position of ball in y direction)

%% Calculated Variables

x_pos_prev = x(end);            % Get position previous of ball
y_v = y_v * cor;                % Multiply coefficient of resitution to position
flight_time = 2 * y_v / g;      % First equation (v = u + at --> (v - u)/a = t)
time_increment = flight_time / 20;   % Time Increment (20 Steps)
t = 0;

%% Simulation

while t < flight_time
    t = t + time_increment;
    
    if((y_v - 0.5 * g * t) * t >= 0)
        x(end + 1) = x_v * t;
        y(end + 1) = (y_v - 0.5 * g * t) * t;
    end
end

%% Calculated Variables

while y_v > 0.0000001
    
    x_pos_prev = x(end);            % Get position previous of ball
    y_v = y_v * cor;                % Multiply coefficient of resitution to position
    flight_time = 2 * y_v / g;      % First equation (v = u + at --> (v - u)/a = t)
    time_increment = flight_time / 20;   % Time Increment (20 Steps)
    t = 0;

%% Simulation

    while t < flight_time
        t = t + time_increment;

        if((y_v - 0.5 * g * t) * t > -0.0000001)
            x(end + 1) = x_v * t + x_pos_prev;
            y(end + 1) = (y_v - 0.5 * g * t) * t;
        end
    end
end