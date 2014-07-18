% Cory Welch
% University of Waterloo
% Department of Systems Design Engineering

% Basic Graphing File

clc, clear, format compact


% Set x values
x = 0:0.01:10;

% Set y values, element by element calculations!!
y = x.^2;

y2 = x.^(-1);

r = sqrt(x.^2 + y.^2);

POI = find(y==y2);
POIx = x(POI);
POIy = y(POI);

%Plot the graph, x and y graph
%plot(x,y);
%plot(x,y,'linewidth',5,'color','Red');
%plot(x,y,':o');
% All LineSpecs: http://www.mathworks.com/help/matlab/ref/plot.html#inputarg_LineSpec
%can add things like linewidth, color, marker symbols etc

subplot(4,2,1:2);
%Plot more than one line on same graph
plot(x,y,'r',x,y2,'g',POIx,POIy,'bo','MarkerSize',10,'MarkerFaceColor','auto');

%Plot change limits of graph display
set(gca,'Xlim',[0,5],'YLim',[0,5]);

%Add title and labels to plot
title('Cory''s Figure');
xlabel('X Axis','FontName','Courier','Color','Blue');
ylabel('Y Axis','FontSize',30);
%FontName, FontSize, Color, 

%Turn on Grid
grid on;


% Plot multiple graphs, using subplots
subplot(4,2,3);
plot(x,y,'r');
title('y = x^2');
set(gca,'Xlim',[0,5],'YLim',[0,5]);
grid on;

subplot(4,2,4);
plot(x,y2,'g');
title('y = 1/x');
set(gca,'Xlim',[0,5],'YLim',[0,5]);
grid on;

subplot(4,2,5:6);
x2 = 0:pi/16:10*pi;
y3 = sin(x2)./x2;
plot(x2,y3);
title('y = sinc(x) = sin(x)/x');
set(gca,'XLim',[0,10*pi],'YLim',[-1,1]);
grid on;

subplot(4,2,7:8);
%Create a x, y grid where each axis ranges from -8 -> 8 in 0.5
%increments
[x,y] = meshgrid(-2*pi:0.5:2*pi);

%Define our radius matrix
r = sqrt(x.^2 + y.^2);

%We need a z axis to plot a 3D graph, get it from r!
z = sin(r)./r;

%plat stuff
mesh(z);
title('z = sinc(x,y)');

