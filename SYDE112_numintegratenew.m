function sum = numintegratenew(x_low,x_hi,numint,typeint,fx)

%Numerical Integrator created by Alex Shum, Edited by Cory Welch
%This is a numerical integrator coded to illustrate the difference
%between the different types of numerical integration. Here is a
%description of the input variables.
% x_low:    Lower limit of x
% x_hi:     High limit of x
% numint:   Number of Equally Spaced Intervals
% fx: is the function coming in. requires the x already be calculated
% typeint:  Type of integration, type in 'right', 'left', 'trapezoidal', 'midpoint' or
%           'simpson' (parabolic only), for 'simpson': interval number should be even. 
% In the command line, type something like (and change around the variables as you please):
% sum = numintegrate(0, 10, 20, 'trapezoidal')
% (without the %)
% The output sum gives the value of the integral using the approximation
% you've chosen. If you really want to see the difference in how these
% things approximate, choose a smaller number of variables.

% Note, in all the pictures, area above the x-axis is positive, area below
% the x-axis is negative.



length = (x_hi - x_low)/numint;
x_value = x_low:length:x_hi;
f_value = fx;

figure(1); clf;
x = x_low:length:x_hi;

hold on
sum = 0;
%left

switch typeint
    case 'left'
        title('Numerical Integration Using Left Endpoint')
        for i = 1:numint
            % plot([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i) f_value(i) 0],'k','linewidth',2)
            fill([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i) f_value(i) 0],'r','linewidth',1)
            %Sum using left endpoint
            sum = sum + length*f_value(i);
        end
% 
    case 'right'
        title('Numerical Integration Using Right Endpoint')
        for i = 1:numint
   %plot([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i+1) f_value(i+1) 0],'k','linewidth',2)
            fill([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i+1) f_value(i+1) 0],'r','linewidth',1)
            %Sum using left endpoint
            sum = sum + length*f_value(i+1);
        end
    case 'trapezoidal'
        title('Numerical Integration Using Trapezoidal Rule')
        for i = 1:numint
   %plot([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i+1) f_value(i) 0],'k','linewidth',2)
            fill([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_value(i+1) f_value(i) 0],'r','linewidth',1)
            %Sum using Trapezoidal Rule
            sum = sum + length*(f_value(i) + f_value(i+1))/2;
        end
    case 'midpoint'
        title('Numerical Integration Using Midpoint Rule')
        %Find out what value of f is at the midpoint of each interval
        f_mid = fx;
        for i = 1:numint
            fill([x_value(i) x_value(i+1) x_value(i+1) x_value(i) x_value(i)],[0 0 f_mid(i) f_mid(i) 0],'r','linewidth',1)
            %Sum using Midpoint Rule
            sum = sum + length*f_mid(i);
        end
    case 'simpson'
        title('Numerical Integration Using Simpson''s Parabolic Rule')
        for i = 1:2:numint
            xx = x_value(i):(x_value(i+2)-x_value(i))/200:x_value(i+2);
            %Lagrange Polynomial Interpretation, don't worry about it, it
            %just lets me draw the pretty picture.
            parabola = f_value(i)*(xx - x_value(i+1)).*(xx-x_value(i+2))/(2*length^2) + f_value(i+1)*(xx-x_value(i)).*(xx-x_value(i+2))/(-length^2) + f_value(i+2)*(xx-x_value(i)).*(xx-x_value(i+1))/(2*length^2);
            fill([x_value(i) [xx] x_value(i+2) x_value(i)],[0 [parabola] 0 0],'r','linewidth',1)
            %Sum using Simpson's Parabolic Rule.
            sum =  sum + ((length)/3)*(f_value(i) + 4*f_value(i+1) + f_value(i+2));
        end


end

fplot = fx;
plot(x,fplot,'linewidth',3);
%Just doing some readjusting with the axis, it scales it properly.
 axis([x_low x_hi min(min(min(fplot)-2,-0.1*max(abs(fplot))),0) max(max(max(fplot)+2,0.1*max(abs(fplot))),0)])
%axis tight

