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
# Write a function that takes an input of a vector from the dataframe
# and returns the mean of the that input vector
set.seed(12345)
my_df <- data.frame(x=rnorm(100, 0, 1), y=runif(100, 0, 1))

# Exercise 2
# Write a function that takes an input of a dataframe
# Forces the user to input the name of the vector in the dataframe
# that they wish to  generate a summary stat for (by name, ie character argument)
# And allows user to specify which summary stat they want returned
# mean or median
# and returns the mean of the that input vector