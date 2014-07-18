% Cory Welch
% University of Waterloo
% Department of Systems Design Engineering, 1B Student
%
% Overall MATLAB Basics and Syntax

clc, clear, format compact

fprintf('Tutorial Program Start\n\n');

% Variable Declaration

% Variable = Single item (technically a 1x1 matrix), should declare on
% definition to avoid possible errors, you can always change the value
% later right.
x = 0;
%Note: Like JavaScript the type is not required

% Matrix/Array = Multi Item by single name.
y = [];
%The brakets are not actually necessary but standard practice for MATLAB

% Cell Array, Array of Arrays
z = {};

%Strings, They Don't actually exist, they are really a array of characters
%that MATLAB is smart enough to see as a single word/sentence. NOTE: Double
%quotes do not work!
s = 'Hello World!';

% printing function can use either fprintf() or display(). Display is
% better for all types and doesnt require casting.
fprintf(s); %prints the value of s
fprintf('\n'); % prints a line break
display(s); %prints the variable name s = value is a better way

fprintf('\n');
% semi colons are not required!
s
% will be the same as
display(s);

fprintf('\n');
%Much like java you can get value of a particular charcter in the string
s2 = s(2)
% Gets the 2nd Character in the string. NOTE: counting starts at 1 not 0
% like most other programming languages
sSome = s(4:end)
%will return all values of s from the 4th to the end
sBackwards = s(end:-1:1)
%will return the string backwards
fprintf('\n');
%returns the length of a matrix
lengthOfS = length(s)

fprintf('\n');
%Adding Quotes to Strings
test = '"Wait I can''t", said Cory.'
%Single quotes use '' and " use " and ` use `
% also note both quotes act as a single entity
testBeforeQuoteChar11 = test(11)
testQuoteChar12 = test(12)
testAfterQuoteChar13 = test(13)

fprintf('\n');
%indexing is useful for determining if statements of the entire marix
indexL = s == 'l'

fprintf('\n');
%Matixes
m = [1,2,3;4,5,6;7:9]
%3x3 matrix, comma separate elements, semi colon separate rows
n = [1 2 3;4 5 6;7 8 9]
o = [1:9;9:-1:6,1:5]

fprintf('\n');
%space used instead of commas
rng(12345);

lowerBound =1;
upperBound = 20;

Rand = rand(1,5)*(upperBound-lowerBound) + lowerBound
Randi = randi([lowerBound,upperBound],1,5)

fprintf('\n');
Multiply1 = m * n
%regular Matrix multiplications, sizes must also agree!
Multiply2 = m.*n
%element by element multiplication m(1,1) * n(1,1) : m(3,2) * n(3,2) etc


%Matrix Transpose
RandTranspose = Rand'

fprintf('\n');
%Conditionals
sizeCompare = 5;
if length(s) > sizeCompare
   fprintf('Length of s is begger than ');
   fprintf(int2str(sizeCompare));
else
   fprintf('Length of s is smaller than ');
   fprintf(int2str(sizeCompare));
end

fprintf('\n');

%swtich statement - Kings Drinking Game Rules
card = '9';
fprintf('\nKings Rules:\nThe rule for %s is:\n',card);
switch card    
    case 'A'
        fprintf('Waterfall!');
    case '2'
        fprintf('Two for You');
    case '3'   
        fprintf('Three For Me');
    case '4'
        fprintf('Four for Whores');
    case '5'
        fprintf('Finger Master');
    case '6'
        fprintf('Six for Dicks');
    case '7'
        fprintf('Bubbles');
    case '8'
        fprintf('Eight Mate');
    case '9'
        fprintf('Nine Rhyme');
    case '10'
        fprintf('Categories');
    case 'J'
        fprintf('Never Have I Ever');
    case 'Q'
        fprintf('Question Master');
    case 'K'
        fprintf('Drink The Cup');
end
fprintf('\n');        

%Loops
fprintf('\nLooping Through s by for loop');
for i = 1:length(s);
    fprintf('\nCharacter ');
    fprintf(int2str(i));
    fprintf('= ');
    fprintf(s(i));
end

fprintf('\n\nLooping Through s by while loop');
j = 1;
while j < length(s)+1;
    fprintf('\nCharacter ');
    fprintf(int2str(j));
    fprintf('= ');
    fprintf(s(j));
    j = j+1;
end
fprintf('\n');

fprintf('\n');
%get user input
while true
    result = input('Who''s The Best??(q to quit) ', 's');
    switch result
        case {'Cory','Cory W','Cory Welch'}
            fprintf('\nCorrect!');
            break
        case {'Brian','Brian S','Brian So'}
            fprintf('\nNot who I was looking for, but still pretty besty');
            break
        case {'q','Q','quit','Quit'}
            break
        otherwise
            fprintf('\nNot Correct, Try Again\n');
    end  
end

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

%Create a x, y grid where each axis ranges from -8 -> 8 in 0.5
%increments
[x,y] = meshgrid(-8:0.5:8)

%Define our radius matrix (Notice the dot operator....!)
r = sqrt(x.^2 + y.^2);

%We need a z axis to plot a 3D graph, get it from r!
z = sin(r)./r;

%plat stuff
subplot(2,2,4)
mesh(z)


fprintf('\nAHAAHHHHHHHH');
