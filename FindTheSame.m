[userHist,DataCell] = LoadData();%load the data
matrix=[];
for i = 1 : length(userHist)
    userHist1=userHist(i,:);
    userHist1(find(userHist1==0)) = [];%delete the zero element   
    loc = size(userHist1,2);
    fre = userHist1(1)+userHist1(2);
    matrix(i,1)=i;
    matrix(i,2)=loc;
    matrix(i,3)=fre;
end
