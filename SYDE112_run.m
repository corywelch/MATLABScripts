clc, clear,  format compact

%enter bounds
lowerBound = 1;
upperBound = 2;

%enter n value
n = 10;

%no need the change these
length = (upperBound - lowerBound)/n;
x = lowerBound:length:upperBound;

%enter function here
fx =x.^5;

%enter type of integration estimation
type = 'simpson';

answer = numintegratenew(lowerBound,upperBound,n,type,fx);


fprintf('The Integral of f(x) as defined between the bounds %i and %i',lowerBound,upperBound);
fprintf('\nWith %i intervals',n);
fprintf('\nIs %f',answer);
