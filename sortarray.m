function [num,name] = sortarray(num,name)
% Bubble sort
l = length(num);
while (l > 0)
    lnew = 0;
    for i = 2:l
        % Swap
        if (num(i) < num(i - 1))
            num = swap(num,i,i - 1);
            name = swap(name,i,i-1);
            lnew = i;
        end
    end
    l = lnew;
end
end


function z = swap(z,i,j)
temp = z(i);
z(i) = z(j);
z(j) = temp;
end