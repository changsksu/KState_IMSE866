# Poisson Distribution Related Computation
# N(t) is PP(lamda) where N(t) is the count of events 

# dpois(x, lambda) calculates the probability mass at x for a Poisson distribution with parameter lambda
# Example:
x <- 2  # Value at which to calculate the PMF
lambda <- 3  # Parameter lambda for the Poisson distribution
pmf_value <- dpois(x, lambda)
print(pmf_value)  # Print the PDF value at x
# Example:
q <- 2  # Value at which to calculate the CDF
lambda <- 3  # Parameter lambda for the Poisson distribution
cdf_value <- ppois(q, lambda)
print(cdf_value)  # Print the CDF value up to q
print(Nt)  # Print the PDF value at t
#
# ppois(q, lambda) calculates the cumulative probability up to q for a Poisson distribution with parameter lambda
# Example:
q <- 2  # t<=2 Value at which to calculate the CDF
lambda <- 3  # Parameter lambda for the Poisson distribution
cdf_value <- ppois(q, lambda)
print(cdf_value)  # Print the CDF value up to q
# 
# To demonstrate the CDF to K is the sum of pmfs up to k
# N(0), N(1), N(2); N(k) is the kth arrival
# the following computation assumes t is one unit
# if the time is t2 unit, use lambda * t2 for lambda
#
pmf_value0 <- dpois(0, lambda)
print(pmf_value0)  # Print the PDF value at x=0
pmf_value1 <- dpois(1, lambda)
print(pmf_value1)  # Print the PDF value at x=1
pmf_value2 <- dpois(2, lambda)
print(pmf_value2)  # Print the PDF value at x=2
pmf_value0+pmf_value1+pmf_value2
#
# Example 1. Suppose the arrival rate of customers to a post office is 
# lambda=10 customers per hour.
# 1.a Compute the probability for no customers for one hours
lambda <-10
P1=dpois(0, lambda)
print(P1)
# 1.b Compute the probability for up to 15 customers for one hours
P2<-ppois(15, lambda)
print(P2)
# 1.c Compute the probability for k customers for eight hours
lambda2 <- 8 * lambda
k= 90
P3=ppois(k, lambda2)
print(P3)
# 1.d Compute the probability for expected number of customers for eight hours
# Answer: E(new N)= lambda2
lambda2 <- 8 * lambda
print(paste("The expected numbers for eight hour day is", lambda2))
#
# Example 2. Suppose N(t)~ PP(2). i.e. 2 arrival per day 
#What is the probability of the 100 arrivals before t=60 days? 
# lambda=2 customers per day. 
lambda3 <- 2 * 60
x<- 100
ppois(x, lambda3)
# 
# Example 3. The customer arrival process at a post office is PP(10 customer/hr). 
# What is the probability that one customer arrives between 1:00 pm and 1:06 pm 
# and two customers arrive between 1:03 pm and 1:12 pm?
#
# First convert time intervals into hour since lambda has hour as the unit
t1=(3)/60
t2=(6-3)/60
t3=(12-6)/60
# Then consider two possibilities: 1. (1,0,2)  or 2. (0,1,1) in t1-t3
lambda4 <-10
P1=dpois(1, lambda4*t1)*dpois(0, lambda4*t2)*dpois(2, lambda4*t3)
print(P1)
P2=dpois(0, lambda4*t1)*dpois(1, lambda4*t2)*dpois(1, lambda4*t3)
# answer=P1+P2
P1+P2
#
# Your turn:
# Example 5. Consider a customer arrival process at a bank where the 
# inter-arrival time follows an exponential distribution with lambda=8 arrival/hour 
# and 8 hour day is considered.
# 5A.Compute E(N(8)) and V(N(8))



# 5B. Compute the probability that more than 4 customers entering the bank 
# during an hour long lunch break.



# 5C. Compute the probability that no customer arrives during the last 15 minutes 
# of the day?






