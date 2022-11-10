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

############
# Exercise 1
############

# Use built-in debugger to fix a function
# - Look at the problematic `calculate_sd` function below
# - Run R debugger and step through it
# - While inside function print out values of deviations and result of stand_dev
# - Fix bug(s)

calculate_sd <- function(x) {
  N <- nrow(x)
  # using R's formula
  deviations <- (x - sum(x)/N)^2
  stand_dev == sqrt(sum(deviations)/(N - 1))
  return(stand_dev)
}
calculate_sd(v2)
sd(v2)

############
# Exercise 2
############

# Create tests for pearson() and calculate_median() functions that
# Test whether the sign of a calculated pearson correlation is correct
# Test whether median calculated on an array with even number of elements has an absolute difference of no more than 0.0001 from correct answer
