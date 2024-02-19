# compute the expected value and variance of a absorbing state
# Example 3 (Revisited, P Matrix changed). Consider a system with 2 computers. The computer repair process has  3 states: 
#  0 (no computer has failed); 
#  1 (one computer has failed);
#  2 (both computers have failed).

# The transition probability Matrix P is
vector<-array(c(0.6,0.8,0,0.3,0.2,0,0.1,0,1))
P<-matrix(vector, nrow=3)
print(P)

# What is the expected number of steps to state 2 where two machines fail eventually?
# The answer is u=1-v (make sure the negative prob is set to zero or the probability above 1 is actually 1)
B<-P[1:2,1:2]
print(B)
# Expected value m=[m1,m2] is then
I<-diag(2)
print(I)
InverseIB<-solve((I-B))
print(InverseIB)
e<-c(1,1)
m<-InverseIB %*% e
print("The Expected first passage time is: ")
print(m)

# Variance of T (first passage time) computation
# Let mo2 as the 2nd moment; mo1=m is the 1st moment
# m02=2*B*mo1 + B*mo2   or
# mo2=inv(I-B)*2*B*mo1
# variance=mo2 + mo1 - (mo1)^2
mo2=2*InverseIB%*%B%*%m
print(mo2)
var=mo2+ m - m*m
print("The variance of the first passage time is:")
print(var)

