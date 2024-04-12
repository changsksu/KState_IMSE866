#
# Erlang CDF computation
# a factorial function is first built
factorial <- function(n) {
  if (n == 0 || n == 1) {
    return(1)
  } else {
    return(n * factorial(n - 1))
  }
}
# Example usage of factorial function:
n <- 5
result <- factorial(n)
print(paste("Factorial of", n, "is", result))
#
# Example usage of Erlang CDF:
sum<-0
z<- 15
lambda <- 1
x <- lambda * z
for (k in 0:9) {
  sum <- sum+(x^k/factorial(k))
}
print(paste("Factorial of 0:9 is", sum)) 
erlang_cdf <- 1 - lambda * exp(-x) * sum
result <- 1- erlang_cdf
print(paste("Factorial of P(Z>15) is", result))
#
# use Gamma cdf for the same question
1-pgamma(15, 10, 1)
# details ...
# Erlang CDF using Gamma distribution; pgamma is a built-in function in R to 
# calculate the CDF of the gamma distribution, which is equivalent to the 
# Erlang distribution with integer shape parameter.
# x is the value (e.g. days) at which you want to calculate the CDF.
# k is the shape parameter (e.g. counts) of the Erlang distribution. k=1 for Exponential
# lambda is the rate parameter of the Erlang distribution.
#
# Define a function to calculate Erlang CDF
erlang_cdf <- function(x, k, lambda) {
  if (x < 0) {
    return(0)
  } else {
    return(pgamma(x, k, lambda))
  }
}
# Example usage:
# Times between consecutive births in a maternity ward are i.i.d. exponential RV 
# with mean 1 day. What is the probability that the 10th birth in a calendar year 
# takes place after Jan. 15?
x <- 15 # since both Gamma and Erlang is dealing with time variable
k <- 10 # the shape variable deals with number of counts
lambda <- 1
cdf_value <- erlang_cdf(x, k, lambda)
print(paste("P(X > ", x, "): ", 1-cdf_value))

