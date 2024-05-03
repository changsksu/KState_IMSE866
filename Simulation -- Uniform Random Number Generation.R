# uniform random number generation
# Part I. How to generate U ~ unif(0,1)
# Generate a single random number between 0 and 1
#
# generate on number
random_number <- runif(1)
print(random_number)

# Generate a vector of 10 random numbers between 0 and 1
random_vector <- runif(10)
print(random_vector)

# Generate a vector of 10 random numbers between 5 and 10
random_vector_custom_range <- runif(10, min = 5, max = 10)
print(random_vector_custom_range)

#Part II. How to set global random number seeds
current_seed <- .Random.seed
set.seed(123)

#
# Generate random numbers
#
random_number <- runif(1)
print(random_number)
random_number <- runif(1)
print(random_number)
# now we use the same seed again and generate two U's
set.seed(123)
random_vector <- runif(2)
print(random_vector)
#
# Your Turn: Now try to change the seed and repeat part II
#
## Restore the previous state
.Random.seed <- current_seed  
#
# Revserse Transformation: exponential distribution
#
# Method 1: From uniform random number; let t be inter arrive time
lambda <-2
U <- runif(1)
t <- -log(1-U)/lambda
print(t)
#
# Method 2: From uniform random number; let t be interal arrive time
lambda <-2
t <- rexp(1,lambda)
print(t)
#
# Batch mean principle demo
# generate two random number sequence
# b is the number of samples per run; and n is the number of runs
#
rseed=42
n=2
b=5
for (i in 1:n) {
  print(paste0("Random Sequence: ", i, ", with seed: ", rseed))
  set.seed(rseed)
  random_vector <- runif(b)
  print(random_vector)
  rseed <- rseed + 1000
}
#
# Restore the previous state
.Random.seed <- rseed 
#
#YourTurn:
# 1. generate m columns each with n rows in a vector
# 2. compute the mean and std of each column
# 3. compute the mean of means and the mean of stds
# 4. Establish the 95% CI based on the stats in step 3

