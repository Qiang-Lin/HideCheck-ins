x=[ ];

y1=[ ];
y2=[ ];



axis([25 75 0.0 0.014]);
hold on;
plot(x,y1,'Color',[255/255,153/255,0],'LineWidth',1.2,'Marker','x');
plot(x,y2,'Color',[0,112/255,192/255],'LineWidth',1.2,'Marker','o');
% plot(x,y3,'Color',[155/255,155/255,155/255],'LineWidth',1.2,'Marker','^');


fitresult2=CreateTrendline(x,y1);
p2=plot( fitresult2);
p2(1).Color=[255/255,153/255,0];
p2(1).LineStyle='-.'

fitresult=CreateTrendline(x,y2);
p=plot( fitresult);
p(1).Color=[0,112/255,192/255];
p(1).LineStyle='--'



grid on
xlabel('Sensitive locations');
legend('Greedy','Genetic','Trendline(Greedy)','Trendline(Genetic)');  
ylabel('JS score');
% legend('User No.1','User No.52','User No.86');
% ylabel('Runtime/s');
