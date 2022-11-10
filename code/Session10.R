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

42 + "ab" # Throws an error
as.numeric(c("42","55.3","ab","7")) # Triggers a warning
library("dplyr") # Shows a message
stop("Error message")
warning("Warning message")
message("Message")

if (c(TRUE, TRUE, FALSE)) {
  print("This used to work pre R-4.2.0")
}

# Will become an error in future versions of R
c(TRUE, FALSE) && c(TRUE, TRUE)

incumbents <-readr::read_csv("../datasets/incumbents_subset.csv")
suppressMessages(incumbents <-readr::read_csv("../datasets/incumbents_subset.csv"))
# But some functions would provide arguments to silence messages
# This should be preferred to heavy-handed suppressMessages()
anscombes_quartet <- readr::read_csv("../data/anscombes_quartet.csv", show_col_types = FALSE)

# suppressPackageStartupMessages() - a variant for package startup messages
# But suppressMessages() would also work
suppressPackageStartupMessages(library("dplyr"))

f1 <- function(x) {
  log(x)
	  10
}
f1("x")
f2 <- function(x) {
  try(log(x))
	  10
}
f2("y")
f3 <- function(x) {
  tryCatch(
	    error = function(e) NA,
    log(x)
	  )
}
f3("x")

# Infinite loop, analogous to while (TRUE)
repeat {
	  num <- readline("Please, enter a number:")
	  if (num != "") {
	    withCallingHandlers(
      warning = function(cnd) {
	        print("This is not a number. Please, try again.")
	      },
      num <- as.numeric(num)
	    )
  } else {
	    print("No input provided. Please, try again.")
	  }
  if (!is.na(num)) {
	    print(paste0("Your input '", as.character(num), "' is recorded"))
	    break
  }
}
calculate_median <- function(a) {
  if (!is.numeric(a)) {
  	  stop("Vector must be numeric")
  	}
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
v3 <- c(7.22, 1.54, 3.47, 2.75)
calculate_median(v3)
calculate_median(v3) == 3.11
all.equal(calculate_median(v3), 3.11)
all.equal(length(calculate_median(v3)), 1)
# Note that the output of length is of type integer
identical(length(calculate_median(v3)), 1)
identical(length(calculate_median(v3)), 1L)

library("testthat")
calculate_median <- function(a) {
  if (!is.numeric(a)) {
	    stop("Vector must be numeric")
	  }
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

testthat::test_that("The length of result is 1", {
	  testthat::expect_equal(
    length(calculate_median(c(0, 1, 2, 2))), 
	    1L
  )
	  testthat::expect_equal(
    length(calculate_median(c(1, 2, 3))),
	    1L
  )
	  testthat::expect_equal(
    length(calculate_median(c(7.22, 1.54, 3.47, 2.75))),
	    1L
  )
})

testthat::test_that("Error on non-numeric input", {
	  testthat::expect_error(
    calculate_median(c("a", "bc", "xyz"))
	  )
  testthat::expect_error(
	    calculate_median(c(TRUE, FALSE, FALSE))
  )
	  testthat::expect_error(
    calculate_median(c("0", "1", "2", "2"))
  )
})

testthat::test_that("The result is numeric", {
	  testthat::expect_true(
    is.numeric(calculate_median(c(0, 1, 1, 2)))
	  )
  testthat::expect_true(
	    is.numeric(calculate_median(c(1, 2, 3)))
    )
	  testthat::expect_true(
    is.numeric(calculate_median(c("a", "bc", "xyz")))
	  )
})
