clear; close all;clc;

%==========================================================================
%
%
%Figure4.4
%
%
%==========================================================================

sk=0:0.1:1;
for i = 1:4
subplot(5,4,i)
load('CS3_Ind_T60_p100_MC100')
plot(sk,FN.FN_identity(i,:),'b-o')
%ylim([0,1])
hold on
plot(sk,FN.FN_Videntity(i,:),'g-s')
hold on
plot(sk,FN.FN_market(i,:),'r-h')
hold on
plot(sk,FN.FN_common(i,:),'k-p')
hold on
plot(sk,FN.FN_constant(i,:),'c-+')
hold on
plot(sk,FN.FN_dcc(i,:),'m-d')
if i==1
ylabel('n=60','FontSize',10,'FontWeight','bold')
title("MV")
end
if i==2
    title("IV")
end
if i==3
    title("ERC")
end
if i==4
    title("MD")
end
end

for i = 1:4
subplot(5,4,i+4)
load('CS3_Ind_T120_p100_MC100')
plot(sk,FN.FN_identity(i,:),'b-o')
hold on
plot(sk,FN.FN_Videntity(i,:),'g-s')
hold on
plot(sk,FN.FN_market(i,:),'r-h')
hold on
plot(sk,FN.FN_common(i,:),'k-p')
hold on
plot(sk,FN.FN_constant(i,:),'c-+')
hold on
plot(sk,FN.FN_dcc(i,:),'m-d')
if i==1
ylabel('n=120','FontSize',10,'FontWeight','bold')
end
end


for i = 1:4
subplot(5,4,i+8)
load('CS3_Ind_T180_p100_MC100')
plot(sk,FN.FN_identity(i,:),'b-o')
hold on
plot(sk,FN.FN_Videntity(i,:),'g-s')
hold on
plot(sk,FN.FN_market(i,:),'r-h')
hold on
plot(sk,FN.FN_common(i,:),'k-p')
hold on
plot(sk,FN.FN_constant(i,:),'c-+')
hold on
plot(sk,FN.FN_dcc(i,:),'m-d')
if i==1
ylabel('n=180','FontSize',10,'FontWeight','bold')
end
end

for i = 1:4
subplot(5,4,i+12)
load('CS3_Ind_T3000_p100_MC100')
plot(sk,FN.FN_identity(i,:),'b-o')
hold on
plot(sk,FN.FN_Videntity(i,:),'g-s')
hold on
plot(sk,FN.FN_market(i,:),'r-h')
hold on
plot(sk,FN.FN_common(i,:),'k-p')
hold on
plot(sk,FN.FN_constant(i,:),'c-+')
hold on
plot(sk,FN.FN_dcc(i,:),'m-d')
if i==1
ylabel('n=3000','FontSize',10,'FontWeight','bold')
end
end

for i = 1:4
subplot(5,4,i+16)
load('CS3_Ind_T6000_p100_MC100')
plot(sk,FN.FN_identity(i,:),'b-o')
hold on
plot(sk,FN.FN_Videntity(i,:),'g-s')
hold on
plot(sk,FN.FN_market(i,:),'r-h')
hold on
plot(sk,FN.FN_common(i,:),'k-p')
hold on
plot(sk,FN.FN_constant(i,:),'c-+')
hold on
plot(sk,FN.FN_dcc(i,:),'m-d')
if i==1
ylabel('n=6000','FontSize',10,'FontWeight','bold')
end
end