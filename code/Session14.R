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
lapply(c("ggplot2", "dplyr", "ggthemes"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

anes <- read.csv("../datasets/anes.csv")

pdf("../graphics/scatterplot_gg.pdf")
ggplot(data = anes, mapping = aes(x = age, y = income)) + geom_point()
dev.off()

pdf("../graphics/histogram_gg.pdf")
ggplot(data = anes, mapping = aes(x = age)) + geom_histogram()
dev.off()

pdf("../graphics/histogram_bins_gg.pdf")
ggplot(data = anes, mapping = aes(x = age)) + geom_histogram(stat="bin", bins=50)
dev.off()

pdf("../graphics/density_gg.pdf")
ggplot(data = anes, mapping = aes(x = age)) + geom_density()
dev.off()

pdf("../graphics/barchatr1_gg.pdf")
ggplot(data = anes, mapping = aes(x = age)) + geom_bar()
dev.off()

pdf("../graphics/barchatr2_gg.pdf")
anes %>% 
  filter(female == 1) %>% 
  group_by(white) %>% 
  summarize(avg_income = mean(income)) %>% 
  ggplot(aes(x = white, y = avg_income)) +
  geom_bar(stat = "identity") 
dev.off()
anes$female <- as.factor(anes$female)
pdf("../graphics/color_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_point()
dev.off()

pdf("../graphics/fill_wrong_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_bar(stat = "identity") 
dev.off()

pdf("../graphics/fill_correct_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, fill = female)) + geom_bar(stat = "identity") 
dev.off()

pdf("../graphics/scales_color_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_point() + scale_color_manual(values = c("blue", "red")) 
dev.off()

pdf("../graphics/scale_continuous_gg.pdf")
ggplot(data = anes, mapping = aes(x = age, y = income)) + geom_col() + scale_x_continuous(limits = c(0, 100), breaks = c(0, 25, 50, 75))
dev.off()

pdf("../graphics/theme_min_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_point() + theme_minimal() 
dev.off()

pdf("../graphics/theme_econ_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_point() + theme_economist()
dev.off()

pdf("../graphics/lineplot_gg.pdf")
data.frame(x=rep(c("a", "b", "c"),2),
           y=rnorm(6)) %>% 
  ggplot(aes(x = x, y=y)) + geom_line() + geom_point()
dev.off()

pdf("../graphics/facet_gg.pdf")
ggplot(data = anes, aes(x = age, y = income, color = female)) + geom_point() + facet_wrap(~white)
dev.off()
