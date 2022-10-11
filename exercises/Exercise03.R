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
# Load built-in R object 'letters' (lower-case letters of the Roman alphabet)
# Calculate its length
# Generate a vector of integers that starts from 1 and has the same length as 'letters'
# Assign each integer corresponding lower-case letter as name use these names to subset all vowels
# Now, repeat subsetting, but using indices not names

# Exercise 2
# Change this to reflect the actual counts
# First, let's store the result of tabulation for later re-use
# Start from exploring the structure of this object with str()
# What are the 2 main parts of this object? How are they stored?
# Extract the relevant parts from the stored object
# Save them as a named vector with provinces as names and counts as values
# Use rev() function to sort the vector in a decreasing order (from largest to smallest)
# Convert the original provinces vector into a factor with the levels ordered accordingly
# Re-run table(provinces)
