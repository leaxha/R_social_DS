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

# Exercise 1: Subsetting
# Write 3 separate subsetting operations to extract the following elements from the list below:
# - All consonants from the first character vector
# - Second columns in all dimensions from the array A
# - Odd rows from the matrix M
l <- list(
        mapply(assign, letters, 1:26),
        A = array(1:60, c(5,2,3)),
        M = matrix(1:50, c(10,5))
)

# Exercise 2: Working with vectors
# Look at the vector below. What is its type? 
# Convert it into numeric
# Note that some values get missing due to letter `o` used instead of digit `0`
# What proportion of the vector elements did we fail to convert correctly? 
# Now let us fix this issue 
# Using either subsetting and assignment or `ifelse()` function replace all `NA`s in the converted numeric vector into `0` (zeros)"
set.seed(2022)
vec <- sample(c("1", "0", "o"), size = 100, replace = TRUE)

# Exercise 3: Vectorized operations
# Calculate the percentage of book titles in the vector 
# below that have more than 10 characters in them (including whitespaces)
# Tip: You can use `nchar()` function to calculate the number of characters in a vector"
books <- c(
        "Dubliners",
        "Ulysses",
        "War and Peace",
        "Normal People",
        "Crime and Punishment",
        "The Picture of Dorian Gray"
        )

# Exercise 4: Attributes and factors
# Suppose you read in a variable which represents education of survey respondents
# After consulting the codebook for this survey you determined that specific values that the variable takes are coded as follows:
# `0` - No formal education
# `1` - Primary Education
# `2` - Secondary Education
# `3` - College Education
# `4` - Post-graduate Education
# Convert the variable `educ` below into a factor variable with each value coded explicitly as one of the education levels
# Tabulate the variable using `table()` function
# Change the order of the levels of this factor variable such that the most common education level is the first (baseline/reference) category
# (you can leave other education levels in their origianl order)
# Tabulate the variable again
set.seed(2022)
educ <- rpois(1000, 2)
educ <- ifelse(educ > 4, 4, educ)

# Exercise 5: Conditional statements and loops
# Levenshtein distance (https://en.wikipedia.org/wiki/Levenshtein_distance) is a string distance metric that measures
# how many transformations (insertion, deletion, substitution) are required to convert one string into another
# For example, consider words 'cat' and 'can'. Letter 't' in the first word can be substituted 
# with a character 'n' in order for the two words to become identical.
# For classical Levenshtein distance each of the transformations has the same cost of 1
# In other words, the distance (of 1) is the same between the word pairs 'cat' - 'can' and 'cat' - 'cats'
# Below you can see two character vectors that were transformed to have a single letter as an individual element
# Write a loop to compare each of the elements from one string to each of the elements from another string 
# while keeping track of the number of transformations
# Print out the result of the transformations count
char_1 <- unlist(strsplit("kitten", split = ""))
char_2 <- unlist(strsplit("sitting", split = ""))