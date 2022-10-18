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

# vector indexing
dbl_vec <- c(300,200,4)
dbl_vec[1]
dbl_vec[c(1,3)]

2:4
# Similar to Python's object[start:stop:step] syntax
seq(from=1,to=4,by=2)

v
v[2:4]
# Argument names can be omitted for matching by position
v[seq(1,4,2)] 
# All but the last element
v[-length(v)]
# Reverse order
v[seq(length(v),1,-1)]

c(0,1)+c(1,2,3,4)
5*c(1,2,3,4)
c(1,2,3,4)[c(TRUE,FALSE)]

char_vec <- c("apple", "banana", "watermelon")
char_vec
char_vec=="watermelon"
which(char_vec=="watermelon")
dbl_vec[char_vec=="watermelon"]
dbl_vec[which(char_vec=="watermelon")]

# We can combine different data types in a list and, optionally, name 
combined_l <- list(2:4,"a", B=c(TRUE,FALSE,FALSE), list("x",1L))
l
str(l)

l[3]
str(l[3])
l[[3]][1]
# Only works with named elements
l$B

v
attr(v, "example_attribute") <- "This is a vector"
attr(v, "example_attribute")
# To set names for vector elements we can use names() function
names(v) <- c("a","b","c","d")
v
# Names of vector elements can be used for subsetting
v["b"]

cities <- c("Dublin","Cork","Cork","Limerick","Galway")
cities
typeof(cities)
# We use factor() function to convert character vector into factor
# Only unique elements of character vector are considered as a level
cities <- factor(cities)
cities
class(cities)
# Data type of this vector is integer (and not character)
typeof(cities)

# Note that R automatically sorted the categories alphabetically
levels(cities)
# You can change the reference category using relevel()
cities <- relevel(cities,ref="Dublin")
levels(cities)
# Or define an arbitrary ordering of levels using levels argument
cities <- factor(cities,levels=c("Limerick","Galway","Dublin","Cork"))
# Under the hood factors continue to be integer vectors
as.integer(cities)

var_1 <- sample(c("a","b","c"), size=50, replace=TRUE)
var_2 <- sample(c(1,2,3), size=50, replace=TRUE)
table(var_1,var_2)

var_2 <- factor(var_2,levels=c(3,1,2))
table(var_2)
var_2 <- factor(var_2,levels=c(3,1,2),labels=c("Three","One","Two"))
table(var_1,var_2)

# : operator can be used generate vectors of sequential numbers
a <- 1:12
a
class(a)
dim(a) <- c(3,2,2)
a
class(a)

m <- 1:12
dim(m) <- c(3,4)
m

# Alternatively, we could use matrix() function
m <- matrix(1:12,nrow=3,ncol=4)
m

# Note that length() function displays the length of underlying vector
length(m)

a
# Most common way
a[1,2,2]
# Specifying drop = FALSE after indices retains original dimensions
a[1,2,2,drop=FALSE]
# Here elements are subset from underlying vector (with repetition)
a[c(1,2,2)]

m
# Drop = FALSE prevents from this object being collapsed
m[,1,drop=FALSE]
# Subset all rows, first two columns
m[1:nrow(m),1:2]
# Note that vector recycling also applies here
m[c(TRUE,FALSE),-3]