
function output = f(x)
% the "." in front of an operation means you're doing the operation
% element-wise on a vector. You don't need it when multiplying or adding constants.

%f(x) = 1/x
output = x.^(-1); 

%f(x) = e^(-0.1x)*sin(x)*cos(x)
%output = exp(x).*sin(x).*cos(x)+20;


end
