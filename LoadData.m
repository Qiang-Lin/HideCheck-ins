function [userHist,DataCell] = LoadData()
    disp(['Data loading'])
    % userHist = dlmread('NYC_hist_per_user_sparse.txt');
    userHist = dlmread('NYC_hist_per_user.txt');
    % userHist = dlmread('TKY_hist_per_user.txt');
    [Data,DataText,DataCell]=xlsread('NYC_loc_histograms.xlsx');
    disp(['Data loaded'])
end