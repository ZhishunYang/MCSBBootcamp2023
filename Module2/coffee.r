# How much caffeine is there in the jar?

# n - number of days
# x - fraction of caffeinated

nMax <- 1000 # max number of days to simulate

r <- 2.9
K <- 0.6
x <- rep(0, nMax) # fraction caffeinated
x[1] <- 0.2 # initial fraction caffeinated

for (n in 2:nMax) {
  x[n] <- x[n-1] + r*(1-x[n-1]/K)*x[n-1]
}

plot(x, type='o', pch=16, col='black', ylab='fraction caffeinated', xlab='Days',xlim = c(nMax-6,nMax))
x

#-------g
nMax=1000
r=seq(0,2.9,0.1)
x=matrix(NA,nMax,length(r))
x[1,]=rep(0.2,length(r))
K=0.6

for(ri in 1:length(r)){
  for (n in 2:nMax) {
    x[n,ri] <- x[n-1,ri] + r[ri]*(1-x[n-1,ri]/K)*x[n-1,ri]
  }
}

#get the last 100 obs 
xmat=x[901:1000,]

#plot
plot(NULL,xlab="r",ylab="pop",xlim=c(0,3),ylim=c(0,1))
for (i in 1:length(r)) {
  points(x=rep(r[i],dim(xmat)[1]),y=xmat[,i])
}


