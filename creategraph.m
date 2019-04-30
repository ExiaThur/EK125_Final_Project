function creategraph(state, val, set, region)
    y = val; %make y vector into val array
    xtemp = 1:(length(val)); %allocate x tick labels
    x = cell(1,length(state)); %set x tick labels
    for i = 1:length(state)
        x{i} = state(i,1:2);
    end
    figure('Name','Data Plot', 'NumberTitle', 'off', 'WindowState', 'maximized');
	bar(y); %create bar graph
    bardisp = gca; %get current axis
    bardisp.YAxis.Exponent = 0;
    tit = sprintf('%s %s Bar Plot', region, set); %set the description of the graph
    title(tit); %set title
    %set axes
    xticks(xtemp);
	xticklabels(x);
    xlabel('State');
    ylabel('Value');
    
    grid on; %display grid
end