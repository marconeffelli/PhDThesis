clear; close all;clc;

%==========================================================================
%
%
%Section4.3.3 The Impact of Misspecification in the Target Matrix
%
%
%==========================================================================

T=1000;
p=3;
MC=100;


%Matrix ADA

A = [0.1 0 0; 0 0.1 0; 0 0 0.2];
%Diag = diag([1 1 1]);
D = [1 0.1 0.2; 0.1 1 0.7; 0.2 0.7 1];
cova = A*D*A;
A_2 = diag(cov2corr(cova/2));
cova_2 = A_2*D*A_2;

True_GMVc = GMVc(cova,p);
True_IV = IV(cova);
True_ERC = ERC(cova,p);
True_MDP = MDP(cova,p);

%% Deviation from variance
cont01 = 0:0.01:0.5;
sk = 0:0.1:1;
for i=1:size(cont01,2)
A_2(3,3)=cont01(1,i);
cova_cont = A_2*D*A_2;
for kk=1:11
Shrink = sk(kk)*(cova/2) + (1-sk(kk))*(cova_cont);
%Weights
weights_GMVc = GMVc(Shrink,p);
weights_IV = IV(Shrink);
weights_ERC = ERC(Shrink,p);
weights_MDP = MDP(Shrink,p);
%FN
FN1_GMV(i,kk) = norm(weights_GMVc - True_GMVc,'fro');
FN1_IV(i,kk) = norm(weights_IV - True_IV,'fro');
FN1_ERC(i,kk) = norm(weights_ERC - True_ERC,'fro');
FN1_MDP(i,kk) = norm(weights_MDP - True_MDP,'fro');
end
end

%% Deviation from covariance
A_2 = diag(cov2corr(cova/2));
cont02 = 0:0.01:1;
for i=1:size(cont02,2)
D(2,3)=cont02(1,i);
D(3,2)=cont02(1,i);
cova_cont = A_2*D*A_2;
for kk=1:11
Shrink = sk(kk)*(cova/2) + (1-sk(kk))*(cova_cont);
%Weights
weights2_GMVc = GMVc(Shrink,p);
weights2_IV = IV(Shrink);
weights2_ERC = ERC(Shrink,p);
weights2_MDP = MDP(Shrink,p);
%FN
FN2_GMV(i,kk) = norm(weights2_GMVc - True_GMVc,'fro');
FN2_IV(i,kk) = norm(weights2_IV - True_IV,'fro');
FN2_ERC(i,kk) = norm(weights2_ERC - True_ERC,'fro');
FN2_MDP(i,kk) = norm(weights2_MDP - True_MDP,'fro');
end
end
for i=1:51
i_gmv1(i,:)=interp1(1:11,FN1_GMV(i,:),linspace(1,11,51));
i_iv1(i,:)=interp1(1:11,FN1_IV(i,:),linspace(1,11,51));
i_erc1(i,:)=interp1(1:11,FN1_ERC(i,:),linspace(1,11,51));
i_mdp1(i,:)=interp1(1:11,FN1_MDP(i,:),linspace(1,11,51));
end
for i=1:101
i_gmv2(i,:)=interp1(1:11,FN2_GMV(i,:),linspace(1,11,101));
i_iv2(i,:)=interp1(1:11,FN2_IV(i,:),linspace(1,11,101));
i_erc2(i,:)=interp1(1:11,FN2_ERC(i,:),linspace(1,11,101));
i_mdp2(i,:)=interp1(1:11,FN2_MDP(i,:),linspace(1,11,101));
end

figure(1)
sk = 0:0.02:1;
[X,Y] = meshgrid(cont01,sk);
subplot(2,4,1)
surf(X,Y,i_gmv1)
title("MV")
zlabel({'Volatility', 'Misspecification'},'FontSize',10,'FontWeight','bold')
subplot(2,4,2)
surf(X,Y,i_iv1)
title("IV")
subplot(2,4,3)
surf(X,Y,i_erc1)
title("ERC")
subplot(2,4,4)
surf(X,Y,i_mdp1)
title("MD")

sk = 0:0.01:1;
[X,Y] = meshgrid(cont02,sk);
subplot(2,4,5)
surf(X,Y,i_gmv2)
zlabel({'Correlation', 'Misspecification'},'FontSize',10,'FontWeight','bold')
title("MV")
subplot(2,4,6)
surf(X,Y,i_iv2)
title("IV")
subplot(2,4,7)
surf(X,Y,i_erc2)
title("ERC")
subplot(2,4,8)
surf(X,Y,i_mdp2)
title("MD")

% figure(2)
% plot(cont02,FN2_GMV)
% hold on
% plot(cont02,FN2_IV)
% hold on
% plot(cont02,FN2_ERC)
% hold on
% plot(cont02,FN2_MDP)


%% AUXILLARY COVARIANCE MATRICES

function wGMVc = GMVc(S,p)
m=zeros(p,1);
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

%industry factors


%if type == "pca"
%    coeff = pca(x);
%    finaldata = coeff'*x';
%end


if type == "ewma"
    ewma = riskmetrics(x,0.94); %run the riskmetrics EWMA model
    prior = ewma(:,:,end);
end

if type == "dcc"
[~,~,dcc_m] = dcc(x,[],1,0,1);
prior = dcc_m(:,:,end);
end

%MRCD



if type == "stoid"
% compute prior
meanvar=mean(diag(sample));
prior1=meanvar*eye(n);
% what we call p 
y=x.^2;
phiMat=y'*y/t-sample.^2;
phi=sum(sum(phiMat));

% what we call r is not needed for this shrinkage target

% what we call c
gamma=norm(sample-prior1,'fro')^2;

% compute shrinkage constant
kappa=phi/gamma;
shrinkag=max(0,min(1,kappa/t));

% compute shrinkage estimator
prior=shrinkag*prior1+(1-shrinkag)*sample;
end

if type == "stomkt"
% compute market
xmkt=mean(x')';
sample=cov([x xmkt])*(t-1)/t;
covmkt=sample(1:n,n+1);
varmkt=sample(n+1,n+1);
sample(:,n+1)=[];
sample(n+1,:)=[];
prior1=covmkt*covmkt'./varmkt;
prior1(logical(eye(n)))=diag(sample);
c=norm(sample-prior1,'fro')^2;
y=x.^2;
p=1/t*sum(sum(y'*y))-sum(sum(sample.^2));
% r is divided into diagonal
% and off-diagonal terms, and the off-diagonal term
% is itself divided into smaller terms 
rdiag=1/t*sum(sum(y.^2))-sum(diag(sample).^2);
z=x.*xmkt(:,ones(1,n));
v1=1/t*y'*z-covmkt(:,ones(1,n)).*sample;
roff1=sum(sum(v1.*covmkt(:,ones(1,n))'))/varmkt...
  -sum(diag(v1).*covmkt)/varmkt;
v3=1/t*z'*z-varmkt*sample;
roff3=sum(sum(v3.*(covmkt*covmkt')))/varmkt^2 ...
  -sum(diag(v3).*covmkt.^2)/varmkt^2;
roff=2*roff1-roff3;
r=rdiag+roff;
% compute shrinkage constant
k=(p-r)/c;
shrinkag=max(0,min(1,k/t));
prior=shrinkag*prior1+(1-shrinkag)*sample;
end

end