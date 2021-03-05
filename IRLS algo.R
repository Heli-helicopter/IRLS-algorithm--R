y<-c(1,6,16,23,27,39,31,30,43,51,63,70,88,97,91,104,110,113,149,159) #number of aids cases per quater in Australia from 1984 to 1988
x<-c(1:20) #quaters from 1984 to 1988
i<-log(x) #tranformed for link function

png("Scattter.png")
plot(x,y, xlab='Quater', ylab='Number of cases', main='Scatter plot of aids cases in Aus 1984 - 1988')
dev.off()


IRLS<- function(y,x){
  
  N<-length(y)
  y<-as.matrix(y)
  X<-matrix(c(rep(1,N),x),N,2)
  B<-c(1,1) #initializing betas
  int<-0
  
  while(int < 11) {
    
    w<-exp(B[1]+B[2]*x)
    z<-(B[1]+B[2]*x)+(y-exp(B[1]+B[2]*x))/exp(B[1]+B[2]*x)
    W<-diag(w,N,N)
    
    b.step2<-solve(t(X)%*%W%*%X)%*%t(X)%*%W%*%z 
    #print(b.step2)
    B<-b.step2
    int<-int+1
    
  }
  return(B) #function returns a 1x2 matrix of the re-weighted betas for the GLM
}

IRLS(y,i) 



fit<-glm(y~i, family=poisson(link="log")) #compare function output with glm function output
summary(fit)

