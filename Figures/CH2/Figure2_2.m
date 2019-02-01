clear;close all;clc

%==========================================================================
%
%Figure2.2
%
%==========================================================================

load DataAmases
load date

prices = Data;
returns = price2ret(Data);
t = datetime(date,'ConvertFrom','excel');
t.Format = 'MMMM d,y';

tc = datetime(date(2:end,:),'ConvertFrom','excel');
t.Format = 'MMMM d,y';

figure(1)
%WTI prices
subplot(2,4,1)
plot(t,prices(:,1),'r')
ylim([0 140]);
ylabel("WTI",'FontSize',10,'FontWeight','bold');
title('Spot Prices')
subplot(2,4,2)
plot(t,prices(:,3),'r')
ylim([0 140]);
title('Futures Prices')

%Brent Prices
subplot(2,4,5)
plot(t,prices(:,2),'g')
ylabel("Brent",'FontSize',10,'FontWeight','bold');
subplot(2,4,6)
plot(t,prices(:,4),'g')
ylim([0 140]);

%WTI Returns
subplot(2,4,3)
plot(tc,returns(:,1),'r')
title('Spot Returns')
ylim([-0.15 0.16]);
subplot(2,4,4)
plot(tc,returns(:,3),'r')
title('Futures Returns')
ylim([-0.15 0.16]);


subplot(2,4,7)
plot(tc,returns(:,2),'g')
ylim([-0.15 0.16]);
subplot(2,4,8)
plot(tc,returns(:,4),'g')
ylim([-0.15 0.16]);

