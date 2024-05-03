# This code demonstrates how Common Random Number is used
# Part I. CRN implementation
#
# generate on number
random_number <- runif(100)
random_number2 <- 1- random_number
plot(x = random_number, y = random_number2)
# You will see that Cov(X, Y) is negatively correlated
cov(random_number, random_number2)

# 
# Simulation of total time in the system for customers
# Assume a M/M/infinite/infinite system
# Lambda1: arriaval rate and Lambda2: service rate
current_seed <- .Random.seed
set.seed(42)
n <- 10
lambda1 <-2
lambda2 <-5
U <- runif(n)
t1 <- -log(U)/lambda1
U2 <- 1-U
t2 <- -log(U2)/lambda2
t <- t1+ t2
#print(paste0("The total times in the system is ", t))
#
# compute 95% CI based on t distribution
#
center <- mean(t)
s <- sd(t)
print(paste0("The standard deviation using CRN is ", s))
error <- qt(0.975,df=n-1)*s/sqrt(n)

left <- center - error
right <- center + error
print(paste0("The 95% CI is (", left, ",", right,")"))
#
# pretty print
#
formatted_numberL <- sprintf("%.2f", left)
formatted_numberR <- sprintf("%.2f", right)
cat("The 95% CI is (", formatted_numberL, ",", formatted_numberR, ")")
#
# Part II. NO CRN implementation 
# use two independent streams for U and U2 
# 
# 
set.seed(42) #stream 1
n <- 10
lambda1 <-2
lambda2 <-5
U <- runif(n)
t1 <- -log(U)/lambda1
# set.seed(1042) as stream 2
set.seed(1042) 
U2 <- runif(n)
t2 <- -log(U2)/lambda2
t <- t1+ t2
# print(paste0("The total times in the system is ", t))
#
# compute 95% CI based on t distribution
#
center <- mean(t)
s <- sd(t)
print(paste0("The standard deviation without using CRN is ", s))
error <- qt(0.975,df=n-1)*s/sqrt(n)

left <- center - error
right <- center + error
# print(paste0("The 95% CI is (", left, ",", right,")"))
#
# pretty print
#
formatted_numberL <- sprintf("%.2f", left)
formatted_numberR <- sprintf("%.2f", right)
cat("The 95% CI is (", formatted_numberL, ",", formatted_numberR, ")")
#
# You should observe that the CI of the CRN implementation is smaller 
# than the one without using CRN technique.
#
