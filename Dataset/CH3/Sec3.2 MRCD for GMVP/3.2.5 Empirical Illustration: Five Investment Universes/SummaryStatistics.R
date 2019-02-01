rm(list = ls())  # cleanup

#install.packages("moments")
library(moments)

tablesummary = matrix(0,7,5)
load('OperatingProfitabilityandInvestment.RData')
i=1
tablesummary[1,i]=min(as.matrix(data))
tablesummary[2,i]=max(data)
tablesummary[3,i]=mean(as.matrix(data))
tablesummary[4,i]=median(as.matrix(data))
tablesummary[5,i]=sd(as.matrix(data))
tablesummary[6,i]=mean(skewness(data))
tablesummary[7,i]=mean(kurtosis(data))

load('SizeandBooktoMarket.RData')
i=2
tablesummary[1,i]=min(data)
tablesummary[2,i]=max(data)
tablesummary[3,i]=mean(as.matrix(data))
tablesummary[4,i]=median(as.matrix(data))
tablesummary[5,i]=sd(as.matrix(data))
tablesummary[6,i]=mean(skewness(data))
tablesummary[7,i]=mean(kurtosis(data))

load('SizeandMomentum.RData')
i=3
tablesummary[1,i]=min(data)
tablesummary[2,i]=max(data)
tablesummary[3,i]=mean(as.matrix(data))
tablesummary[4,i]=median(as.matrix(data))
tablesummary[5,i]=sd(as.matrix(data))
tablesummary[6,i]=mean(skewness(data))
tablesummary[7,i]=mean(kurtosis(data))

load('Industry.RData')
i=4
tablesummary[1,i]=min(data)
tablesummary[2,i]=max(data)
tablesummary[3,i]=mean(as.matrix(data))
tablesummary[4,i]=median(as.matrix(data))
tablesummary[5,i]=sd(as.matrix(data))
tablesummary[6,i]=mean(skewness(data))
tablesummary[7,i]=mean(kurtosis(data))

load('DatasetValencia.RData')
i=5
tablesummary[1,i]=min(data)
tablesummary[2,i]=max(data)
tablesummary[3,i]=mean(as.matrix(data))
tablesummary[4,i]=median(as.matrix(data))
tablesummary[5,i]=sd(as.matrix(data))
tablesummary[6,i]=mean(skewness(data))
tablesummary[7,i]=mean(kurtosis(data))



#install.packages("nortest")
#library(nortest)
#ad.test(data)
