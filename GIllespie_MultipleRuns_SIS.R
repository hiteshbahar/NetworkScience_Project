# SIS Simulation Code

install.packages("GillespieSSA")
library(GillespieSSA)

#### Ro = 0.8
#beta <- 0.00167   0.9 -> 0.00188   0.95 -> 
#gamma <- 0.002083

x0 <- c(S=99, I=1)
a <- c("0.00167*{S}*{I}/({S}+{I})","0.002083*{I}")
nu <- matrix(c(-1,0,
               +1,-1),nrow=2,byrow=T)

nruns <- 100
time <- 500
out <- lapply(X=1:nruns,FUN=function(x) ssa(x0, a, nu, tf=time)$data)

plot(out[[1]][,1],out[[1]][,3], main="SIS Epidemic Model (Ro = 0.8)",ylab="# if infections",
     xlab="# of Time Steps",ylim=c(0,50),xlim=c(0,time),col="grey", type="l")
for (i in 2:nruns){lines(out[[i]][,1],out[[i]][,3])}


#### Ro = 1.0

b <- c("0.002083*{S}*{I}/({S}+{I})","0.002083*{I}")

out1 <- lapply(X=1:nruns,FUN=function(x) ssa(x0, b, nu, tf=time)$data)

plot(out1[[1]][,1],out1[[1]][,3], main="SIS Epidemic Model (Ro = 1.0)",ylab="# if infections",
     xlab="# of Time Steps",ylim=c(0,50),xlim=c(0,time),col="grey", type="l")
for (i in 2:nruns){lines(out1[[i]][,1],out1[[i]][,3])}


#### Ro = 1.2

c <- c("0.0025*{S}*{I}/({S}+{I})","0.002083*{I}")

out2 <- lapply(X=1:nruns,FUN=function(x) ssa(x0, c, nu, tf=time)$data)

plot(out2[[1]][,1],out2[[1]][,3], main="SIS Epidemic Model (Ro = 1.2)",ylab="# if infections",
     xlab="# of Time Steps",ylim=c(0,50),xlim=c(0,time),col="dark red", type="l")
for (i in 2:nruns){lines(out2[[i]][,1],out2[[i]][,3])}


#### Ro = 1.8

d <- c("0.00375*{S}*{I}/({S}+{I})","0.002083*{I}")

out3 <- lapply(X=1:nruns,FUN=function(x) ssa(x0, d, nu, tf=time)$data)

plot(out3[[1]][,1],out3[[1]][,3], main="SIS Epidemic Model (Ro = 1.8)",ylab="# if infections",
     xlab="# of Time Steps",ylim=c(0,50),xlim=c(0,time),col="black", type="l")
for (i in 2:nruns){lines(out3[[i]][,1],out3[[i]][,3])}


#### Ro = 4.5

e <- c("0.00937*{S}*{I}/({S}+{I})","0.002083*{I}")

out4 <- lapply(X=1:nruns,FUN=function(x) ssa(x0, e, nu, tf=time)$data)

plot(out4[[1]][,1],out4[[1]][,3], main="SIS Epidemic Model (Ro = 4.5)",ylab="# if infections",
     xlab="# of Time Steps",ylim=c(0,50),xlim=c(0,time),col="black", type="l")
for (i in 2:nruns){lines(out4[[i]][,1],out4[[i]][,3])}


