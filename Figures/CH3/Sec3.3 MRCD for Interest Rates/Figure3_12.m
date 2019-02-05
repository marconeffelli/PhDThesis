close all; clear; clc;

%==========================================================================
%
%
%Figure3.12 US term structure impact of different principal components
%
%
%==========================================================================

load("Figure3_11and12")

A = [0,0.25/12, 1/12,2/12,3/12,6/12,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,20,25,30];
subplot(3,2,1)
plot(A,COEFF_sample(:,1),'-*')
hold on
plot(A,COEFF_sample(:,2),'-*')
hold on
plot(A,COEFF_sample(:,3),'-*')
ylabel('Change in spot rate')
xlabel('Maturity')
%legend('PC1','PC2','PC3')
%axis([0 30 -0.7 0.7])
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,2)
plot(A,COEFF_shrinkage(:,1),'-*')
hold on
plot(A,COEFF_shrinkage(:,2),'-*')
hold on
plot(A,COEFF_shrinkage(:,3),'-*')
ylabel('Change in spot rate')
xlabel('Maturity')
%legend('PC1','PC2','PC3')
axis([0 30 -0.7 0.7])
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,3)
plot(A,COEFF_Nshrinkage(:,1),'-*')
hold on
plot(A,COEFF_Nshrinkage(:,2),'-*')
hold on
plot(A,COEFF_Nshrinkage(:,3),'-*')
ylabel('Change in spot rate')
xlabel('Maturity')
%legend('PC1','PC2','PC3')
axis([0 30 -0.7 0.7])
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,4)
plot(A,COEFF_MCD(:,1),'-*')
hold on
plot(A,COEFF_MCD(:,2),'-*')
hold on
plot(A,COEFF_MCD(:,3),'-*')
ylabel('Change in spot rate')
xlabel('Maturity')
%legend('PC1','PC2','PC3')
axis([0 30 -0.7 0.7])
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,5)
plot(A,COEFF_MRCD(:,1),'-*')
hold on
plot(A,COEFF_MRCD(:,2),'-*')
hold on
plot(A,COEFF_MRCD(:,3),'-*')
ylabel('Change in spot rate')
xlabel('Maturity')
%legend('PC1','PC2','PC3')
axis([0 30 -0.7 0.7])
set(findall(gca, 'Type', 'Line'),'LineWidth',2);