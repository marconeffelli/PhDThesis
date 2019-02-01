#SCRIPT PER MRCD


rm(list = ls())  # cleanup

#setwd!

GMV <- function(S){
  #%Calculation of GMV-weights
  iota=matrix(1,dim(S)[1],1)
  w_GMV=(S%*%iota)/as.vector((t(iota)%*%(S%*%iota)))
  #std_GMV = sqrt(1/(iota'*(S\iota)));
}

performances <- function(returns,nobsinsample,nobsoos,ptf_weights,strat,rho){
  fine = dim(returns)[1]
  returns_oos = returns[seq(nobsinsample+1,261),]
  if (strat == "fixed"){
    ret = matrix(0,nobsoos-1,dim(returns)[2])
    globalstd = matrix(0,nobsoos-1,1)
    for (i in seq(1,nobsoos-1)){
      ret[i,] = t(ptf_weights)*(returns_oos[i,])
      cova = cov(returns[seq(i,nobsinsample+i-1),])
      globalstd[i,] = sqrt(t(ptf_weights)%*%cova%*%ptf_weights)
    }
  }
  if (strat == "dynamic"){
    ret = matrix(0,nobsoos-1,dim(returns)[2])
    globalstd = matrix(0,nobsoos-1,1)
    turnover = matrix(0,nobsoos-1,1)
    for (i in seq(1,nobsoos-1)){
      ret[i,] = t(ptf_weights[i,,])*returns_oos[i,]
      cova = cov(returns[seq(i,nobsinsample+i-1),])
      globalstd[i,] = sqrt(t(ptf_weights[i,,])%*%cova%*%ptf_weights[i,,])
      if (i>=2){
        turnover[i-1,] = sum(abs(ptf_weights[i,,]-ptf_weights[i-1,,]));
      }
    }
    p.turnover = sum(turnover/(nobsoos-1));
  }
  #Sharpe = sharpe(ret,0); #%check if sharpe is ok for various assets
  p.returns = ret
  p.mu = mean(apply(ret,1,sum)) #%ptf returns mean
  p.var = var(apply(ret,1,sum)) #%ptf returns variance
  p.sigma = sqrt(p.var)
  p.sharpe = p.mu/p.sigma
  p.globalstd = globalstd
  
  if (strat == "fixed"){
    
    return(list(p.returns=p.returns, 
                p.mu=p.mu,
                p.var=p.var,
                p.sigma=p.sigma,
                p.sharpe=p.sharpe,
                p.globalstd=mean(p.globalstd),
                p.rho=mean(rho)
    )
    )
  }else{return(list(p.returns=p.returns, 
                    p.mu=p.mu,
                    p.var=p.var,
                    p.sigma=p.sigma,
                    p.turnover=p.turnover,
                    p.sharpe=p.sharpe,
                    p.globalstd=mean(p.globalstd),
                    p.rho=mean(rho)
  )
  )}
  
}


sapply(list("MRCD.R","optimalh.R"),source)

library('rrcov') #for PcaHubert

# 1. Read data
#--------------

data = read.csv( paste( getwd(),"/Dataset_Finale.csv",sep=""),header=F)
data<-apply(log(data),2,diff)

# 2. Loop to get results
#-----------------------

setp = c(30,50,100,150,200,300)
nobsinsample = 60
nobsoos = 201
strat = "fixed"
hopt = 0.5*nobsinsample
type = "MRCD"

for (k in setp){
  
  p=k
  if (p==30) returns = data[,1:30]
  if (p==50) returns = data[,1:50]
  if (p==100) returns = data[,1:100]
  if (p==150) returns = data[,1:150]
  if (p==200) returns = data[,1:200]
  if (p==300) returns = data[,1:300]
  
  
  
  #%% Fixed Strategy
  if (strat == "fixed"){
    rho=0
    #% 1. Calculate the first covariance matrix
    if (type == "sample"){Cov_Matrix = cov(returns[seq(1,nobsinsample),])}
    if (type == "MRCD"){
      mX=t(returns)
      mX=mX[,seq(1,nobsinsample)]
      result = mrcd(mX=mX,h=hopt)
      Cov_Matrix = result$icov
      rho = result$rho
    }
    #% 2. Run ptf optimization for first period
    ptf_weights = GMV(Cov_Matrix)
    #% 3. Calculate ptf performances
    performance = performances(returns,nobsinsample,nobsoos,ptf_weights,strat,rho)
  }
  
  
  #%% Dynamically Rebalanced Strategy
  if (strat == "dynamic") {
    #%1. Calculate covariance matrices == NB quando fai per MRCD prendere i
    #%dati!!!!!
    Cov_Matrix = array(0, dim=c(202,k,k))
    ptf_weights = array(0, dim=c(202,k,1))
    rho = matrix(0,202,1)
    
    for (i in seq(1,nobsoos+1)){
      if (type == "sample"){Cov_Matrix[i,,] = cov(returns[seq(i,nobsinsample+i-1),])}
      if (type == "MRCD"){
        mX = returns[seq(i,nobsinsample+i-1),]
        mX = t(mX)
        result = mrcd(mX=mX,h=hopt)
        Cov_Matrix[i,,] = result$icov
        rho[i,] = result$rho}
      #%loop to obtain 202 covariance 
      #%matrices to support out-of-sample analysis;results stored in Cov_Matrix.
    }
    
    #% 2. Run ptf optimization
    for (i in seq(1,nobsoos+1)){ ptf_weights[i,,] = GMV(Cov_Matrix[i,,])}
    
    #% 3. Calculate ptf performances
    performance = performances(returns,nobsinsample,nobsoos,ptf_weights,strat,rho);
  }
  
  if (p == 30){risultati_30 = performance}
  if (p == 50){risultati_50 = performance}
  if (p == 100){risultati_100 = performance}
  if (p == 150){risultati_150 = performance}
  if (p == 200){risultati_200 = performance}
  if (p == 300){risultati_300 = performance}
  rm(performance)
}

