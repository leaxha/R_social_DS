#####################
# load libraries
# set wd
# clear global .envir
#####################

# remove objects
rm(list=ls())
# detach all libraries
detachAllPackages <- function() {
  basic.packages <- c("package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:", search()))==1, TRUE, FALSE)]
  package.list <- setdiff(package.list, basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package,  character.only=TRUE)
}
detachAllPackages()

# load libraries
pkgTest <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,  "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,  dependencies = TRUE)
  sapply(pkg,  require,  character.only = TRUE)
}

# here is where you load any necessary packages
# ex: stringr
# lapply(c("stringr"),  pkgTest)
lapply(c(),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Exercise 1: Formalising Expectations
# See the function for parsing user's age from their input below
# How can a call to this function produce invalid output? 
# What are your expectations about the input? 
# Re-write the function below to check user's input and handle situations when a user provides incorrect values.
    
  # Get user's age
  # Takes user's year of birth as an input
  # Returns age in years as an integer
  get_age <- function() {
        yob <- readline("Please enter your year of birth: ")
        age <- 2022 - as.numeric(yob)
        return(age)
  }
     
## Exercise 2: Fibonacci sequence
# Fibonacci sequence (https://en.wikipedia.org/wiki/Fibonacci_number) is an integer sequence that frequently appears in mathematics and is often associated with golden ratio (https://en.wikipedia.org/wiki/Golden_ratio)
# Fibonacci sequence starts with the first element being equal to 0 and the second element being equal to 1
# All subsequent elements are the sums of the preceeding two elements
# More formally: $F_0 = 0, F_1 = 1, F_n = F_{n-1} + F_{n-2}, n \\gt 1$
# The beginning of the sequence then looks like this: [0, 1, 1, 2, 3, 5, 8, ...]

  # Implement a function that takes a vector of integers as an input and returns a vector of numbers from Fibonacci sequence, whose indices correspond to the integers from the input vector
  # Test the implemented function on the following inputs:
  10
  c(1, 2, 3, 4, 5)
  c(3, 9, 12)
  
  # Function specification:
    # Function takes 1 argument:
      # `num_vec` - vector of whole numbers
    # Function returns 1 object:
      # `fib` - vector of numbers from Fibonacci sequence corresponding to indices from the input vector
  # Example input → output:
    # [1, 3, 6] → [0, 1, 5]
     
## Exercise 3: Calculating t-tests
# Student's t-test (https://en.wikipedia.org/wiki/Student's_t-test) was developed by William Gosset (https://en.wikipedia.org/wiki/William_Sealy_Gosset) when working at the Guinness Brewery
# It's a classical tool for testing differences in means between groups when samples are small
# Assume that you drew a random sample of $200$ individuals and ran $1,000$ experiments on them
# An experiment does not need to mean something big, think, different shapes of some button on a website or Guinness served at slightly different temperatures

  # Implement a function that takes a matrix of experimental results and a vector with experimental/control-group assignment and returns a vector of calculated t-statistics for each of the experiments
  # Internally, you can use built-in `t.test()` function in R
  # See simulated input data below
  # Function specification:
    # Function takes 2 arguments:
      # `mat` - matrix of experimental results (rows - individuals, columns - experiments)
      # `grp` - vector of experimental/control-group assignment 
    # Function returns 1 object:
      # `tstats` - vector of calculated t-statistics for each of the experiments
 
     set.seed(2021)
     n <- 200
     m <- 1000
     mat <- matrix(rnorm(m * n, mean = 20, sd = 3), nrow = 200)
     # For simplicity, let's assume that assignment to control and experimental groups is always the same
     grp <- rep(0:1, times = 100)
  
## Exercise 4: Manipulating data frames
# List of data frames is a common output of some data collection tools
# Find below a list of 10 data frames
# Append them together by row
# Keep only unique rows

set.seed(2022)
dfs <- lapply(1:10, function(n) data.frame(x = letters[sample(1:26,20,TRUE)], y = sample(1:26,20,TRUE)))

## Exercise 5: Pivoting tables
 
# Let's use Kaggle 2021 Machine Learning and Data Science Survey, that we encountered before
# The dataset is available on GitHub
 
# In question 7 respondents were asked 'What programming languages do you use on a regular basis? (Select all that apply)'
# Calculate percentages of respondents who use each of the programming languages
# Sort them by popularity
 
# Tip: You can use `tidyr` and `dplyr` packages to pivot subset of columns into longer format