# Assignment 1
# Problem 1 (a)

if(!"mixtools" %in% rownames(installed.packages())) {
  install.packages("mixtools")
}

if(!"bayesm" %in% rownames(installed.packages())) {
  install.packages("bayesm")
}

if(!"extraDistr" %in% rownames(installed.packages())) {
  install.packages("extraDistr")
}


# multinomial dist'n parameters
theta <- numeric(6)

# observered values
counts <- c(17, 24, 22, 17 ,24 ,16)

# 120 throws
N <- sum(counts)


prior_dirichlet <- rep(1/2, times = 6)




# (b)
# Calculate the posterior dist'n
post_dirichlet <- prior_dirichlet + counts
post_dirichlet
for (i in 1:6) {
  cat('expectation of theta', i, ':', 
      round(post_dirichlet[i]/sum(post_dirichlet),4), '\n')  
}


# Calculate marginal distribution and get credible intervals
# We should first calculate the marginal distribution, then get the credible intervals
for (i in 1:6) {
  
  cat('CI', i, ':', round(qbeta(c(0.025, 0.975), 
                          post_dirichlet[i], 
                          sum(post_dirichlet)-post_dirichlet[i]), digits = 4), 
      '\n')
}


# (c) answer is strange

p_null <- c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)
likeli_ratio <- function(data, N) {
  c1 <- length(which(data == 1))
  c2 <- length(which(data == 2))
  c3 <- length(which(data == 3))
  c4 <- length(which(data == 4))
  c5 <- length(which(data == 5))
  c6 <- length(which(data == 6))
  onecounts <- c(c1, c2, c3, c4, c5 ,c6)
  p_example <- onecounts/N
  likelihood <- 1/prod(gamma(onecounts+1))*prod(p_example^onecounts)
  return(likelihood)
}

# log likelihood null hypothesis
log.likelihood_null <- log(likeli_ratio(rep(1:6,20), 120))
# observed lambda 
lambda_target <- exp(log.likelihood_null - log((1/prod(gamma(counts+1))*prod((counts/N)^counts))))

Sims <- 10000
number_less <- 0
for (s in 1:Sims) {
  samples <- sample(c(1,2,3,4,5,6), size = N, 
                    replace =TRUE, prob = p_null)
  p <- log(likeli_ratio(samples, N))
  lambda_sample <- exp(log.likelihood_null-p)
  if(lambda_sample <= lambda_target){
    number_less <- number_less + 1
  }
}
cat('p value:', number_less/Sims)

# we cannot reject the null hypothesis




# (d)
library(extraDistr)
m <- 60

# posterior predictive distribution: pmf; 17.5, 24.5, 22.5, 17.5, 24.5, 16.5

# Counting the probability 5's is more than 6's
sim <- 20000
times <- 0
for (i in 1:sim){
  sample <- rdirmnom(1, size = m, post_dirichlet)
  if (sample[,5] > sample[,6]){
    times = times + 1
  }
}
prob <- times/sim
prob






# (e)
counts_again <- c(22, 20, 30 ,16, 16, 16)
post_dirichlet_again <- counts_again + post_dirichlet
for (i in 1:6) {
  cat('expectation of theta', i, ':', 
      post_dirichlet_again[i]/sum(post_dirichlet_again), '\n')  
}


# Calculate marginal distribution and get credible intervals

for (i in 1:6) {
  cat('CI', i, ':', round(qbeta(c(0.025, 0.975), 
                                post_dirichlet_again[i], 
                                sum(post_dirichlet_again)-post_dirichlet_again[i]), digits = 4), 
      '\n')  
}



