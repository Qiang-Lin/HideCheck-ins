function senIndex = TextTransform(hiddenList,senInfo,DataCell,userHist)
senIndex = zeros(length(hiddenList),20);
for i=1:length(hiddenList)
    userHist1 = userHist(hiddenList(i),:);%select one user
    userHist1(find(userHist1==0)) = [];%delete the zero element
    userLen=length(userHist1);
    count=0;
    senCount=0;
    for j = 1:length(DataCell)
        if (isequal(DataCell{j,1},hiddenList(i)) && count<=userLen)
            count=count+1;
            if ismember(DataCell(j,2),senInfo)
                senCount=senCount+1;
                senIndex(i,senCount)=count;
            end
        end
        if count>userLen || senCount==length(senInfo)
            break;
        end
    end
end
end