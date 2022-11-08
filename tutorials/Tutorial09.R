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

# What do you think is correlation coefficient between vectors ‘c(1, 2, 3, 4, 5)‘ and ‘c(-3, -5, -7, -9, -11)‘?
# Check output of function, is it correct?
# Find and fix any problems that you encounter
pearson <- function(vec_x, vec_y) {
if (!(is.numeric(vec_x) && is.numeric(vec_y))) {
  stop("Both arguments must be numeric")
  } 
  mean_x <- sum(vec_x)/length(vec_x)
  mean_y <- sum(vec_y)/length(vec_y)
  
  numerator <- sum((vec_x - mean_x) * (vec_y - mean_y))
  denominator <- (
    sum((vec_x - mean_x)^2)^1/2 *
      sum((vec_y - mean_y)^2)^1/2
  )
  
  r <- numerator/denominator
  
  # Make sure that floating point arithmetic does not
  # produce absolute values larger than 1
  r <- max(min(r, 1.0), -1.0)
  
  return(r)
}
x1 <- c(1, 2, 3, 4, 5)
x2 <- c(-3, -5, -7, -9, -11)

cor(x1, x2, method = c("pearson"))
pearson(x1, x2)

############
# Exercise 2
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
