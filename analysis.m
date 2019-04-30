function datset = analysis(data, region)
    temp = '000';
    if strcmp(region, 'West')
        stlist = ["WA","OR","CA","NV","UT","ID","MT","WY","CO","NM","AZ","AK","HI"];
        datset = struct;
        for j = length(stlist):-1:1
            datset(j).sum = [0,0,0];
            datset(j).count = 0;
            datset(j).tcount = 0;
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j)
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay];
                    datset(j).count = datset(j).count + 1;
                    datset(j).name = data(i).state;
                    if strcmp(data(i).drg(1:3),temp) ~= 1
                        temp = data(i).drg(1:3);
                        datset(j).tcount = datset(j).tcount + 1;
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1);
        end
    elseif strcmp(region, 'Midwest')
        stlist = ["ND","SD","NE","KS","MO","IA","MN","WI","IL","IN","MI","OH"];
        datset = struct;
        for j = length(stlist):-1:1
            datset(j).sum = [0,0,0];
            datset(j).count = 0;
            datset(j).tcount = 0;
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j)
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay];
                    datset(j).count = datset(j).count + 1;
                    datset(j).name = data(i).state;
                    if strcmp(data(i).drg(1:3),temp) ~= 1
                        temp = data(i).drg(1:3);
                        datset(j).tcount = datset(j).tcount + 1;
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1);
        end
    elseif strcmp(region, 'South')
        stlist = ["TX","OK","AR","LA","MS","AL","GA","SC","NC","VA","WV","KY","TN","FL","DE","MD","DC"];
        datset = struct;
        for j = length(stlist):-1:1
            datset(j).sum = [0,0,0];
            datset(j).count = 0;
            datset(j).tcount = 0;
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j)
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay];
                    datset(j).count = datset(j).count + 1;
                    datset(j).name = data(i).state;
                    if strcmp(data(i).drg(1:3),temp) ~= 1
                        temp = data(i).drg(1:3);
                        datset(j).tcount = datset(j).tcount + 1;
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1);
        end
    elseif strcmp(region, 'Northeast')
        stlist = ["ME","MA","NH","RI","CT","NJ","PA","VT","NY"];
        datset = struct;
        for j = length(stlist):-1:1
            datset(j).sum = [0,0,0];
            datset(j).count = 0;
            datset(j).tcount = 0;
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j)
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay];
                    datset(j).count = datset(j).count + 1;
                    datset(j).name = data(i).state;
                    if strcmp(data(i).drg(1:3),temp) ~= 1
                        temp = data(i).drg(1:3);
                        datset(j).tcount = datset(j).tcount + 1;
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1);
        end
     elseif strcmp(region, 'USA')
        stlist = ["ME","MA","NH","RI","CT","NJ","PA","VT","NY","WA","OR","CA",...
            "NV","UT","ID","MT","WY","CO","NM","AZ","AK","HI","ND","SD","NE","KS",...
            "MO","IA","MN","WI","IL","IN","MI","OH","TX","OK","AR","LA","MS","AL","GA",...
            "SC","NC","VA","WV","KY","TN","FL","DE","MD","DC"];
        datset = struct;
        for j = length(stlist):-1:1
            datset(j).sum = [0,0,0];
            datset(j).count = 0;
            datset(j).tcount = 0;
        end
    
        for j = 1:length(stlist)
            for i = 1:length(data)
                if data(i).state == stlist(j)
                    datset(j).sum = datset(j).sum + [data(i).avgcovered,data(i).avgtotpay,data(i).avgmedpay];
                    datset(j).count = datset(j).count + 1;
                    datset(j).name = data(i).state;
                    if strcmp(data(i).drg(1:3),temp) ~= 1
                        temp = data(i).drg(1:3);
                        datset(j).tcount = datset(j).tcount + 1;
                    end
                end
            end
            temp = '000';
        end
   
        for j = length(stlist):-1:1
            datset(j).avg = datset(j).sum/(datset(j).count-1);
        end
     end
end