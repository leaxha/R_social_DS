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

add_five <- function(){
  return(function(x) x + 5)
}
af <- add_five()
af # 'af' is just a function, which is yet to be invoked (called)
af(10) # Here we call a function and supply 10 as an argument
# Due to vectorized functions in R this example is an obvious overkill (seq(10) ^ 2 would do just fine)
# but it shows a general approach when we might need to apply a non-vectorized functions
sapply(seq(10), function(x) x ^ 2)

# Applies a supplied function to a random draw
# from the normal distribution with mean 0 and sd 1
functional <- function(f) { f(rnorm(10)) }
functional(mean)
functional(median)
functional(sum)

l <- list(a = 1:2, b = 3:4, c = 5:6, d = 7:8, e = 9:10)
# Apply sum() to each element of list 'l'
lapply(l, sum)
# We can exploit the fact that basic operators are function calls
# Here, each subsetting operator `[` with argument 2 is applied to each element
# Which gives us second element within each element of the list
lapply(l, `[`, 2)

m <- matrix(1:12, nrow=3, ncol=4)
m
# Sum up rows (can also be achieved with rowSums() function)
apply(m, 1, sum)
# Calculate averages across columns (also available in colMeans())
apply(m, 2, mean)
# Find maximum value in each column
apply(m, 2, max)

means <- -2:2
sds <- 1:5
# Generate one draw from a normal distribution where
# each mean is an element of vector 'means'
# and each standard deivation is an element of vector 'sds'
# rnorm(n, mean, sd) takes 3 arguments: n, mean, sd
mapply(rnorm, 1, means, sds)

# While simplification of output
# (attempt to collapse it in fewer dimensions)
# makes hard to predict the object returned 
# by apply() functions that have simplified = TRUE by default
mapply(rnorm, 5, means, sds)

# Package 'Matrix' is part of the standard R library and doesn't have to be installed separately
library("Matrix")
# While it is possible to just use function sparseVector() after loading the library,
# it is good practice to state explicitly which package the object is coming from
sv <- Matrix::sparseVector(x = c(1, 2, 3), i = c(3, 6, 9), length = 10)
sv