clc, clear,  format compact

%enter bounds
lowerBound = 1;
upperBound = 2;

%enter n value
n = 100;

%no need the change these
length = (upperBound - lowerBound)/n;
x = lowerBound:length/100:upperBound;

%enter function here
fx = sqrt(1 + x.^(-4));

%enter type of integration estimation
type = 'simpson';

answer = numintegratenew(lowerBound,upperBound,n,type,fx);

fprintf('The Integral of f(x) as defined between the bounds %i and %i',lowerBound,upperBound);
fprintf('\nWith %i intervals',n);
fprintf('\nIs %f',answer);
