close all; clear all; clc;

%==========================================================================
%
%
%Preliminary: Interest Rates Bootstrap
%
%
%==========================================================================

A = xlsread('USDpar_rates.xlsx');
A = A';

DiscountFactors = 1./(1+A(:,2:end)/100);

B = [1:24;DiscountFactors];

SpotRates=zeros(length(DiscountFactors),24);
for i=1:length(DiscountFactors)
SpotRates(i,:) = -log(DiscountFactors(i,:))./B(i,:);
end

ChangesSpotRates = diff(SpotRates);
termstructure = SpotRates(end,:);

t = datetime(A(:,1),'ConvertFrom','excel');
t.Format = 'MMMM d,y';


