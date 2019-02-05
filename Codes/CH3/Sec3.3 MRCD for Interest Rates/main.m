clear;close all;clc;
%--------------------------------------------------------------------------
%
%Generating code for PCA analysis of the U.S. spot rates term structure
%during the period 1/oct/2012-22/sep/2017.
%
%The code generates from the daily change in spot rate:
%1) 5 different covariance matrices calculated with: sample, MCD, MRCD,
%Shrinkage and Non-linear Shrinkage techniques
%2) PCA analysis
%
%The code runs throught the following functions:
%a) covShrinkage for the shrinkage
%b) for the non-linear shrinkage we use R package nlshrink
%c) robustcov for the MCD
%d) for the MRCD we use the R package MRCD
%
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load data - daily spot interest rate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Rates')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1) -- Calculate covariance matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----Sample Cov Matrix-----%
cov_sample = cov(ChangesSpotRates);
%-----Shrinkage Cov Matrix-----%
%cov_shrinkage = covShrinkage(ChangesSpotRates); I target matrix
cov_shrinkage = covCor(ChangesSpotRates); %constant corr target matrix
%-----NonLinear Shrinkage Cov Matrix-----%
cov_Nshrinkage = xlsread("cov_Nshrinkage");
%-----MCD Cov Matrix-----%
cov_MCD = robustcov(ChangesSpotRates);
%-----MRCD Shrinkage Cov Matrix-----%
cov_MRCD = xlsread("cov_MRCD24");

%%%%%%%%%%%%%%%%
%2) PCA analysis
%%%%%%%%%%%%%%%%

[COEFF_sample,latent_sample,var_sample] = pcacov(cov_sample); %PCA on covariance matrix
cum_var_sample = cumsum(var_sample); %cumulative sum of explained variance by PCA

[COEFF_shrinkage,latent_shrinkage,var_shrinkage] = pcacov(cov_shrinkage); %PCA on covariance matrix
cum_var_shrinkage = cumsum(var_shrinkage); %cumulative sum of explained variance by PCA

[COEFF_Nshrinkage,latent_Nshrinkage,var_Nshrinkage] = pcacov(cov_Nshrinkage); %PCA on covariance matrix
cum_var_Nshrinkage = cumsum(var_Nshrinkage); %cumulative sum of explained variance by PCA

[COEFF_MCD,latent_MCD,var_MCD] = pcacov(cov_MCD); %PCA on covariance matrix
cum_var_MCD = cumsum(var_MCD); %cumulative sum of explained variance by PCA

[COEFF_MRCD,latent_MRCD,var_MRCD] = pcacov(cov_MRCD); %PCA on covariance matrix
cum_var_MRCD = cumsum(var_MRCD); %cumulative sum of explained variance by PCA

%% Ancillary Functions

function [sigma,shrinkage]=covCor(x,shrink)

% x (t*n): t iid observations on n random variables
% sigma (n*n): invertible covariance matrix estimator
%
% Shrinks towards constant correlation matrix
% if shrink is specified, then this constant is used for shrinkage

% The notation follows Ledoit and Wolf (2003, 2004)
% This version 04/2014

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is released under the BSD 2-clause license.

% Copyright (c) 2014, Olivier Ledoit and Michael Wolf 
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
% 1. Redistributions of source code must retain the above copyright notice,
% this list of conditions and the following disclaimer.
% 
% 2. Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in the
% documentation and/or other materials provided with the distribution.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
% IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
% PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
% CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% de-mean returns
[t,n]=size(x);
meanx=mean(x);
x=x-meanx(ones(t,1),:);

% compute sample covariance matrix
sample=(1/t).*(x'*x);

% compute prior
var=diag(sample);
sqrtvar=sqrt(var);
rBar=(sum(sum(sample./(sqrtvar(:,ones(n,1)).*sqrtvar(:,ones(n,1))')))-n)/(n*(n-1));
prior=rBar*sqrtvar(:,ones(n,1)).*sqrtvar(:,ones(n,1))';
prior(logical(eye(n)))=var;

if (nargin < 2 | shrink == -1) % compute shrinkage parameters and constant
			       
  % what we call pi-hat
  y=x.^2;
  phiMat=y'*y/t - 2*(x'*x).*sample/t + sample.^2;
  phi=sum(sum(phiMat));
  
  % what we call rho-hat
  term1=((x.^3)'*x)/t;
  help = x'*x/t;
  helpDiag=diag(help);
  term2=helpDiag(:,ones(n,1)).*sample;
  term3=help.*var(:,ones(n,1));
  term4=var(:,ones(n,1)).*sample;
  thetaMat=term1-term2-term3+term4;
  thetaMat(logical(eye(n)))=zeros(n,1);
  rho=sum(diag(phiMat))+rBar*sum(sum(((1./sqrtvar)*sqrtvar').*thetaMat));
  
  % what we call gamma-hat
  gamma=norm(sample-prior,'fro')^2;
  
  % compute shrinkage constant
  kappa=(phi-rho)/gamma;
  shrinkage=max(0,min(1,kappa/t));
  
else % use specified constant
  shrinkage=shrink;
end

% compute the estimator
sigma=shrinkage*prior+(1-shrinkage)*sample;