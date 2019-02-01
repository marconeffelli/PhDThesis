clear; close all;clc;

%==========================================================================
%
%
%Section4.4 Case Study - Monte Carlo Simulation
%
%
%==========================================================================

%% Set the stage
tic

T = 6000; %time periods
p = 100;
MC= 100; %number of Monte Carlo simulations

%% Load Data

prompt = 'What dataset you want? ';
datatype = input(prompt);

if datatype == 1 % "Operating" %662
load('OperatingProfitabilityandInvestment'); 
%rp = randperm(size(Data,2),p);
%Data = Data(:,rp);
end
if datatype == 2 %"SizeBtM" %1106
load('SizeandBooktoMarket'); 
end
if datatype == 3 %"SizeM" %1101
load('SizeandMomentum'); 
end
if datatype == 4 %"Industry" %1106
load('IndustryPortfolios'); 
end
if datatype == 5 %"NDX" %30
load('NDX'); %Data = Data(:,1:100); %100 p / 6000 n = 300s*100   // no dcc = 5 sec
%rp = randperm(size(Data,2),p);
%Data = Data(:,rp);
end
if datatype == 6% "SPX" %270
load('SPX');
%rp = randperm(size(Data,2),p);
%Data = Data(:,rp);
end

Data=Data(:,2:end);


%% FM Calibration

