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

a <- c(1,0,2,1) # Input vector (1-dimensional array)
a <- sort(a) # Sort vector
a
n <- length(a) # Calculate length of vector 'a'
n
m <- (n + 1) %/% 2 # Calculate mid-point, %/% is operator for integer division
m
n %% 2 == 1 # Check whether the number of elements is odd, %% (modulo) gives remainder of division
mean(a[m:(m+1)])

a <- c(1, 0, 2, 1, 100)
a <- sort(a)
n <- length(a)
m <- (n + 1) %/% 2
if(n %% 2 == 1){
  a[m]
}

a <- c(1, 0, 2, 1)
a <- sort(a)
n <- length(a)
m <- (n + 1) %/% 2
if(n %% 2 == 1){
  a[m]
}else{
  mean(a[m:(m+1)])
}

x <- 42
if (x > 0){
  print("Positive")
}else if (x < 0){
  print("Negative")
}else{
  print("Zero")
}

# Ask for user input and assign as double
num <- as.double(readline("Please, enter a number:"))
if(num %% 2 == 0) {
  print("Even")
} else if(num %% 2 == 1) {
  print("Odd")
} else{
  print("This is a real number")
}

num <- as.integer(readline("Please, enter a number:")) 
# Ask for user input and cast as integer
if (num > 0) {
  if (num %% 2 == 0){
  print("Positive even")
  }
  } else{
  print("Positive odd")
}else if (num < 0){
  if (num %% 2 == 0) {
  print("Negative even") 
  # Notice that odd/even check appears twice
  } else{
  print("Negative odd") 
  # Consider abstracting this as a function 
  }
}else{
  print("Zero")
}

num <- 1:10
num
ifelse(num %% 2 == 0, "even", "odd")

# Good style
is_positive <- function(num){
  if(num>0){
    res <- TRUE
  }
  else{
    res <- FALSE
  }
  return(res)
}

# Bad style
is_positive <- function(num){
if(num>0){
res <- TRUE
}
else{
res <-FALSE
}
return(res)
}
# Exercise 1
set.seed(2022)
v <- sample(1:1000,50)
max_val <- v[1]
for(i in v){
  if(i > max_val){
    max_val <- i
    }
  }
max_val

min_val <- v[1]
for(i in v){
  if(i < min_val){
    min_val <- i
  }
}
min_val

set.seed(2022)
v <- sample(c(1:500,rep(NA,500)),25)


