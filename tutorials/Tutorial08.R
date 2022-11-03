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
# Remember to make your code replicable by setting seed
set.seed(2022)
# Here we create a matrix of 30 observations of 5 variables
# where each variable is a random draw from a normal distribution with mean 0
# and standard deviation drawn from a uniform distribution between 0 and 10
mat <- mapply(
  function(x) cbind(rnorm(n = 30, mean = 0, sd = x)),
  runif(n = 5, min = 0, max = 10)
)

# Exercise 2
# Let's turn to a more complicated case
# Below you can see another matrix object, but this time it's interspersed with letters
# What is the type of this matrix?
# Write a function that can take this matrix as an input and return a list, where each element is a column of input matrix
# Internally, you can re-use loop from previous exercise
# In addition to that while building iteratively your list try checking whether a column is coercible into numeric
set.seed(2022)
mat2 <- cbind(
  letters[sample.int(26, 30, replace = TRUE)],
  mapply(
    function(x) cbind(rnorm(n = 30, mean = 0, sd = x)),
    runif(n = 3, min = 0, max = 10)
  ),
  letters[sample.int(26, 30, replace = TRUE)]
)