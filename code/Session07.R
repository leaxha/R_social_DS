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

foo <- function(arg) {
  # <function_body>
}

is_positive <- function(num) {
  if (num > 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
body(is_positive)
formals(is_positive)
environment(is_positive)

is_positive <- function(num){
  if (num > 0){
    res <- TRUE
  } else{
    res <- FALSE
  }
  return(res)
}
res_1 <- is_positive(5)
res_2 <- is_positive(-7)
print(res_1)
print(res_2)

is_positive <- function(num){
  if (num > 0){
    res <- TRUE
  } else{
    res <- FALSE
  }
  res
}
res_1 <- is_positive(5)
res_2 <- is_positive(-7)
print(res_1)
print(res_2)

# While this function provides the same functionality as the two versions above
# This is an example of a bad programming style, return value is very unintuitive
is_positive <- function(num){
  if (num > 0){
    res <- TRUE
  } else{
    res <- FALSE
  }
}
res_1 <- is_positive(5)
res_2 <- is_positive(-7)
print(res_1)
print(res_2)

format_date <- function(day, month, year, reverse = TRUE){
  if (isTRUE(reverse)){
    formatted <- paste(as.character(year), as.character(month), as.character(day), sep = "-")
  } else {
    formatted <- paste(as.character(day), as.character(month), as.character(year), sep = "-")
  }
  return(formatted)
}
format_date(4,10,2021) 
# Technically correct, but rather unintuitive
format_date(y = 2021, m = 10, d = 4)
format_date(y = 2021, m = 10, d = 4, FALSE)

which_integer <- function(num){
  even_or_odd <- function(num){
    if (num %% 2 == 0){
      return("even")
    } else {
      return("odd")
    }
  }
  eo <- even_or_odd(num)
  if (num > 0){
    return(paste0("positive ", eo))
  } else if (num < 0){
    return(paste0("negative ", eo))
  } else {
    return("zero")
  }
}
which_integer(-43)
even_or_odd(-43)

x <- 42
# is equivalent to:
# Binding R object '42', double vector of length 1, to name 'x' in the global environment
assign("x", 42, envir = .GlobalEnv)
x

x <- 5
foo <- function(){
  x <- 12
  return(x)
}
y <- foo()
print(y)
print(x)

`+`(3, 2) # Equivalent to: 3 + 2
`<-`(x, c(10, 12, 14)) # x <- c(10, 12, 14)
`[`(x, 3) # x[3]
`>`(x, 10) # x > 10

add_five <- function(){
  return(function(x) x + 5)
}
af <- add_five()
af # 'af' is just a function, which is yet to be invoked (called)
af(10) # Here we call a function and supply 10 as an argument
# Due to vectorized functions in R this example is an obvious overkill (seq(10) ^ 2 would do just fine)
# but it shows a general approach when we might need to apply a non-vectorized functions
sapply(seq(10), function(x) x ^ 2)