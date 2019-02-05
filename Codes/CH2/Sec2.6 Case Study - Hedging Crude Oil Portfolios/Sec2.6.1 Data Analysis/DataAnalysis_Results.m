clear; close all;clc;

%==========================================================================
%
%
%Results aggregation
%
%
%==========================================================================

load Data

prices = Data;
returns = price2ret(Data);

A = [prices(:,1) prices(:,3) prices(:,2) prices(:,4)];
B = [returns(:,1) returns(:,3) returns(:,2) returns(:,4)];

desc_stat_full = [mean(B); std(B); skewness(B); kurtosis(B)];
[unc_cor_full1,unc_corr_pval_full1] =  corr(B(:,1),B(:,2));
[unc_cor_full2,unc_corr_pval_full2] =  corr(B(:,3),B(:,4));
JBresult_full =  GetJB(B);
LBQresult_full =  GetLBQ(B);
ADFresult_full = GetADF(B);
ADFresult_full_p = GetADF(A);