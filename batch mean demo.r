##-------------------------------------------------------------------------------------------------------------
 ###############################################################################################################
 # Title: Program for demonstrating the batch mean computation in simulation
 # Author: Dr. Shing I Chang at the dept. of IMSE, KSU
 # Date: Sept 27,  2011 
 # Descriptions: 
 #  1. This program uses the computation of Average Run Length (ARL) of X-bar chart as an example
 #  2. Various shift magnititudes can be changed to generate m run lengths (RLs).
 #  3. Input variables:B the batch size, n the sample size, delta the shift magnitude
 #  4. output Variables: Average run length ARL, std(run length), and histogram of run length 
 #  5. Recommendation "B>=1000; n=5,6,~,10; delta 0.5 to 3 with increment of 0.5".
 ##############################################################################################################
 #------------------------------------------------------------------------------------------------
# Here is the function to set up one simulation run
RL.dist=function(B,n, delta) 
{  
  ## B is the batch size, i.e. each batch would repeat the computation once
  ## n is the sample size
  ## delta is the shift magnitude in sigma unit	
	

# Assume we know the distrib of X ~ N(10,1) so the X-bar control chart has the following UCL and LCL>

UCL= 10 + 3 / sqrt(n)
LCL= 10 - 3 / sqrt(n)

# Here is the module that a random number generator is used. In this example, a build-in R normal rv is used
# We assume that the mean is 10 and std is 1
x.bar=mean(rnorm(n,mean=10+delta,sd=1))

RL.v=array(rep(0,B))
seed= 12345 #the starting seed

# to generate B replications
for (i in 1:B) 
{
	# set up initial conditions
	set.seed(seed)
	RL=0

	# to count run length for each control chart monitoring 
	repeat
     	{x.bar=mean(rnorm(n,mean=10+delta,sd=1))
      		if ((x.bar<UCL) && (x.bar)>LCL) {RL=RL+1}
       		else {RL=RL; break}  
      	}
	seed=seed+1 #move to the next seed
	RL.v[i]=RL
}
ARL=mean(RL.v)
std=sd(RL.v)
 
## Print estimation summary
  
  cat("Summary of estimation results:", "\n", "\n") 
  cat("No. of iteration=", B, ";Sample size=",n, "; Shift Magnitude=", delta, "\n", "\n") 
  cat("LCL=", LCL, ";UCL=", UCL, "\n", "\n")
  cat("ARL or mean(RL)=", ARL, ";sd(RL)=", std, "\n", "\n") 
 
  
## Figures

  windows()
  hist(RL.v, breaks=20, axes=FALSE, main="The histogram of RL distribution", xlab="Run length ", ylab=" ", lty=1, freq=F,col=3)
  axis(1, lab=T)   
  axis(2, lab=F)   
  lines(density(RL.v))
}

RL.dist(100,5,1)   ## RL.dist(B, n, delta); You can change these three numbers from the recommended values in Descriptions

