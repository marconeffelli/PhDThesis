############################################################################################################################################################
## Helper functions for Paper
############################################################################################################################################################

SimulateReturns <- function(n, p, MC)
  # compute the scaling factor
  # input:
  #   alpha: the proportion of the contamination (between 0.5 and 1)
  #   ip: the dimension
  # output:
  #   the scaling factor
{
  mu = 0.08/12
  omega = 0.16/12
  B1_true = 1
  B1_max = 1.5
  B1_min = 0.5
  B_istrue = matrix(B1_true,p,1)
  
  Sigma_epsilon = diag(numeric(p)+0.2/12); #innovations variance
  True_cov = B_istrue%*%omega%*%t(B_istrue)+Sigma_epsilon
  
  Ret = matrix(numeric(p*n),p,n)
  Returns = array(0,dim=c(n,p,MC))
  for (j in 1:MC){
    for (i in 1:n){
      Rbt = rnorm(p,mu,omega)
      Sigma_epsilon = diag(numeric(p)+runif(p, min=0.15, max=0.25)/12)
      epsilon = mvrnorm(1, mu=numeric(p), Sigma=Sigma_epsilon)
      B = runif(p, min=B1_min, max=B1_max)
      Rat = B*Rbt + epsilon
      Ret[,i] = Rat;
    }
    Returns[,,j] = t(Ret);
  }
  
  
  #contamination
  returns_cont01=array(0,dim=c(n,p,MC))
  returns_cont02=array(0,dim=c(n,p,MC))
  returns_cont03=array(0,dim=c(n,p,MC))
  for (j in 1:MC){
    sim_data_cont = apply(Returns[,,j],2,mean)+5*apply(Returns[,,j],2,sd)
    sim_data_cont01 = Returns[,,j]
    sim_data_cont02 = Returns[,,j]
    sim_data_cont03 = Returns[,,j]
    for (k in 1:p){
      h1 = round(runif(round(0.025*n), min=1, max=n))
      sim_data_cont01[h1,k] =  sim_data_cont[k]
      h2 = round(runif(round(0.075*n), min=1, max=n))
      sim_data_cont02[h2,k] =  sim_data_cont[k]
      h3 = round(runif(round(0.1*n), min=1, max=n))
      sim_data_cont03[h3,k] =  sim_data_cont[k]
    }
    returns_cont01[,,j]=sim_data_cont01
    returns_cont02[,,j]=sim_data_cont02
    returns_cont03[,,j]=sim_data_cont03
  }
  return(list(Returns=Returns, returns_cont01=returns_cont01, returns_cont02=returns_cont02, returns_cont03=returns_cont03,True_cov=True_cov))
}



#GMV <- function(S){
#  #%Calculation of GMV-weights
#  iota=matrix(1,dim(S)[1],1)
#  w_GMV=(solve(S)%*%iota)/as.vector((t(iota)%*%(solve(S)%*%iota)))
#  #std_GMV = sqrt(1/(iota'*(S\iota)));
#}

GMV <- function(S){
  iota=matrix(1,dim(S)[1],1)
  w_GMV=((S)%*%iota)/as.vector((t(iota)%*%((S)%*%iota)))
}

performances <- function(returns,nobsinsample,nobsoos,ptf_weights,strat,rho){
  fine = dim(returns)[1]
  returns_oos = returns[seq(nobsinsample+1,nobsinsample+nobsoos),]
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