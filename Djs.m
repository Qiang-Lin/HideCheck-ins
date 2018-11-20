function f = Djs(x,userHist,senIndex,count)
    %define the penalised function
    x=round(x);
    len = length(userHist);
    newHist=zeros(1,len);
    f=1;
    j=0;
    if sum(x)==count
        for i=1:len
            if ~ismember(i,senIndex)
                j=j+1;
                newHist(i)=userHist(i)+x(j);
            end
        end
        f = CalculateJs(newHist,userHist);
    else
        f = abs(count-sum(x))^2+CalculateJs(newHist,userHist);
    end
end
    