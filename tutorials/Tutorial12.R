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
# Do so from the url, and from the local file
# Consider country of residence reported by respondents (question Q3)
# Make sure you can select the column both using both it name and index
# Calculate the percentages of top 3 countries of residence in the sample

############
# Exercise 2
############

# This might be not the most usual example of pivoting data frame (since as the number of columns increases, the number of rows remains the same)
# But it gives you a sense of what it can entail

# To simplify working with the dataset, let's create a unique id for each respondent (you can use `seq_along()` function in combination with any other variable to do so)
# Finally, use `pivot_wider` function from `tidyr` package to create a separate column for each age group
# If original pivoting produced columns that are populated by values of the categorical variable and `NA`'s, use `mutate` function to replace them with 0's and 1's
# Finally, use `pivot_longer` function to convert this representation of the dataset back into its original form
# You might also need to use `dplyr::filter()` function to remove redundant rows