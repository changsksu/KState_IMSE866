# Expected number of visits R(i, j) for transient states
# P matrix from Examples 3.2 and 3.6 
# S={{2,3,4,5}, {1,6}} where states 2, 3, 4, 5 are transient states
# The expected number of visits for the recurrent or absorbing states are infinity
# -----------------------------------------------------------------------------------------------------------------
# The transition probability Matrix P is
vector<-array(c(1,1/4,0,1/16,0,0,0,1/2,0,1/4,0,0,0,0,0,1/8,0,0,0,1/4,1,1/4,1/4,0,0,0,0,1/4,1/2,0,0,0,0,1/16,1/4,1))
P<-matrix(vector, nrow=6)
print(P)
# -----------------------------------------------------------------------------------------------------------------
# from the P matrix the absorbing states are 1 and 6 since p11=1 and p66=1
#
B1<-P[-1,-1]
# print(B1)
B<-B1[-5,-5]
print(B)
# D1<-P[2:5,1]
# D2<-P[2:5,6]
# print(D1)
# D<-matrix(c(D1,D2), nrow=4) #1st column is D1
# print(D)
I<-diag(4)
print(I)
InverseIB<-solve((I-B))
R=InverseIB
print("The expected numbers of visits R(i,J) are")
print(R)
# -----------------------------------------------------------------------------------------------------------------
# compute the F matrix where Fij is the probability of state i ever reaching state j
# if both i, j are transient F(j,j)=1- 1/R(j,j) or F(i, j)=R(i,j)/R(j, j)
# from the P matrix the absorbing states are 1 and 6 since p11=1 and p66=1
#
# Transient states are 2, 3, 4, 5
# compute F(2,2)
print("The probability of state 2 ever reaching state 2 is")
F22= 1-1/R[2,2]
print(F22)
# compute F(2,3)
print("The probability of state 2 ever reaching state 3 is")
F23= R[2,3]/R[3,3]
print(F23)