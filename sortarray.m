function [num,name] = sortarray(num,name)
% Bubble-sort
l = length(num);
while (l > 0)
    lnew = 0;
    for i = 2:l
        if (num(i) < num(i - 1))
            num = swap(num,i,i - 1); %swap the number array 
            name = swap(name,i,i-1); %swap the statelist array
            lnew = i;
        end
    end
    l = lnew;
end
end


function z = swap(z,i,j) %swapping function
temp = z(i);
z(i) = z(j);
z(j) = temp;
end