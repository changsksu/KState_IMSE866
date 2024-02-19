# This code computes the steady-state probability a given a0.
# Example, two computer failure
# define a function to sovle the steady state a using a large n
solveA=function(n,a, P) {
  for (i in 1:n){
    an<-a%*%P
    a<-an
  }
  return(an)
}

# to solve steady state distribution numerically
a<-c(1,0,0)
print("The initial state condition is")
print(a)
#
# note that the following P is irreducible
#
P<-array(c(0.6, 0.8, 1, 0.3,0.2,0, 0.1,0,0), dim=c(3,3))
# execute the function
an<-solveA(100, a, P)
print("The steady-state probability vector is")
print(an)
#
# note that the following P is reducible since there is an absorving state
# S={{0,1}, {2}}
#
P<-array(c(0.6, 0.8, 0, 0.3,0.2,0, 0.1,0,1), dim=c(3,3))
print(P)
a<-c(1,0,0)
an<-solveA(100, a, P)
print("The steady-state probability vector is")
print(an)
# the final an has close to 1 in state 2 and 0 in states 0 & 1