x=Data;
[t,nasset]=size(x);
meanx=mean(x);
x=x-meanx(ones(t,1),:);
xmkt=mean(x')';
sample=cov([x xmkt])*(t-1)/t;

mu=mean(xmkt); %market returns mean
omega=sample(nasset+1,nasset+1); %market returns variance
for i=1:nasset
B_calibration(i,1)=(x(:,i)'*x(:,i))\x(:,i)'*xmkt;
end
B_max = max(B_calibration);
B_min = min(B_calibration);

B_true = unifrnd(B_min,B_max,p,1);

Sigma_epsilon = diag(zeros(p,1)+0.2/12); %innovations variance
True_cov = B_true*omega*B_true'+Sigma_epsilon;


%% Returns Simulation
rng('default');
   
for j=1:MC
    for i=1:T
    %generate Rb,t 
    Rbt = normrnd(mu,omega);
    %generate epsilon
    Sigma_epsilon = diag(zeros(p,1)+unifrnd(0.1,0.3,p,1)/12);
    epsilon = mvnrnd(zeros(p,1),Sigma_epsilon,1)';
    %generate returns
    B = (B_max-B_min).*rand(p,1) + B_min; %loadings
    %B_u = unifrnd(B_min,B_max,p,1);
    Rat = (B*Rbt + epsilon);
    %store returns
    Ret(:,i) = Rat;
    end
Returns(:,:,j) = Ret';
end
clearvars -except Returns True_cov p MC

%% 

% True weights
True_GMVc = GMVc(True_cov,p);
True_IV = IV(True_cov);
True_ERC = ERC(True_cov,p);
True_MDP = MDP(True_cov,p);
shrink = 0:0.09:1;

for i=1:MC

returns = Returns(:,:,i);    
      
%Get the Target
Target_identity = TargetMatrix(returns,"identity");
Target_pinv = TargetMatrix(returns,"pinv");
Target_market = TargetMatrix(returns,"market");
Target_common = TargetMatrix(returns,"common");
Target_constant = TargetMatrix(returns,"constant");
Target_dcc = TargetMatrix(returns,"ewma");

%Shrinking the sample covariance matrix
for kk=1:12
Cov_identity = shrinkage(returns,Target_identity,shrink(kk));
Cov_pinv = shrinkage(returns,Target_pinv,shrink(kk));
Cov_market = shrinkage(returns,Target_market,shrink(kk));
Cov_common = shrinkage(returns,Target_common,shrink(kk));
Cov_constant = shrinkage(returns,Target_constant,shrink(kk));
Cov_dcc = shrinkage(returns,Target_dcc,shrink(kk));

%%%%%%%%%%%%%%%%%%%%%%%
% Matrix Distance
%%%%%%%%%%%%%%%%%%%%%%%

Dist_FN_identity(i,kk) = norm(Cov_identity-True_cov,'fro');
Dist_FN_pinv(i,kk) = norm(Cov_pinv-True_cov,'fro');
Dist_FN_market(i,kk) = norm(Cov_market-True_cov,'fro');
Dist_FN_common(i,kk) = norm(Cov_common-True_cov,'fro');
Dist_FN_constant(i,kk) = norm(Cov_constant-True_cov,'fro');
Dist_FN_dcc(i,kk) = norm(Cov_dcc-True_cov,'fro');

%%%%%%%%%%%%%%%%%%%%%%%
% Matrix CN
%%%%%%%%%%%%%%%%%%%%%%%

CN_identity(i,kk) = cond(Target_identity);
CN_pinv(i,kk) = cond(Target_pinv);
CN_market(i,kk) = cond(Target_market);
CN_common(i,kk) = cond(Target_common);
CN_constant(i,kk) = cond(Target_constant);
CN_dcc(i,kk) = cond(Target_dcc);

RCN_identity(i,kk) = rcond(Target_identity);
RCN_pinv(i,kk) = rcond(Target_pinv);
RCN_market(i,kk) = rcond(Target_market);
RCN_common(i,kk) = rcond(Target_common);
RCN_constant(i,kk) = rcond(Target_constant);
RCN_dcc(i,kk) = rcond(Target_dcc);

end
end

D.Dist(1,:)= mean(Dist_FN_identity,1);
D.Dist(2,:)= mean(Dist_FN_pinv,1);
D.Dist(3,:)= mean(Dist_FN_market,1);
D.Dist(4,:)= mean(Dist_FN_common,1);
D.Dist(5,:)= mean(Dist_FN_constant,1);
D.Dist(6,:)= mean(Dist_FN_dcc,1);

D.CN(1,:)= mean(CN_identity,1);
D.CN(2,:)= mean(CN_pinv,1);
D.CN(3,:)= mean(CN_market,1);
D.CN(4,:)= mean(CN_common,1);
D.CN(5,:)= mean(CN_constant,1);
D.CN(6,:)= mean(CN_dcc,1);

D.RCN(1,:)= mean(RCN_identity,1);
D.RCN(2,:)= mean(RCN_pinv,1);
D.RCN(3,:)= mean(RCN_market,1);
D.RCN(4,:)= mean(RCN_common,1);
D.RCN(5,:)= mean(RCN_constant,1);
D.RCN(6,:)= mean(RCN_dcc,1);

clearvars -except D %W
toc

%% AUXILLARY COVARIANCE MATRICES

function wGMVc = GMVc(S,p)
m=zeros(p,1);
S = (S + S.')/2;
port = Portfolio('assetmean', m, 'assetcovar', S, ...
'lowerbudget', 1, 'upperbudget', 1, 'lowerbound', 0);
wGMVc = estimateFrontier(port,1);
end

function wIV = IV(S)
% Equal Risk Budget or Inverse volatility weighted portfolio
std_all = diag(sqrt(S));
inv_std_all = 1./std_all;
sum_inv_std_all = sum(inv_std_all);
wIV = inv_std_all/sum_inv_std_all;
end

function wERC = ERC(S,p)
% Equally Risk Contribution (ERC)
LB = zeros(1,p);
UB = ones(1,p);
beq =1;
f1 = @(w1) ERC_FUNCTION(w1,S);  
w0 = 1/p*ones(p,1);
wERC = fmincon(f1,w0,[],[],UB,beq,LB,UB',[]);
%f1 = @(w1) ERC_NEW(w1,S); 
%wERC_new = fmincon(f1,w0,[],[],UB,beq,LB,UB',[]);
end

function wMDP = MDP(S,p)
% Most Diversified Portfolio (MDP)
LB = zeros(1,p);
UB = ones(1,p);
beq =1;
std_all = diag(sqrt(S));
f2 = @(w2) MDP_FUNCTION(w2,std_all,S);
w0 = 1/p*ones(p,1);
wMDP = fmincon(f2,w0,[],[],UB,beq,LB',UB',[]);
end

function [x]=ERC_FUNCTION(w1,Sigma)
x = 0;
R = Sigma*w1;
for i=1:size(w1)
    for j=1:size(w1)
        x = x + (w1(i)*R(i)-w1(j)*R(j))^2;
    end
end
x = x/(w1'*R);
end

function x = ERC_NEW(w1,Sigma)
R = Sigma*w1;
for i=1:size(w1)
    RC(i) = w1(i)*R(i);
end
x = sum((RC-1/size(Sigma,1)).^2);
end

function f = MDP_FUNCTION(w2,std,sigma)
f = -(w2'*std)*(w2'*sigma*w2)^(-.5);
end


function [sigma]=shrinkage(x,prior,shrinkage)

% de-mean returns
[t,~]=size(x);
meanx=mean(x);
x=x-meanx(ones(t,1),:);

% compute sample covariance matrix
sample=(1/t).*(x'*x);

% compute shrinkage estimator
sigma=shrinkage*prior+(1-shrinkage)*sample;
end

function prior = TargetMatrix(x,type)

% de-mean returns
[t,n]=size(x);
meanx=mean(x);
x=x-meanx(ones(t,1),:);

% compute sample covariance matrix
sample=(1/t).*(x'*x);


if type == "identity"
% compute identity matrix
meanvar=mean(diag(sample));
prior=meanvar*eye(n);
end

if type == "constant"
% compute constant correlation
var=diag(sample);
sqrtvar=sqrt(var);
rBar=(sum(sum(sample./(sqrtvar(:,ones(n,1)).*sqrtvar(:,ones(n,1))')))-n)/(n*(n-1));
prior=rBar*sqrtvar(:,ones(n,1)).*sqrtvar(:,ones(n,1))';
prior(logical(eye(n)))=var;
end

if type == "common"
var=diag(sample); 
vBar=mean(var); %avgvar
rBar=(sum(sum(sample./(var(:,ones(n,1)).*var(:,ones(n,1))')))-n)/(n*(n-1)); %avgcov
prior = zeros(n,n)+rBar;
prior(1:1+size(prior,1):end)=vBar;
end

if type == "pinv"
prior = pinv(sample);
prior = (prior + prior.')/2;
end

if type == "market"
% compute market
xmkt=mean(x')';
sample=cov([x xmkt])*(t-1)/t;
covmkt=sample(1:n,n+1);
varmkt=sample(n+1,n+1);
sample(:,n+1)=[];
sample(n+1,:)=[];
prior=covmkt*covmkt'./varmkt;
prior(logical(eye(n)))=diag(sample);
end

if type == "ewma"
    if t<n
        backcast = zeros(n,n)+diag(ones(n,1));
        ewma = riskmetrics(x,0.94,backcast);
    else
        ewma = riskmetrics(x,0.94); %run the riskmetrics EWMA model
    end
    prior = ewma(:,:,end);
end

if type == "dcc"
[~,~,dcc_m] = dcc(x,[],1,0,1);
prior = dcc_m(:,:,end);
end

end