clc
clear
close all
[userHist,DataCell] = LoadData();%load the data
%-----------------------------------%
%define the outputs
bestHist=[];
origHist=[];
bestJs=[];
useTime=[];
%-----------------------------------%
%ID of the user needed to be hidden
hiddenList =[1];
%-----------------------------------%
%used for case study
senInfo={'Airport';'American Restaurant';'Bar'};
%-----------------------------------%
%used for case study
% senIndex = zeros(length(hiddenList),20);
% senIndex=TextTransform(hiddenList,senInfo,DataCell,userHist);
%-----------------------------------%
%define the sensitive locations
senIndex=[1;2];
myPar=parpool(2);%parallel computing
tt1=clock;
for i = 1:length(hiddenList)
    disp(['Protecting the user  ',num2str(hiddenList(i))]);
    userHist1 = userHist(hiddenList(i),:);%select one user
    userHist1(find(userHist1==0)) = [];%delete the zero element
%     senIndex1 = senIndex(i,:); %if want to use the TextTransform
%     senIndex1(find(senIndex1==0)) = [];
    t1=clock;
%     [bestHist1,bestJs1] = GreedyHideForOne(userHist1,senIndex);
    [bestHist,bestJs1] = GAHideForOne(userHist1,senIndex);
    t2=clock;
    time = etime(t2,t1);
    useTime=[useTime;time];
    bestJs=[bestJs;bestJs1];
    disp(['Protected the user  ',num2str(hiddenList(i))]);
%     SanitizedHistogram(bestHist1);%save to .txt file

%---------------------------------------------------------
%show the sanitised histogram
    figure();
    compHist=[userHist1',bestHist'];
    h=bar(compHist);
    set(gcf,'position',[100 100 1000 600]);
    legend('Original Histogram','Sanitized Histogram')
    xlabel('Locaiton');
    ylabel('Frequency'); 
end
tt2=clock;
disp(['runtime with parallel is: ',num2str(etime(tt2,tt1))]);% the parellel time
% disp(['runtime without parallel is: ',num2str(sum(useTime))]);%time without parallel
delete(myPar)

