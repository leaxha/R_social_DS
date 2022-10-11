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

# create function to write files easily
write_files <- function(input_function, filename){
  sink(file = filename)
  input_function
  sink(file = NULL)
}

write_files(
print("Hello World!")
  , "Session03_R_output.txt")

1+1
5-3
6/2
4*4
# Let's try exponentation
# Note that 2 ** 4 also works, but is not recommended 2^4
2^4

# Integer division, equivalent to Python's `//`
7%/%3
# Modulo operation (remainder of division), equivalent to Python's `%`
7%%3

3!=1 # Not equal
3>3 # Greater than
FALSE|TRUE # True if either 1st or 2nd operand is T
F|T # R also treats F and T as Boolean, not recommended 
3>3|3>=3 # Combining 3 Boolean expressions

x <- 3
x
f <- function(){
  x<<-1 # Modifies existing var in parent namespace
  }
f()
x

"a" %in% "abc"# Note that R strings are not sequences
3 %in% c(1,2,3) # c(1, 2, 3) is a vector
!(3 %in% c(1,2,3))

v <- c(8,10,12)
v

v <- c(v,14) # Always flattened (even when nested)
v

char_vec <- c("apple","banana","watermelon")
char_vec

length(char_vec)
is.character(char_vec)

# Note 'L' suffix to get an integer, not double
int_vec <- c(300L,200L,4L)
int_vec

typeof(int_vec)
is.integer(int_vec)

# Note that even without decimal part R treats these numbers as doubled
dbl_vec <- c(300,200,4)
dbl_vec

typeof(dbl_vec)
is.double(dbl_vec)
# Note that is.numeric() function is a generic way of testing
# whether vector is integers or double
is.numeric(int_vec)

log_vec <- c(FALSE,FALSE,TRUE)
log_vec
# While more concise, using T/F instead of TRUE/FALSE can be confusing
log_vec2 <- c(F,F,T)
log_vec2
typeof(log_vec)

# Note that logical vector get coerced to 0/1 for F/T
c(dbl_vec,log_vec)
c(char_vec,int_vec)
# If no way of conversion exists, NAs are introduced
as.numeric(char_vec)

na_vec <- c(NA,NA,NA)
na_vec
length(na_vec)
null_vec <- c(NULL,NULL,NULL)
null_vec
length(null_vec)

v_na<-c(1,2,3,NA,5) 
mean(v_na)
# NAs should be treated specially
mean(v_na,na.rm=TRUE)
# Remember NAs are missing values
NA==NA
is.na(v_na)
# We can use such logical vectors for subsetting (more below)
v_na[!is.na(v_na)]

# Top 10 most populous settlements on the island of Ireland
settlements <- c("Dublin","Belfast","Cork","Limerick","Derry","Galway","Newtownabbey","Bangor","Waterford","Lisburn")
provinces <- c("Leinster","Ulster","Munster","Munster","Ulster","Connacht","Ulster","Ulster","Munster","Ulster")
# Given that each town appears only once, crosstabs might not be informative
table(settlements,provinces)
# Instead, we can just get tabulate the `provinces` vector# and check the value counts for each province
table(provinces)
