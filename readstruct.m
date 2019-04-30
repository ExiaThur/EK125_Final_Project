%[~,~,raw] = xlsread('Inpatient_Prospective_Payment_System__IPPS__Provider_Summary_for_the_Top_100_Diagnosis-Related_Groups__DRG__-_FY2011.xlsx');
data = struct;
for i = length(raw):-1:2
 data(i-1).drg = raw{i,1};
 data(i-1).state = raw{i,6};
 data(i-1).discharge = raw{i,9};
 data(i-1).avgcovered = raw{i,10};
 data(i-1).avgtotpay = raw{i,11};
 data(i-1).avgmedpay = raw{i,12};
end
[west, midwest, northeast, south] = regions(data);
hello = analwest(data);