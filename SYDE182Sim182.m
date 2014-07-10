% A box attached to a spring is released from rest at position x=10.  
% When the position of the box is less than 0.1m and the speed is less than
% 0.2m/s, the simulation stops.  
%
% The acceleration term in function MassSpringEqn is calculated using the
% spring force term, k*x, and a viscous damping term, B*x_dot.  The dynamic 
% equation is given by:
%
%  x_dot_dot = (-k*x - B*x_dot)/m
%
% This is a second order ordinary differential equation (ODE).  This must
% be changed to a first order differential equation.  Let:
%
%  x(1) = x
%
% Then 
%
%  d(x(1)/dt = x_dot.  
% 
% Let 
%
%  x(2) = x_dot
%
% Then
%
%  d(x(2))/dt = x_dot_dot 
%             = (-k*x - B*x_dot)/m
%             = (-k*x - B*x(1))/m
%
% So the set of first order differential equations are (note dx(1) means d(x(1))/dt):
%  
%  dx(1) = x(2)
%  dx(2) = (-k*x - B*x(1))/m
%
% This is what we are solving with the ODE solver.

% To run the simulation:
% Method 1) go to Debug and click on Run 
% Method 2) hit F5 
% Method 3) go to workspace and type the name of the main function (i.e.
% Sim182)

% Debugging
% Go to workspace to see error messages


function Sim182

close all;  % close all figures
clear all;  % clear all variables in workspace
clc;        % clear screen in workspace

m = 3;      % mass [kg]
k = 100;     % spring constant [N/m]
B = 100;      % damping coefficient [N/(m/s)]


ICs = [10 10];   % initial condition into the ODE solver:  [initial_position initial_velocity]

% options of the ODE solver: 
%   "MaxStep" is the maximum time step [s]
%   "Events" is the event that triggers termination of the simulation
%       The function "MassSpringEvents" is called at each time step by the ODE
%       solver
options = odeset('MaxStep', 0.01,'Events',@MassSpringEvents);
% ode45 is the variable time step ODE solver used to solve the dynamic
% equation.
%   t = nx1 [s]
%        where n is the number time step the ode solver uses
%   x = nx2
%       where x(n,1) is the position [m] over time
%       and x(n,2) is the velocity [m/s] over time
%   TE, YE, IE = don't need it .... but see Matlab HELP if you want the details
%   
%   ode45(@<Function describing dynamic equations>, [<Start Time> <End
%   Time>], <Initial Conditions>, options, <All the other variables you
%   need to pass to your dynamic equations>);
%
%   Note, the ode45 will run only as long as the time space (10 seconds in
%   this case), but the trigger, specified under "options", is used to terminate the solution
%   prematurely.

[t,x,TE,YE,IE] = ode45(@MassSpringEqn,[0 10], ICs, options, m, k, B);

% Plotting graphs

% figure; % show a free figure
% plot(t,x(:,1)); %plot(time,values) 
% xlabel('Time');
% ylabel('Position');
% title('Position of Mass');

% figure;
% plot(t,x(:,2));
% xlabel('Time');
% ylabel('Velocity');
% title('Velocity of Mass');

% figure;
% plot(t,(-k*x(:,1) - B*x(:,2))/m);  % Note that the ODE solver only returns 
%                                    % position and velocity.  To show acceleration, 
%                                    % it must re-evaluated from the position and
%                                    % velocity data.
% xlabel('Time');
% ylabel('Acceleration');
% title('Acceleration of Mass');


figure;
subplot(3,1,1); % sub-divide the figure window into 3 rows, 1 column, plots on the first section
plot(t,x(:,1));
ylabel('Position')

subplot(3,1,2); % sub-divide the figure window into 3 rows, 1 column, plots on the second section
plot(t,x(:,2));
ylabel('Velocity')

subplot(3,1,3); % sub-divide the figure window into 3 rows, 1 column, plots on the third section
plot(t,(-k*x(:,1) - B*x(:,2))/m);
xlabel('Time');
ylabel('Acceleration');


      
% --------------------------------------------------------------
function dx = MassSpringEqn(t,x, m, k, B)
% This function describes your dynamic equations as first order ODE's (see Intro).

dx = zeros(2,1);              % Create a column vector of 2 elements, each with zeros
dx(1) = x(2);                 % Velocity
dx(2) = (-k*x(1) - B*x(2))/m; % Acceleration


% --------------------------------------------------------------
function [Value,IsTerminal,Direction] = MassSpringEvents(t,x, m, k, B) 
% This function describes the conditions under which the ODE solver is
% terminated prematurely 

IsTerminal = 1;  % Leave as 1
Direction = 0;   % Leave as 0
Value = 1;       % When "Value" = 0, the simulation will terminate

% These are the conditions for which the simulation will terminate

if (abs(x(1)) < 0.1)     % If the magnitude of the position < 0.1
    if (abs(x(2)) < 0.2) % and the speed < 0.2 then
       Value = 0;        % terminate the simulation.
   end
end

