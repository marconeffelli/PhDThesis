#SCRIPT PER Monte Carlo

rm(list = ls())  # cleanup
setwd("~/Desktop/MRCD_R_code")
require(MASS)
require('rrcov') #for PcaHubert

sapply(list("MRCD.R","optimalh.R","helperfunctionsPAPER.R"),source)

# 1. Read data
#--------------

load('DataSim12K.RData')

# 2. Loop to get results
#-----------------------

type = "MRCD"
nscen = 5
#Preassign
MCpturnover = numeric(nscen); MCpmu = numeric(nscen); MCpvar = numeric(nscen); MCpc = numeric(nscen);
MCpsigma = numeric(nscen); MCpsharpe = numeric(nscen); MCpglobalstd = numeric(nscen); MCprho = numeric(nscen);


for (k in seq(1,nscen)){ #seq(1,nscen)
  
  if (k==1) {nobsinsample = 360;nobsoos=201;}
  if (k==2) {nobsinsample = 180;nobsoos=1201;}
  if (k==3) {nobsinsample = 90;nobsoos=1201;}
  if (k==4) {nobsinsample = 60;nobsoos=1201;}
  if (k==5) {nobsinsample = 36;nobsoos=1201;}
    
    #returns = data[,,1]
    
    #######CONTAMINATION
    return = data[1:(nobsinsample+nobsoos),,1]
    sim_data_cont = apply(return,2,mean)+5*apply(return,2,sd)
    sim_data_cont01 = return
    for (kk in 1:p){
    h1 = round(runif(round(0.05*(nobsinsample+nobsoos)), min=1, max=(nobsinsample+nobsoos)))
    sim_data_cont01[h1,kk] =  sim_data_cont[kk]
    }
    returns=sim_data_cont01
    rm(return);rm(sim_data_cont)
    #######CONTAMINATION
    
    pturnover = numeric(nobsoos-2); preturns = numeric(nobsoos-1); pmu = numeric(nobsoos-1); pvar = numeric(nobsoos-1);
    psigma = numeric(nobsoos-1); psharpe = numeric(nobsoos-1); pglobalstd = numeric(nobsoos-1); prho = numeric(nobsoos-1); pc = numeric(nobsoos-1);
    
    hopt = round(0.5*nobsinsample) #VERIFICARE
    #hopt = optimalh(returns)
    
    #%1. Calculate covariance matrices
    
    ptf_weights = array(0, dim=c(p,1,nobsoos+1))
    rho = matrix(0,nobsoos+1,1)

    c=numeric(nobsoos+1)
    iTrue_cov=solve(True_cov)
    true_weights=GMV(iTrue_cov)
    
    
    
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
      c[i]=norm(true_weights-ptf_weights[,,i], type = "1")
      rm(iCov_Matrix)
      print(i)
      }
    
    
    #% 3. Calculate ptf performances
    returns_oos = returns[seq(nobsinsample+1,nobsinsample+nobsoos),]
    ret = matrix(0,nobsoos-1,dim(returns)[2])
    globalstd = matrix(0,nobsoos-1,1)
    ret = matrix(0,nobsoos-1,dim(returns)[2])
    globalstd = matrix(0,nobsoos-1,1)
    turnover = matrix(0,nobsoos-1,1)
    for (i in seq(1,nobsoos-1)){
      ret[i,] = t(ptf_weights[,,i])*returns_oos[i,]
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
  MCpc[k] = mean(c)
  print("well done")
}
rm(list=setdiff(ls(), c("MCpturnover","MCpmu","MCpvar","MCpsigma","MCpsharpe","MCpglobalstd","MCprho","MCpc")))
