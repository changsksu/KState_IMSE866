# Examples 3.2 and 3.6 
# -----------------------------------------------------------------------------------------------------------------
# The transition probability Matrix P is
vector<-array(c(1,1/4,0,1/16,0,0,0,1/2,0,1/4,0,0,0,0,0,1/8,0,0,0,1/4,1,1/4,1/4,0,0,0,0,1/4,1/2,0,0,0,0,1/16,1/4,1))
P<-matrix(vector, nrow=6)
print(P)
# -----------------------------------------------------------------------------------------------------------------
# from the P matrix the absorbing states are 1 and 6 since p11=1 and p66=1
# What is the absorbing state probability? i.e. what is the probability that two machine will fail eventually?
# The answer is u=1-v (make sure the negative prob is set to zero or the probability above 1 is actually 1)
B1<-P[-1,-1]
print(B1)
B<-B1[-5,-5]
print(B)
D1<-P[2:5,1]
D2<-P[2:5,6]
print(D1)
D<-matrix(c(D1,D2), nrow=4) #1st column is D1
print(D)
I<-diag(4)
print(I)
InverseIB<-solve((I-B))
print(InverseIB)
v<-InverseIB%*%D
print(v)
u<-1-v
print(u)
# Note that u is 4 x 2 matrix, the first column is to absorbing state 1
# the 2nd column is to absorbing state 6
# -----------------------------------------------------------------------------------------------------------------
# EX 4.3 for P(n) n is large
Pn=P
for (n in 1:10) {
  Pn = Pn%*%P
}
print(Pn)
# run it 100 times
Pn=P
for (n in 1:100) {
  Pn = Pn%*%P
}
print(Pn)
#
# compute the occupancy matrix
#
Mn=diag(6) # r=0
print(Mn)
Pn=P
for (n in 1:10) {
  Mn=Mn + Pn
  Pn = Pn%*%P
}
print(Mn)
# Compute the fraction of Time from one state to another
n
print(Mn/(n+1))