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
#lapply(c("ggplot2"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

even_or_odd <- function(num) {
  if (num %% 2 == 0) {
  return("even")
  } else {
  return("odd")
  }
}
even_or_odd(42.7)
even_or_odd('42')

even_or_odd <- function(num) {
  num <- as.integer(num) # We expect input to be integer or convertible into one}
  if (num %% 2 == 0) {
    return("even")
  } else {
    return("odd")
  }
}
even_or_odd(42.7)
even_or_odd('42')

calculate_median <- function(a) {
  a <- sort(a)
  n <- length(a)
  m <- (n + 1) %/% 2
  if (n %% 2 == 1) {
    med <- a[m]
  } else {
    med <- mean(a[m:m+1])
  }
  return(med)
}
v1 <- c(1, 2, 3)
v2 <- c(0, 1, 2, 2)
calculate_median(v1)
calculate_median(v2)

calculate_median <- function(a) {
  a <- sort(a)
  n <- length(a)
  m <- (n + 1) %/% 2
  print(m)
  if (n %% 2 == 1) {
    med <- a[m]
  } else {
    med <- mean(a[m:m+1])
  }
  return(med)
}
calculate_median(v1) # v1 <- c(1, 2, 3)
calculate_median(v2) # v1 <- c(1, 2, 3, 2)

calculate_median <- function(a) {
  a <- sort(a)
  n <- length(a)
  m <- (n + 1) %/% 2
  # Print all objects in function environment
  print(mget(ls()))
  if (n %% 2 == 1) {
    med <- a[m]
  } else {
    med <- mean(a[m:m+1])
  }
  return(med)
}
calculate_median(v1)
calculate_median(v2)

calculate_median <- function(a) {
  a <- sort(a)
  n <- length(a)
  m <- (n + 1) %/% 2
  if (n %% 2 == 1) {
    med <- a[m]
  } else {
    print(m-1:m)
    med <- mean(a[m:m+1])
  }
  return(med)
}
calculate_median(v1)
calculate_median(v2)

calculate_median <- function(a) {
  a <- sort(a)
  n <- length(a)
  m <- (n + 1) %/% 2
  if (n %% 2 == 1) {
    med <- a[m]
  } else {
    med <- mean(a[m:(m+1)])
  }
  return(med)
}
calculate_median(v1)
calculate_median(v2)

calculate_median <- function(a) {
  a <- sort(a)
		  n <- length(a)
  m <- (n + 1) %/% 2
  if (n %% 2 == 1) {
    med <- a[m]
		  } else {
    browser()
		    med <- mean(a[m:m+1])
  }
		  return(med)
}
calculate_median(v2)