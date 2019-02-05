clear;
close all;
clc;

OR = zeros(4,8);
V = zeros(4,8);
HE = zeros(4,8);
turnover = zeros(1,8);
weights = zeros(501,16);

load BA1
i=1;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i:i+1) = HR.HR;

load BA2
i=2;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+1:i+2) = HR.HR;

load BA3
i=3;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+2:i+3) = HR.HR;

load BA4
i=4;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+3:i+4) = HR.HR;

load ODA1
for j=1:501
    H(j,:) = HR.HR(:,:,j);
end
i=5;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+4:i+5) = H;

load ODA2
for j=1:501
    H(j,:) = HR.HR(:,:,j);
end
i=6;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+5:i+6) = H;

load ODA3
for j=1:501
    H(j,:) = HR.HR(:,:,j);
end
i=7;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+6:i+7) = H;

load ODA4
for j=1:501
    H(j,:) = HR.HR(:,:,j);
end
i=8;
OR(:,i) = [s.OR_min;s.OR_max;s.OR_mean;s.OR_std];
HE(:,i) = [s.HE_min;s.HE_max;s.HE_mean;s.HE_std];
V(:,i) = [s.V_min;s.V_max;s.V_mean;s.V_std];
turnover(1,i) = s.turnover;
weights(:,i+7:i+8) = H;


subplot(2,4,1)
boxplot(weights(:,1:2))
title('DCC')
ylabel('BA','FontSize',12,'FontWeight','bold')
subplot(2,4,2)
boxplot(weights(:,3:4))
title('DBEKK')
subplot(2,4,3)
boxplot(weights(:,5:6))
title('DRBEKK')
subplot(2,4,4)
boxplot(weights(:,7:8))
title('DRDCC')

subplot(2,4,5)
boxplot(weights(:,9:10))
ylabel('ODA','FontSize',12,'FontWeight','bold')
subplot(2,4,6)
boxplot(weights(:,11:12))
subplot(2,4,7)
boxplot(weights(:,13:14))
subplot(2,4,8)
boxplot(weights(:,15:16))