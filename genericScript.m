%@Author Brian So

clc;

%Declaring Arrays!
%     A = [1 2; 2 1; 3 2] %Use space to seperate values
%     zeroes = zeros(3,2) %Lazy array of zeroes (rows, cols)
%     ones = ones(4) %Lazy array of ones (rows, cols)

% %Matlab knows what you mean...!!
%     firstInt = 1; %Type double
%     isinteger(firstInt)
%     
%     secondInt = 2; %Type double
%     isinteger(secondInt)
%         
%     firstFloat = 1.123
%     isfloat(firstFloat)
% 
% %Test out some boolean logic...
%     if firstInt ~= secondInt
%         'firstInt is not equal to secondInt'
%     end
% 
%     if firstInt == secondInt - 1
%         'firstInt is equal to secondInt - 1'
%     end
% 
% %Let's loop!
%     [rows, cols] = size(A); %Get the  row size and col size from matrix A
%     for m = 1:rows
%         A(m) % print out the first value of every row
%         %A(m) = rows
%     end
% 
%     counter = 0
%     while counter < 10
%         counter = counter + 1
%     end

%Create 100 linearly space elements from 0 -> 4*pi
x = linspace(0,4*pi,100);
%Get our matrix of y1 values by inserting x-values into a function
y1 = 60*sin(x);
%Get our matrix of y2 values by inserting x-values into a function
y2 = 70*cos(x);
%Get our matrix of y3 values by inserting x-values into a function
y3 = tan(x);
%Create first subplot(rows,columns,position)
subplot(2,2,1)
%Plot in the subplot, this will attach itself to the previously mentioned
%subplot! plot(xvals, yvals, prettyparams)
plot(x,y1,'--r')
subplot(2,2,2)
plot(x,y2,':g')
subplot(2,2,3)
plot(x,y3)

%Lets create a 3d plot :p
[x,y] = meshgrid(-8:0.5:8)
r = sqrt(x.^2 + y.^2);
z = sin(r)./r;
subplot(2,2,4)
mesh(z)

