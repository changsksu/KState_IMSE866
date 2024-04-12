# compute the expected value and variance of an ending state
# CTMC Example: Consider a system with 2 machines 
# S={0,1,2} where 0 - all machines down; 1 - one machine available; 2 - both machine available.
# repair rule: failure rate 1 /day repair rate 0.1/day
#  0 (no machine available); 
#  1 (one machine available);
#  2 (both machine available).
#
# The transition probability Matrix P is
# vector<-array(c(-0.2,1,0,0.2,-1.1, 2,0,0.1,-2))
lambda = 0.1
mu = 1
vector2<-array(c(-2*lambda, mu, 0, 2*lambda, -1*(lambda+mu), 2*mu,0,lambda,-2*mu))
Q<-matrix(vector2, nrow=3)
print(Q)

# What is the expected number of time to state 2 from state 0 when both machines are down?

B<-Q[1:2,1:2]
print(B)
# Expected value m=[m0,m1] is then
# B m + e = 0 where e is a vector of 1s
InverseB<-solve(B)
print(InverseB)
e<-c(1,1)
m<-InverseB %*% (-1*e)
# the answer is m0 - the first element in m vector
print("The Expected first passage time is: ")
print(m)

# What is the standard deviation of T to state 2 from state 0?
# Variance of T (first passage time) computation
# Let mo2 as the 2nd moment; mo1=m is the 1st moment
# m02=2*B*mo1 + B*mo2   or
# mo2=inv(I-B)*2*B*mo1
# variance=mo2 + mo1 - (mo1)^2
Bt <- t(B)
print(Bt)
InverseBtB<- solve(Bt%*%B)
mo2=-2*InverseBtB %*% Bt %*% m
print(mo2)

var=mo2+ m - m*m
print("The variance of the first passage time is:")
print(var)
# the answer is var0 - the first element in var vector
print("The std of the first passage time is:")
std <- sqrt(var)
print(std)