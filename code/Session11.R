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

df <- data.frame(
    x = 1:4,
    y = c("a", "b", "c", "d"),
    z = c(TRUE, FALSE, FALSE, TRUE)
)
# str() function applied to data frame is useful in determining variable types
str(df)
# dim() function behaves similar to matrix, showing N rows and N columns, respectively
dim(df)
# In contrast to matrix length() of data frame displays the length of underlying list
length(df)

l <- list(x = 1:5, y = letters[1:5], z = rep(c(TRUE, FALSE), length.out = 5))
l
df <- data.frame(l)
df

# Like a list
df[c("x","z")]
# Like a matrix
df[,c("x","z")]
df[df$y=="b",]

set.seed(12345)
rand <- rnorm(5)
rand
df <- cbind(df, rand)
df

# Note, row has to be list since contains different data types
r <- list(6, letters[6], FALSE, rnorm(1))
r
df <- rbind(df, r)
df

# New columns can be created/modified by assignment (if RHS object has correct length)
df["r"] <- rnorm(6)
df
# Individual columns can also be selected with $ operator
df$r <- df$r + 5
df

# names() attribute for data frames/tibbles contains column names
names(df)
names(df)[4] <- "rand_new"
df

# assuming your local GitHub is up-to-date
inc_local <- read.csv("../datasets/incumbents_subset.csv")
inc_url <- read.csv("https://raw.githubusercontent.com/jeffreyziegler/R_social_DS/main/datasets/incumbents_subset.csv")
head(inc_local); head(inc_url)