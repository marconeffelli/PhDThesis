%--------------------------------------------------------------------------
%
% Returns Unc.corr. values and p-values.
%
%--------------------------------------------------------------------------


function [unc_cor,unc_corr_pval] =  GetUncCorr(B)

[unc_corr1,pvalue1] = corr(B(:,1),B(:,6));
[unc_corr2,pvalue2] = corr(B(:,2),B(:,7));
[unc_corr3,pvalue3] = corr(B(:,3),B(:,8));
[unc_corr4,pvalue4] = corr(B(:,4),B(:,9));
[unc_corr5,pvalue5] = corr(B(:,5),B(:,10));
unc_cor = [unc_corr1 unc_corr2 unc_corr3 unc_corr4 unc_corr5];
unc_corr_pval = [pvalue1 pvalue2 pvalue3 pvalue4 pvalue5];

end
