% function [userIndex] = SearchUser()
clear
clc
a=[];
senInfo={'Airport','Bar'};
[Data,DataText,DataCell]=xlsread('NYC_proj_sortUID_loc1.xlsx');
for i = 1:length(DataText)
    if isequal(DataText(i,2),senInfo(1))
        a=[a DataText(i,1)];
    end
end
userIndex=unique(a);
% end