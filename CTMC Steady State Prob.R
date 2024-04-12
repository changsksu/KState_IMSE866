# compute the steady state proability ap=(ap0, ap1, ..., apk)
# CTMC Example: Consider a system with 1 machine 2 states 
# S={0,1} where 0 - machine down; 1 - machine available; 
# repair rule: failure rate 1 /day; repair rate 0.1/day (from state 0 to 1)
#
lambda = 0.1
mu = 1
vector<-array(c(-1*lambda, mu, lambda, -1*mu))
Q<-matrix(vector, nrow=2)
print(Q)
#
# What is the steady-state probability?
#
Qa<-Q
for (x in 1:2) {
  Qa[x,1] <- 1
}
print(Qa)
# ap Qa = e where e=[1,0]
e<-c(1,0)

InverseQa<-solve(Qa)
ap <- e %*% InverseQa
print(InverseQa)
print(ap)


# CTMC Steady State Example 2: Consider a system with 2 machines 
# S={0,1,2} where 0 - all machines down; 1 - one machine available; 2 - both machine available.
# repair rule: one crew works on one machine
# failure rate 1 /day repair rate 0.1/day
#  0 (no machine available); 
#  1 (one machine available);
#  2 (both machine available).
#
lambda = 0.1
mu = 1
vector2<-array(c(-2*lambda, mu, 0, 2*lambda, -1*(lambda+mu), 2*mu,0,lambda,-2*mu))
Q<-matrix(vector2, nrow=3)
print(Q)

# What is the steady-state probability?

Qa<-Q
for (x in 1:3) {
  Qa[x,1] <- 1
}
print(Qa)
# ap Qa = e where e=[1,0,0]
e<-c(1,0,0)

InverseQa<-solve(Qa)
ap <- e %*% InverseQa
print(InverseQa)
print(ap)
