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

# Calculate a factorial with decrementing function
# E.g. 5! = 1 * 2 * 3 * 4 * 5 = 120
x <- 5
factorial <- 1
while (x > 0) {
  factorial <- factorial * x
  x <- x - 1
}
factorial

test <- c("t", "e", "s", "t")
for (i in test) {
  # cat() function concatenates and prints objects' representations
  cat(paste0(i, "!"), "")
}

v <- c(3, 27, 9, 42, 10, 2, 5)
max_val <- NA
for (i in v) {
  if (is.na(max_val) | i > max_val) {
    max_val <- i
  }
}
max_val

s <- seq(1, 20)
s
seq_len(length(s))
seq_along(s)
seq_along(letters[1:20])

s2 <- vector(mode = "double", length = length(s))
for (i in seq_len(length(s))) {
  s2[i] <- s[i] * 2
}
s2
s3 <- vector(mode = "double", length = length(s))
for (i in seq_along(s)) {
  s3[i] <- s[i] * 3
}
s3

for (i in seq(1,6)) {
  if (i %% 2 == 0) {
    break
  }
}
print(i)

for (i in seq(1,6)) {
  if (i %% 2 == 0) {
    next
  }
  print(i)
}

i <- 1
while (TRUE) {
  i <- i + 1
  if (i > 10) {
    break
  }
}
i

i <- 1
repeat {
  i <- i + 1
  if (i > 10) {
    break
  }
}