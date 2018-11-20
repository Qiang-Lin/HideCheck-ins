userHist = dlmread('NYC_hist_per_user.txt');
list=[96
469
549
611
658
669
930
1051
52
54
151
168
276
488
536
591
595
684
887
904
1074
6
740
753
86
296
435
455
554
783
903
400
710
948
345
410
449
666
829
969
680
1031
1
441
406
166
];
a=[];
for i=1:length(list)
    list(i)
    userHist1 = userHist(list(i),:);%select one user
    userHist1(find(userHist1==0)) = [];%delete the zero element
    a=[a;userHist1]; 
end

