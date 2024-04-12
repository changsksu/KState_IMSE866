# Exponential Distribution Related Computation
# X is Exp(lamda)
# pdf of x: the probability that x=t 
# rate is lambda
exp_pdf <- function(x, rate) {
  return(rate * exp(-rate * x))
}
exp_cdf <- function(x, rate) {
  return(1- exp(-rate * x))
}
# Example 1: Assuming that mean of the speed of a runner is 6 miles/hr.
# In other words, the runner runs 1/6 hours or 10 minutes per mile.
# What is the probability that runner will finish a mile below 3 minutes?
# 
pofx=exp_cdf (3/60, 6)
print(paste("The cdf of x is ", pofx))
# use the R build in Exponential CDF function
pexp(3/60,6)
#
# the pdf is dexp(x, rate) - not related to Example 1
# note that the density function of exponential dist can exceed 1 because
# it does not related to proability
dexp(3/60, 6)
exp_pdf (3/60, 6) # our customerized function
#
# Example 2: Assuming that breakdown rate is 0.002 count/hr 
# What is the probability for a breakdown for 100 hours of operation?
# 
# P(X<100) =
pofx2=exp_cdf (100, 0.002)
print(paste("The cdf of x is ", pofx2))
#
# What is the probability for no breakdown for 100 hours of operation?
#
# Ans. use the complementary of exp_cdf
#
# Your turn: establish the 95% CI of X where lambda=0.002 count/hr
lambda <- 0.002
x1 <- qexp(0.025, rate = lambda)
x2 <- qexp(0.975, rate = lambda)

cat("95% Confidence Interval:", x1, "-", x2)

