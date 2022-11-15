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

# Load 'kaggle_survey_2021_responses.csv' dataframe from GitHub repository to global environment
# Subset dataframe to include 'time to complete' and first 5 Qs
# Subset to women who have earned less than a doctoral degree

############
# Exercise 2
############

# Dummy variables
# When analysing categorical data (particularly using it as independent variables in regression) it is common to construct dummy variables
# Where categorical variables are represented by 1's and 0's depending on whether it is true or not for a given observation
# For example, gender of respondents in survey can be represented by 1's that indicate whether a given respondent is female (baseline/reference category) and 0's if they are not

# Make a dummy variable for your two criteria from above (women and less than doctoral degrees)
# Subset the original dataset based on these new dummy variables