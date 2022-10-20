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

lapply(c("ggplot2"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Exercise 1
# Below you see a matrix of random 30 observations of 5 variables
# Inspect visually the matrix
# Which variable(s) do you think has(ve) the highest standard deviation?
# First, try subsetting individual rows and columns from this matrix
# Check the dimensionality of the matrix using dim(), nrow() and ncol()functions
# Write a loop that goes over each variable and calculates its standard deviation
# You can use sd() function to calculate the standard deviation
# Save these calculated standard deviations in a vector
# Find the variable with the maximum standard deviation using max() or which.max() functions
# Is it the one you thought it would be?

# Remember, when dealing with random number generation it's always a good idea to by setting the seed with set.seed()
set.seed(2021)
# Here we create a matrix of 30 observations of 5 variables
# where each variable is a random draw from a normal distribution with 
# and standard deviation drawn from a uniform distribution between 0 and 10
mat <- mapply(
  function(x) cbind(rnorm(n=30,mean=0,sd=x)),
  runif(n=5,min=0,max=10)
)
mat