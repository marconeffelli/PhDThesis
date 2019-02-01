####################################################################################################
##  name: optimalh
####################################################################################################

require(robustbase)
require(tawny)
require(Matrix)
require(pcaPP) #Kendall's tau

####################################################################################################
##  Auxiliary functions
####################################################################################################

source("helperfunctionsMRCD.R")

####################################################################################################
##  Function optimalh()
####################################################################################################

optimalh <- function(mX, seth=seth, target=1, rho=NULL, rescale = TRUE, rescaleSVD=TRUE, bc=TRUE,
                 maxcond=1000, minscale=0.001, mindet=0, objective='geom', maxit=200, initrho=0.1)
  # compute the Minimum Regularized Covariance Determinant (MRCD) estimator
  # input:
  #   mX: the p by n or T matrix of the data (note that p is the dimension and n or T the size of the data)
  #   seth: set of possible h-values for which objective function and MRCD covariance estimate is computed
  #   target: structure of the robust positive definite target matrix (default=1)
  #           0: target matrix is diagonal matrix with robustly estimated univariate scales on the diagonal  
  #           1: non-diagonal target matrix that incorporates an equicorrelation structure (see (17) in paper) 
  #   rescale: if true, the p variables are first (robustly) standardized (default=TRUE)
  #   rescaleSVD: if true, use the singular value decomposition of the target matrix (default=TRUE)
  #   bc: if true, standardization is used to ensure proper correlation matrix (ones on diagonal)
  #   maxcond: maximum condition number allowed (see step 3.4 in algorithm 1)
  #   minscale: minimum scale allowed
  #   mindet: minimum determinant allowed for target matrix ()
  #   objective: objective function to determine optimal subset, see (3) in paper (default='geom')
  #           'det': typically one minimizes the determinant of the sample covariance based on the subset
  #           'geom': p-th root of determinant or standardized generalized variance (for numerical reasons)
  #   maxit: maximum number of generalized C-steps for each initial subset 

  # output (a list):
  #   objh: objective function for set of h-values (given in seth)
  #   covh: MRCD covariance estimates of the standardized data W for set of h-values (given in seth) 
   
