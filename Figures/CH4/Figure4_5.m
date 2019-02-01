clear;close all;clc;

%==========================================================================
%
%
%Figure4.5
%
%
%==========================================================================

DATA1 = [0.7	0.4	0.8	0.8	1	1	1	1	1	0.8	1	1
0.9	0.5	0.9	0.9	1	0.9	1	1	1	1	1	1
0.1	0.1	1	1	1	0.1	0.1	0.9	1	0.1	0.1	0.9
0.1	0.5	0.2	1	0.1	0.9	0.5	1	0.1	1	1	1
0.3	0.1	1	1	0.1	0.1	1	1	0.1	0.1	1	1
0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	1	0.1	0.1	0.6];
DATA2 = [0.6	0.6	0.8	0.7	1	0.9	1	1	1	0.9	1	1
0.8	0.8	0.9	0.9	1	0.9	1	1	1	1	1	1
0.1	0.1	1	1	1	0.1	1	1	1	0.1	0.1	0.9
0.1	0.8	0.3	1	0.1	0.9	0.5	1	0.1	1	1	1
0.8	0.1	1	0.9	0.2	0.2	1	1	0.1	0.1	1	1
0.1	0.2	0.2	0.1	0.2	0.2	0.2	0.1	0.1	0.1	0.1	0.1];
DATA3 = [0.5	0.7	0.9	0.8	0.8	0.6	1	0.9	1	0.6	1	1
0.7	0.9	1	0.9	0.9	0.8	1	1	1	1	1	1
0.2	0.1	1	1	0.7	0.1	1	0.9	0.8	0.1	1	0.8
0.1	0.9	0.4	1	0.1	0.8	0.4	1	0.1	1	0.9	1
1	0.1	1	1	0.4	0.1	1	1	0.1	0.1	1	1
0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1];
DATA4 = [0.1	0.1	0.1	0.1	1	1	1	1	1	1	1	1
0.3	0.1	0.1	0.3	1	1	1	1	1	1	1	1
0.1	0.1	0.1	1	0.5	0.1	1	0.8	1	0.2	1	0.9
0.1	0.1	0.1	1	0.1	1	1	1	0.1	1	1	1
1	0.1	0.1	0.7	1	0.1	1	1	1	0.2	1	1
0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1];
DATA5 = [1	1	1	1	0.7	0.1	0.1	0.8	1	1	1	1
1	1	1	1	1	0.1	0.7	1	1	1	1	1
0.1	0.1	1	1	0.1	0.1	1	1	0.4	0.1	1	0.8
0.1	1	1	1	0.1	0.1	0.1	1	0.1	1	1	1
1	0.1	1	1	1	0.1	1	1	1	0.9	1	1
0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1];

dimension = [1 2 3];

% figure(1)
% subplot(5,4,1)
% i=1;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
% ylim([0 1])
% hold on
% i=2;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'gs')
% ylim([0 1])
% hold on
% i=3;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'rH')
% ylim([0 1])
% hold on
% i=4;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'kp')
% ylim([0 1])
% hold on
% i=5;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'c+')
% ylim([0 1])
% hold on
% i=6;
% scatter(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'md')
% ylim([0 1])
% title('MV')
% xticks(dimension)
% xticklabels({'p=10','p=50','p=100'})



figure(1)
subplot(5,6,1)
plot(dimension,[DATA1(1,1) DATA1(1,5) DATA1(1,9)],'bo')
ylabel('n=60','FontSize',10,'FontWeight','bold')
ylim([0 1])
hold on
plot(dimension,[DATA1(1,2) DATA1(1,6) DATA1(1,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(1,3) DATA1(1,7) DATA1(1,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(1,4) DATA1(1,8) DATA1(1,12)],'kx')
ylim([0 1])
title('Id')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=2;
subplot(5,6,i)
plot(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,2) DATA1(i,6) DATA1(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,3) DATA1(i,7) DATA1(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,4) DATA1(i,8) DATA1(i,12)],'kx')
ylim([0 1])
title('VId')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=3;
subplot(5,6,i)
plot(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,2) DATA1(i,6) DATA1(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,3) DATA1(i,7) DATA1(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,4) DATA1(i,8) DATA1(i,12)],'kx')
ylim([0 1])
title('SI')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=4;
subplot(5,6,i)
plot(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,2) DATA1(i,6) DATA1(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,3) DATA1(i,7) DATA1(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,4) DATA1(i,8) DATA1(i,12)],'kx')
ylim([0 1])
title('CV')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=5;
subplot(5,6,i)
plot(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,2) DATA1(i,6) DATA1(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,3) DATA1(i,7) DATA1(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,4) DATA1(i,8) DATA1(i,12)],'kx')
ylim([0 1])
title('CC')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=6;
subplot(5,6,i)
plot(dimension,[DATA1(i,1) DATA1(i,5) DATA1(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,2) DATA1(i,6) DATA1(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,3) DATA1(i,7) DATA1(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA1(i,4) DATA1(i,8) DATA1(i,12)],'kx')
ylim([0 1])
title('EWMA')
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=1;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
ylabel('n=120','FontSize',10,'FontWeight','bold')
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=2;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=3;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=4;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=5;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=6;
subplot(5,6,i+6)
plot(dimension,[DATA2(i,1) DATA2(i,5) DATA2(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,2) DATA2(i,6) DATA2(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,3) DATA2(i,7) DATA2(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA2(i,4) DATA2(i,8) DATA2(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=1;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
ylabel('n=180','FontSize',10,'FontWeight','bold')
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=2;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=3;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=4;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=5;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=6;
subplot(5,6,i+12)
plot(dimension,[DATA3(i,1) DATA3(i,5) DATA3(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,2) DATA3(i,6) DATA3(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,3) DATA3(i,7) DATA3(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA3(i,4) DATA3(i,8) DATA3(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=1;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
ylabel('n=3000','FontSize',10,'FontWeight','bold')
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=2;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=3;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=4;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=5;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=6;
subplot(5,6,i+18)
plot(dimension,[DATA4(i,1) DATA4(i,5) DATA4(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,2) DATA4(i,6) DATA4(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,3) DATA4(i,7) DATA4(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA4(i,4) DATA4(i,8) DATA4(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=1;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
ylim([0 1])
ylabel('n=6000','FontSize',10,'FontWeight','bold')
hold on
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=2;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=3;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=4;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=5;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
ylim([0 1])
hold on
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})

i=6;
subplot(5,6,i+24)
plot(dimension,[DATA5(i,1) DATA5(i,5) DATA5(i,9)],'bo')
hold on
ylim([0 1])
plot(dimension,[DATA5(i,2) DATA5(i,6) DATA5(i,10)],'gs')
hold on
ylim([0 1])
plot(dimension,[DATA5(i,3) DATA5(i,7) DATA5(i,11)],'r^')
hold on
ylim([0 1])
plot(dimension,[DATA5(i,4) DATA5(i,8) DATA5(i,12)],'kx')
hold on
ylim([0 1])
xticks(dimension)
xticklabels({'p=10','p=50','p=100'})
