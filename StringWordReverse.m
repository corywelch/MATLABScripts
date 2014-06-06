%Cory Welch
%University of Waterloo
%Department of Systmes Design Engineering
%
%Reverse the Order of a string by word

str = 'abc def ghij';

index = find(str == ' ');

numWords = length(index);
strLen = length(str);

newString = [];

for x = strLen:-1:1  
    i = find(index == x);
    if i
        if i == length(index)
            nextSpace = strLen;    
        else
            nextSpace = index(i+1);
        end
        for y = x:nextSpace;          
            newString = [newString, str(y)];
        end
        space = ' ';
        newString = [newString, space];
        
    end
    if x == 1
       for y = x:index(1)
            newString = [newString, str(y)];
       end
    end
end

display(newString);
