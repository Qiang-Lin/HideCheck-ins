clc
clear
close all

[userHist,DataText] = LoadData();%load the data

bestHist=[];
bestJs=[];
useTime=[];

senInfo={'Airport';'American Restaurant';'Bar'};
senIndex = [9,10;
6,2,22;
6,7,10,11;
];

list =[
1

];

index=[];
result=[];
% myPar=parpool(4);
tt1=clock;
parfor i = 1:length(list)
    list(i)
    
    userHist1 = userHist(list(i),:);%select one user
    userHist1(find(userHist1==0)) = [];%delete the zero element
    
    t1=clock;
%     [bestHist1,bestJs1] = GreedyHideForOne(userHist1,senIndex);
    [bestHist1,bestJs1] = GAHideForOne(userHist1,senIndex);
    
    t2=clock;
    time = etime(t2,t1);
    
    useTime=[useTime;time];
    bestJs=[bestJs;bestJs1];
    index=[index;i]; 
  
end
tt2=clock;
ttime=etime(tt2,tt1)
sum(useTime)
% delete(myPar)