{
  
  iT = dim(mX)[2]; ip = dim(mX)[1]
  
  #choose objective function to determine optimal subset
  if (objective=='det'){
    obj<-function(x){det(x)}
  }else if (objective=='geom'){
    obj<-function(x){det(x)^(1/ip)} #geometric mean of eigenvalues
  }
  
  ## 1. Standardize the p variables: compute standardized observations u_i, see (6) in paper, using median and Qn estimator
  if(rescale){
    vmx = apply(mX,1,"median")
    vsd = apply(mX,1,"Qn")
    print(c("correcting",mean(vsd<minscale),"percent of the sds"))
    vsd[vsd<minscale] <- minscale
    Dx = diag(vsd)
    mU = scale(t(mX),center=vmx,scale=vsd)
    mX = t(mU)
    mT=TargetCorr(mX,target=target,mindet=mindet);
  }else{
    mT=TargetCov(mX,target=target);
    mU = t(mX)
  }
  
  ## 2. Perform singular value decomposition of target matrix and compute observations w_i
  if(rescaleSVD){
    mTeigen=eigen(mT)
    mQ=mTeigen$vectors
    mL=diag(mTeigen$values)
    msqL=diag(sqrt(mTeigen$values))
    misqL=diag(sqrt(mTeigen$values)^(-1))
    mW=mU%*%mQ%*%misqL
    mX=t(mW)
    mT=diag(ip)
  }
  vMu=rowMeans(mX)
  
  ## 3.1-3.2 Follow Hubert et al. (2012) to obtain 6 initial scatter matrices (if scatter matrix is not invertible, use its regularized version)
  ## 3.3 Determine subsets with lowest Mahalanobis distance  
  
  y1 <- tanh(t(mX))
  R1 <- cor(y1)
  R1.inv <- try(solve(R1),silent=TRUE)
  if(class(R1.inv)=="try-error"){
    if(is.null(initrho)){R1.inv <- ginv(R1)}else{
      R1 = initrho*mT+(1-initrho)*R1
      R1.inv = solve(R1)
    }
  }
  dist.1 = sqrt(mahalanobis(t(mX), center=rep(0,ip), cov=R1.inv, inverted=TRUE))
  mind.1 = sort(dist.1,index.return=TRUE,decreasing=FALSE)$ix   
  
  R2 <- cor( t(mX), method = "spearman")
  R2.inv <- try(solve(R2),silent=TRUE)
  if(class(R2.inv)=="try-error"){
    if(is.null(initrho)){R2.inv <- ginv(R2)}else{
      R2 = initrho*mT+(1-initrho)*R2
      R2.inv = solve(R2)
    }
  }
  dist.2 = sqrt(mahalanobis(t(mX), center=rep(0,ip), cov=R2.inv, inverted=TRUE))
  mind.2 = sort(dist.2,index.return=TRUE,decreasing=FALSE)$ix 

  y3 <- qnorm((apply( t(mX), 2L, rank) - 1/3)/(iT + 1/3))
  R3 <- cor(y3, use = "complete.obs")
  R3.inv <- try(solve(R3),silent=TRUE)
  if(class(R3.inv)=="try-error"){
    if(is.null(initrho)){R3.inv <- ginv(R3)}else{
      R3 = initrho*mT+(1-initrho)*R3
      R3.inv = solve(R3)
    }
  }
  dist.3 = sqrt(mahalanobis(t(mX), center=rep(0,ip), cov=R3.inv, inverted=TRUE))
  mind.3 = sort(dist.3,index.return=TRUE,decreasing=FALSE)$ix 
  
  x = t(mX)
  znorm <- sqrt(rowSums(x^2))
  ii <- znorm > .Machine$double.eps
  x.nrmd <- x
  x.nrmd[ii, ] <- x[ii, ]/znorm[ii]
  R4 <- crossprod(x.nrmd)
  R4.inv <- try(solve(R4),silent=TRUE)
  if(class(R4.inv)=="try-error"){
    if(is.null(initrho)){R4.inv <- ginv(R4)}else{
      R4 = initrho*mT+(1-initrho)*R4
      R4.inv = solve(R4)
    }
  }
  dist.4 = sqrt(mahalanobis(t(mX), center=rep(0,ip), cov=R4.inv, inverted=TRUE))
  mind.4 = sort(dist.4,index.return=TRUE,decreasing=FALSE)$ix 

  ind5 <- order(znorm)
  half <- ceiling(iT/2)
  Hinit <- ind5[1:half]
  R5 <- cov(x[Hinit, , drop = FALSE])
  R5.inv <- try(solve(R5),silent=TRUE)
  if(class(R5.inv)=="try-error"){
    if(is.null(initrho)){R5.inv <- ginv(R5)}else{
      R5 = initrho*mT+(1-initrho)*R5
      R5.inv = solve(R5)
    }
  }
  dist.5 = sqrt(mahalanobis(t(mX), center=rep(0,ip), cov=R5.inv, inverted=TRUE))
  mind.5 = sort(dist.5,index.return=TRUE,decreasing=FALSE)$ix   
  

  ogk<-covOGK(t(mX), sigmamu=s_Qn)
  mu.ogk = ogk$center
  Sigma.ogk.inv = solve(ogk$cov)
  dist.6 = sqrt(mahalanobis(t(mX), center=mu.ogk, cov=Sigma.ogk.inv, inverted=TRUE))
  mind.6 = sort(dist.6,index.return=TRUE,decreasing=FALSE)$ix 
  
  mindorig = cbind(mind.1,mind.2,mind.3,mind.4,mind.5,mind.6)
  
  i=1;objh=c();covh={};
  
  mXorig=mX
  mTorig=mT
  
  for (h in seth){  
  #print(h)
  if(!is.null(h)){alpha = h/iT
  }else if(is.null(h)){h = floor(alpha*iT)}
  
  mX=mXorig  
  mT=mTorig  
  mind=mindorig
  mind=mind[1:h,] 
  scfac=scfactor(alpha=alpha,ip=ip)
  
  ## 3.4 Determine smallest value of rho_i for each subset
  
  rho6pack=c()
  condnr=c()
  if(is.null(rho)){
    for (k in 1:6){
      mXsubset = mX[ , mind[,k]]
      vMusubset=rowMeans(mXsubset)
      mE = mXsubset-vMusubset
      mS = mE%*%t(mE)/h    

      if( all(mT == diag(ip))){
        veigen = eigen( scfac*mS )$values
        e1 = min(veigen)
        ep = max(veigen)
        fncond = function(rho){
          condnr =  (rho+(1-rho)*ep)/(rho+(1-rho)*e1 )
          return( condnr-maxcond  )
        }        
      }else{
        fncond = function(rho){
          rcov = rho*mT + (1-rho)*scfac*mS
          temp = eigen(rcov)$values
          condnr = max(temp)/min(temp)
          return( condnr-maxcond  )
        }      
      }
      out = try(uniroot(f=fncond,lower=0.00001, upper=0.99))
      if(class(out)!="try-error"){
        rho6pack[k]=out$root
      }else{
        grid=c(0.000001,seq(0.001,0.99,by=0.001),0.999999)    
        if( all(mT == diag(ip))){
          objgrid = abs(fncond(grid))
          irho = min( grid[objgrid==min(objgrid)])          
        }else{
          objgrid = abs(apply(as.matrix(grid),1,"fncond"))
          irho = min( grid[objgrid==min(objgrid)])           
        }
        rho6pack[k]=irho
      }

    }
  
    ## 3.5 Set rho as max of the rho_i's obtained for each subset in previous step
    rho=max(rho6pack)
  }
  
  ## 3.6 For each of the six initial subsets, repeat the generalized C-steps (from Theorem 1) until convergence
  ## 3.7 Choose final subset that has lowest determinant among the ones obtained from the six initial subsets
  ret = cstep_mrcd(mX=mX, rho=rho, mT=mT, h=h, alpha=alpha, index=mind[,1], maxit=maxit) 
  objret = obj(ret$cov)
  hindex = ret$index
  best6pack = 1
  for(k in 2:6){ 
    tmp = cstep_mrcd(mX=mX, rho=rho, mT=mT, target=target, h=h, alpha=alpha, index=mind[,k], maxit=maxit) 
    objtmp = obj(tmp$cov)
    if(objtmp<=objret){ret=tmp; objret=objtmp; hindex=tmp$index; best6pack = k} 
  }
  c_alpha = ret$scfac #scaling factor  
  XX = mX[,hindex]
  mE = XX-ret$mu
  weightedScov =  mE%*%t(mE)/h
  
  objh[i]=objret
  covh[[i]]=ret$cov
  i=i+1
  }
  
  
  return(list(objh=objh,
              covh=covh
              )
         )
  

}