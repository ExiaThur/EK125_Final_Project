function datset = analysis(data, region)
    temp = '000';
    if strcmp(region, 'West') %if user input for region is West
        stlist = ["WA","OR","CA","NV","UT","ID","MT","WY","CO","NM","AZ","AK","HI"]; %list of states in region
        datset = struct; %initialize structure
        for j = length(stlist):-1:1 %set the summing variables
            datset(j).sum = [0,0,0]; %sum of all raw datas
            datset(j).count = 0; %count number of data read per state
            datset(j).tcount = 0; %count number of treatments
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j) %if datset state is the same as the one in the list
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay]; %sum up the raw data
                    datset(j).count = datset(j).count + 1; %count goes up by one
                    datset(j).name = data(i).state; %name is set to the state
                    if strcmp(data(i).drg(1:3),temp) ~= 1 %if the treatment number is not the same as current,
                        temp = data(i).drg(1:3); %make the new treatment num read into current
                        datset(j).tcount = datset(j).tcount + 1; %add treatmeant count
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1); %calculate the average
        end
    elseif strcmp(region, 'Midwest') %if user input for region is Midwest
        stlist = ["ND","SD","NE","KS","MO","IA","MN","WI","IL","IN","MI","OH"];
             datset = struct; %initialize structure
        for j = length(stlist):-1:1 %set the summing variables
            datset(j).sum = [0,0,0]; %sum of all raw datas
            datset(j).count = 0; %count number of data read per state
            datset(j).tcount = 0; %count number of treatments
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j) %if datset state is the same as the one in the list
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay]; %sum up the raw data
                    datset(j).count = datset(j).count + 1; %count goes up by one
                    datset(j).name = data(i).state; %name is set to the state
                    if strcmp(data(i).drg(1:3),temp) ~= 1 %if the treatment number is not the same as current,
                        temp = data(i).drg(1:3); %make the new treatment num read into current
                        datset(j).tcount = datset(j).tcount + 1; %add treatmeant count
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1); %calculate the average
        end
    elseif strcmp(region, 'Northeast') %if user input for region is Northeast
        stlist = ["ME","MA","NH","RI","CT","NJ","PA","VT","NY"];
             datset = struct; %initialize structure
        for j = length(stlist):-1:1 %set the summing variables
            datset(j).sum = [0,0,0]; %sum of all raw datas
            datset(j).count = 0; %count number of data read per state
            datset(j).tcount = 0; %count number of treatments
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j) %if datset state is the same as the one in the list
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay]; %sum up the raw data
                    datset(j).count = datset(j).count + 1; %count goes up by one
                    datset(j).name = data(i).state; %name is set to the state
                    if strcmp(data(i).drg(1:3),temp) ~= 1 %if the treatment number is not the same as current,
                        temp = data(i).drg(1:3); %make the new treatment num read into current
                        datset(j).tcount = datset(j).tcount + 1; %add treatmeant count
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1); %calculate the average
        end
     elseif strcmp(region, 'USA') %if user input for region is USA
        stlist = ["ME","MA","NH","RI","CT","NJ","PA","VT","NY","WA","OR","CA",...
            "NV","UT","ID","MT","WY","CO","NM","AZ","AK","HI","ND","SD","NE","KS",...
            "MO","IA","MN","WI","IL","IN","MI","OH","TX","OK","AR","LA","MS","AL","GA",...
            "SC","NC","VA","WV","KY","TN","FL","DE","MD","DC"];
             datset = struct; %initialize structure
        for j = length(stlist):-1:1 %set the summing variables
            datset(j).sum = [0,0,0]; %sum of all raw datas
            datset(j).count = 0; %count number of data read per state
            datset(j).tcount = 0; %count number of treatments
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j) %if datset state is the same as the one in the list
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay]; %sum up the raw data
                    datset(j).count = datset(j).count + 1; %count goes up by one
                    datset(j).name = data(i).state; %name is set to the state
                    if strcmp(data(i).drg(1:3),temp) ~= 1 %if the treatment number is not the same as current,
                        temp = data(i).drg(1:3); %make the new treatment num read into current
                        datset(j).tcount = datset(j).tcount + 1; %add treatmeant count
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1); %calculate the average
        end
    end
end