#SCRIPT PER SAMPLE

rm(list = ls())  # cleanup
setwd("~/Desktop/MRCD_R_code")
require(MASS)
require('rrcov') #for PcaHubert

sapply(list("MRCD.R","optimalh.R","helperfunctionsPAPER.R"),source)

# 1. Read data
#--------------
#load('Industry.RData')
#load('OperatingProfitabilityandInvestment.RData')
#load('SizeandBooktoMarket.RData')
#load('SizeandMomentum.RData')
load('DatasetValencia.RData')
#data = read.csv( paste("~/Desktop/SizeandMomentum.csv",sep=""),header=F)
#data<-apply(log(data),2,diff)

# 2. Loop to get results
#-----------------------

type = "MRCD"
nscen = 5
#Preassign
MCpturnover = numeric(nscen); MCpmu = numeric(nscen); MCpvar = numeric(nscen); MCpc = numeric(nscen);
MCpsigma = numeric(nscen); MCpsharpe = numeric(nscen); MCpglobalstd = numeric(nscen); MCprho = numeric(nscen);

p=dim(data)[2]


for (k in seq(2,nscen)){ #seq(1,nscen)
    
    if (k==1) {nobsinsample = 360;nobsoos=dim(data)[1]-nobsinsample;}
    if (k==2) {nobsinsample = 180;nobsoos=dim(data)[1]-nobsinsample;}
    if (k==3) {nobsinsample = 90;nobsoos=dim(data)[1]-nobsinsample;}
    if (k==4) {nobsinsample = 60;nobsoos=dim(data)[1]-nobsinsample;}
    if (k==5) {nobsinsample = 36;nobsoos=dim(data)[1]-nobsinsample;}

    pturnover = numeric(nobsoos-2); preturns = numeric(nobsoos-1); pmu = numeric(nobsoos-1); pvar = numeric(nobsoos-1);
    psigma = numeric(nobsoos-1); psharpe = numeric(nobsoos-1); pglobalstd = numeric(nobsoos-1); prho = numeric(nobsoos-1); pc = numeric(nobsoos-1);
    
    hopt = round(0.75*nobsinsample) #VERIFICARE

    ptf_weights = array(0, dim=c(p,1,nobsoos+1))
    rho = matrix(0,nobsoos+1,1)
  
    returns = as.matrix(data)
  
  for (i in seq(1,nobsoos+1)){
    if (type == "sample"){
      iCov_Matrix = try(solve(cov(returns[seq(i,nobsinsample+i-1),])),silent=TRUE)
      if(class(iCov_Matrix)=="try-error"){iCov_Matrix=ginv(cov(returns[seq(i,nobsinsample+i-1),]))}}
    if (type == "MRCD"){
      mX = returns[seq(i,nobsinsample+i-1),]
      mX = t(mX)
      result = mrcd(mX=mX,target=0,h=hopt)
      iCov_Matrix = result$icov
      rho[i,] = result$rho}
    #% 2. Run ptf optimization
    ptf_weights[,,i] = GMV(iCov_Matrix)
    rm(iCov_Matrix)
    print(i)
  }
  
  
  #% 3. Calculate ptf performances
  returns_oos = returns[seq(nobsinsample+1,nobsinsample+nobsoos),]
  ret = matrix(0,nobsoos-1,dim(returns)[2])
  globalstd = matrix(0,nobsoos-1,1)
  turnover = matrix(0,nobsoos-1,1)
  for (i in seq(1,nobsoos-1)){
    ret[i,] = t(ptf_weights[,,i])*returns_oos[i,]
    #ret[i,] = ptf_weights[,,i]%*%t(returns_oos[i,])
    cova = cov(returns[seq(i,nobsinsample+i-1),])
    globalstd[i,] = sqrt(t(ptf_weights[,,i])%*%cova%*%ptf_weights[,,i])
    if (i>=2){
      turnover[i-1,] = sum(abs(ptf_weights[,,i]-ptf_weights[,,i-1]))
    }
  }
  #Store results for each sample size
  MCpturnover[k] = sum(turnover/(nobsoos-1))
  MCpmu[k] = mean(apply(ret,1,sum)) #%ptf returns mean
  MCpvar[k] = var(apply(ret,1,sum)) #%ptf returns variance
  MCpsigma[k] = sqrt(MCpvar[k])
  MCpsharpe[k] = MCpmu[k]/MCpsigma[k]
  MCpglobalstd[k] = mean(globalstd)
  MCprho[k] = mean(rho)
  print("well done")
}
rm(list=setdiff(ls(), c("MCpturnover","MCpmu","MCpvar","MCpsigma","MCpsharpe","MCpglobalstd","MCprho")))

