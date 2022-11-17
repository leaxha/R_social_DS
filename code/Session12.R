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
lapply(c("dplyr"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

dt <- data.table::data.table(
    x = 1:4,
		    y = c("a", "b", "c", "d"),
		    z = c(TRUE, FALSE, FALSE, TRUE)
)
dt

tb <- tibble::tibble(
    x = 1:4,
		    y = c("a", "b", "c", "d"),
		    z = c(TRUE, FALSE, FALSE, TRUE)
)
tb

str(tb)
dim(tb)
tb[c("x", "z")]
tb[tb$y=="b", ]

dplyr::filter(tb, y == 'b', z == FALSE)
# Note that dplyr functions do not require enquoted variable names
dplyr::select(tb, x, z)
# We can also use helpful tidyselect functions for more complex rules
dplyr::select(tb, tidyselect::starts_with('x'))

# Data is not modified in-place, you need to re-assign the results
tb <- dplyr::rename(tb, random = x)
dplyr::mutate(tb, random_8plus = ifelse(random >= 3, TRUE, FALSE))

tb <- tb %>%
  dplyr::mutate(random_2 = rnorm(4)) %>%
  dplyr::filter(z == FALSE)
tb

# Pipe %>% can also be used with non-dplyr functions
tb$y %>% .[2]
# Base R pipe operator |> is more restrictive (e.g. tb$x |> `[`(2) doesn't work)
tb |> nrow()

tb2 <- tibble::tibble(
  country = c("Afghanistan", "Brazil"),
  `1999` = c(745, 2666),
  `2000` = c(37737, 80488)
)
tb2
# Note that pivoting functions come 'tidyr' package
tb2 <- tb2 %>%
  tidyr::pivot_longer(cols = c("1999", "2000"), names_to = "year", values_to = "cases")
tb2
tb2 <-tb2 %>%
  tidyr::pivot_wider(names_from="year", values_from="cases")
tb2

# Note that summary() as opposed to pandas' describe() gives summary for all variable types by default
summary(kaggle2021[,1:10])

# load local data in as dataframe
kaggle2021 <- read.csv("../datasets/kaggle_survey_2021_responses.csv", stringsAsFactors = F)[-1,]
summary(as.numeric(kaggle2021[,1]))
# table() function is flexible, can tabulate a single variable and do crosstabs
table(kaggle2021[3])
# Wrapping it inside prop.table() gives proportions of each category
prop.table(table(kaggle2021[3]))
# Wrapping it inside sort() gives value sorting, as opposed to alphabetic (or facto levels)
sort(table(kaggle2021[3]), decreasing = TRUE)[1]
