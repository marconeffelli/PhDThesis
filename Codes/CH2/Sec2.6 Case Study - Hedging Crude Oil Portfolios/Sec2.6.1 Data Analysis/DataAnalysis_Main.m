close all;clear;clc;

%==========================================================================
%
%
%Generate Data for various Tables
%
%==========================================================================

%% To get Table 3 run this section
load std_returns
B=std_returns;

%% To get Table 8 and 9 activate the followings:
load EnergyPrices
A = EnergyPrices(1:3007,2:end); %drop last rows of EnergyPrices
B = tick2ret(A);

%% Descriptive Statistics & UncCorr & Jarque-Bera

B = [B(:,1) B(:,6) B(:,2) B(:,7) B(:,3) B(:,8) B(:,4) B(:,9) B(:,5) B(:,10)];

%full
desc_stat_full = [mean(B); std(B); skewness(B); kurtosis(B)];
[unc_cor_full,unc_corr_pval_full] =  GetUncCorr(B);
JBresult_full =  GetJB(B);
LBQresult_full =  GetLBQ(B);
ADFresult_full = GetADF(B);
%1
C = B(1:498,:);
desc_stat1 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor1,unc_corr_pval1] =  GetUncCorr(C);
JBresult1 =  GetJB(C);
LBQresult1 =  GetLBQ(C);
ADFresult1 = GetADF(C);
clearvars C
%2
C = B(498:1003,:);
desc_stat2 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor2,unc_corr_pval2] =  GetUncCorr(C);
JBresult2 =  GetJB(C);
LBQresult2 =  GetLBQ(C);
ADFresult2 = GetADF(C);
clearvars C
%3
C = B(1003:1503,:);
desc_stat3 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor3,unc_corr_pval3] =  GetUncCorr(C);
JBresult3 =  GetJB(C);
LBQresult3 =  GetLBQ(C);
ADFresult3 = GetADF(C);
clearvars C
%4
C = B(1503:2004,:);
desc_stat4 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor4,unc_corr_pval4] =  GetUncCorr(C);
JBresult4 =  GetJB(C);
LBQresult4 =  GetLBQ(C);
ADFresult4 = GetADF(C);
clearvars C
%5
C = B(2004:2507,:);
desc_stat5 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor5,unc_corr_pval5] =  GetUncCorr(C);
JBresult5 =  GetJB(C);
LBQresult5 =  GetLBQ(C);
ADFresult5 = GetADF(C);
clearvars C
%6
C = B(2507:end,:);
desc_stat6 = [mean(C); std(C); skewness(C); kurtosis(C)];
[unc_cor6,unc_corr_pval6] =  GetUncCorr(C);
JBresult6 =  GetJB(C);
LBQresult6 =  GetLBQ(C);
ADFresult6 = GetADF(C);
clearvars C

%ADF on prices
ADFresult_full_p = GetADF(A);
ADFresult1_p = GetADF(A(1:498,:));
ADFresult2_p = GetADF(A(498:1003,:));
ADFresult3_p = GetADF(A(1003:1503,:));
ADFresult4_p = GetADF(A(1503:2004,:));
ADFresult5_p = GetADF(A(2004:2507,:));
ADFresult6_p = GetADF(A(2507:end,:));



desc_stat = [desc_stat_full;desc_stat1;desc_stat2;desc_stat3;desc_stat4;desc_stat5;desc_stat6];
unc_corr = [unc_cor_full;unc_cor1;unc_cor2;unc_cor3;unc_cor4;unc_cor5;unc_cor6];
unc_corr_pval = [unc_corr_pval_full;unc_corr_pval1;unc_corr_pval2;unc_corr_pval3;unc_corr_pval4;unc_corr_pval5;unc_corr_pval6];
JBresults = [JBresult_full;JBresult1;JBresult2;JBresult3;JBresult4;JBresult5;JBresult6];
LBQresults = [LBQresult_full;LBQresult1;LBQresult2;LBQresult3;LBQresult4;LBQresult5;LBQresult6];
ADFresults_ret = [ADFresult_full;ADFresult1;ADFresult2;ADFresult3;ADFresult4;ADFresult5;ADFresult6];
ADFresults_p = [ADFresult_full_p;ADFresult1_p;ADFresult2_p;ADFresult3_p;ADFresult4_p;ADFresult5_p;ADFresult6_p];
clearvars desc_stat_full desc_stat1 desc_stat2 desc_stat3 desc_stat4 desc_stat5 desc_stat6
clearvars unc_cor_full unc_cor1 unc_cor2 unc_cor3 unc_cor4 unc_cor5 unc_cor6
clearvars unc_corr_pval_full unc_corr_pval1 unc_corr_pval2 unc_corr_pval3 unc_corr_pval4 unc_corr_pval5 unc_corr_pval6
clearvars JBresult_full JBresult1 JBresult2 JBresult3 JBresult4 JBresult5 JBresult6
clearvars LBQresult_full LBQresult1 LBQresult2 LBQresult3 LBQresult4 LBQresult5 LBQresult6
clearvars ADFresult_full ADFresult1 ADFresult2 ADFresult3 ADFresult4 ADFresult5 ADFresult6
clearvars ADFresult_full_p ADFresult1_p ADFresult2_p ADFresult3_p ADFresult4_p ADFresult5_p ADFresult6_p
%% Augmented Dickey-Fuller

ADFresults = [ADFresults_p(1:2,:) ; ADFresults_ret(1:2,:);...
    ADFresults_p(3:4,:) ; ADFresults_ret(3:4,:);...
    ADFresults_p(5:6,:) ; ADFresults_ret(5:6,:);...
    ADFresults_p(7:8,:) ; ADFresults_ret(7:8,:);...
    ADFresults_p(9:10,:) ; ADFresults_ret(9:10,:);...
    ADFresults_p(11:12,:) ; ADFresults_ret(11:12,:);...
    ADFresults_p(13:14,:) ; ADFresults_ret(13:14,:)];





