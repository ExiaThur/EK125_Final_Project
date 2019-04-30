function [vallist, statelist] = runmain(app)
    [~,~,raw] = xlsread('MediData.xlsx'); %read information from the excel file into a cell array
    %prepare the structure so that you can analyze data
    data = struct;
    for i = length(raw):-1:2
        data(i-1).drg = raw{i,1};
        data(i-1).state = raw{i,6};
        data(i-1).discharge = raw{i,9};
        data(i-1).avgcovered = raw{i,10};
        data(i-1).avgtotpay = raw{i,11};
        data(i-1).avgmedpay = raw{i,12};
    end
    
    %show that the app is sorting data with text and yellow lamp color   
    app.Label.Text = 'Sorting Data...';
    app.Lamp.Color = [1 1 0];
    drawnow
    
    %call analysis file to get a new structure with all the information 
    %analyzed
    datset = analysis(data,app.area);
    
    %make a 4 arrays so that you can sort the number according to the
    %numerical order
    charge = zeros(1,length(datset));
    pay = charge;
    treat = charge;
    name = string(pay);
    
    %calculate the covered charge, patient payment, and the number of
    %treatments per state in the region selected
    for i = 1:length(datset)
        charge(i) = datset(i).avg(1);
        pay(i) = datset(i).avg(2)- datset(i).avg(3);
        treat(i) = datset(i).tcount;
        name(i) = convertCharsToStrings(datset(i).name);
    end
    
    %sort the correct array depending on the user input
    if app.AscendingButton.Value == true%sorted min to max
        if strcmp(app.DropDown.Value,'Coverage Charge')
            [vallist, statelist] = sortarray(charge,name); 
        elseif strcmp(app.DropDown.Value,'Patient Payment')
            [vallist, statelist] = sortarray(pay,name);
        else
            [vallist, statelist] = sortarray(treat,name);
        end
    else %sorted max to min
        if strcmp(app.DropDown.Value,'Coverage Charge')
            [vallist, statelist] = sortarray(charge,name);%normal sorting
            %flip to make sure it is opposite order
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        elseif strcmp(app.DropDown.Value,'Patient Payment')
            [vallist, statelist] = sortarray(pay,name);
            %flip to make sure it is opposite order
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        else
            [vallist, statelist] = sortarray(treat,name);
            %flip to make sure it is opposite order
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        end
    end
    
    if strcmp(app.area,'USA')
        %if region selected is USA, just print top 20
        statelist = statelist';
        statelist = statelist(1:20);
        statelist = char(statelist);
        vallist = vallist(1:20);
    else
        %otherwise, print whole array
        statelist = statelist';
        statelist = char(statelist);
    end
end