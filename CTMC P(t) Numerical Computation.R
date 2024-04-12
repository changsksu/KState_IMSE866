# CTMC Computation: small increments (called steps) in matrix P(t)
# step = number of small increments
#
# Example. Two state machine revisited. lampda=1.5 and u=1.
#
step = 20
lambda =1.5
mu= 1
dlambda= lambda * (1/step)
dmu= mu * (1/step)
#
#define the function for iterative solution
solveA=function(n, a, P) {
  for (i in 1:n){
    a2<-a%*%P
    a<-a2
  }
  a
}
# define initial state
a<-c(1,0)
# define pij with small increments
p01<- dlambda
p00<- 1-p01
p10<- dmu
p11<- 1-p10
p01
p00
P<-array(c(p00, p10, p01, p11), dim=c(2,2))
# P' matrix = numerical approximation of P(t)
P
# The state probability vector over time t=1 time unit
step
solveA(step, a, P) #n=step iterations
#
#
# Your turn: try step=100 and compare it to step=20.
#
step<-100
lambda =1.5
mu= 1
dlambda= lambda * (1/step)
dmu= mu * (1/step)
p01<- dlambda
p00<- 1-p01
p10<- dmu
p11<- 1-p10
p01
p00
P<-array(c(p00, p10, p01, p11), dim=c(2,2))
# P' matrix = numerical approximation of P(t)
P
# The state probability vector over time t=1 time unit
step
solveA(step, a, P) #n=step iterations
#
#
# Your turn: How do you solve for P(t=3)?
# Hint: revise lambda and mu to accommodate t=3 from t=1
a = c(1,0)
step = 100
t = 3 
lambda =1.5 * t
mu= 1 * t
dlambda= lambda * (1/step)
dmu= mu * (1/step)
p01<- dlambda
p00<- 1-p01
p10<- dmu
p11<- 1-p10
p01
p00
P<-array(c(p00, p10, p01, p11), dim=c(2,2))
# The state probability vector over time t=
t
step
solveA(step, a, P) #n=step iterations
#
#
# Your turn: How do you solve for P(t) where t is infinte?
# Hint: revise lambda and mu to accomodate t= a long time & increase steps
# try t=10 and 1000 steps vs t=100 and 10000 steps
step = 10000
t = 100
lambda =1.5 *t
mu= 1 * t
dlambda= lambda * (1/step)
dmu= mu * (1/step)
p01<- dlambda
p00<- 1-p01
p10<- dmu
p11<- 1-p10
p01
p00
P<-array(c(p00, p10, p01, p11), dim=c(2,2))
# The state probability vector over time t=
t
step
solveA(step, a, P) #n=step iterations