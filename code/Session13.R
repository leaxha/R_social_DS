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

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

inc_local <- read.csv("../datasets/incumbents_subset.csv")[,-1]

pdf("../graphics/scatterplot_presvote.pdf")
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame
plot(inc_local$presvote, inc_local$voteshare, 
     main = "Presidential v Congressional vote within district",
     xlab = "Presidential vote share", ylab = "Congressional vote share", pch = 19, frame = F)

dev.off()

pdf("../graphics/scatterplot_abline.pdf")
# Add regression line
plot(inc_local$presvote, inc_local$voteshare, 
     main = "Presidential v Congressional vote within district",
     xlab = "Presidential vote share", ylab = "Congressional vote share",
     pch = 19, frame = F)
abline(lm(voteshare ~ presvote, data = inc_local), col = "red")
dev.off()

pdf("../graphics/scatterplot_loess.pdf")
# Add regression line
plot(inc_local$presvote, inc_local$voteshare, 
     main = "Presidential v Congressional vote within district",
     xlab = "Presidential vote share", ylab = "Congressional vote share",
     pch = 19, frame = F)
lines(lowess(inc_local$presvote, inc_local$voteshare), col = "blue")
dev.off()

pdf("../graphics/pairs.pdf")
my_cols <- c("red", "blue")  
pairs(inc_local[,15:ncol(inc_local)], pch = 19,  cex = 0.15,
      col = my_cols[as.factor(inc_local$south)],
      lower.panel=NULL)
dev.off()

pdf("../graphics/histogram.pdf")
hist(inc_local$difflog, main = "", xlab = "Difference in candidate spending")
dev.off()
pdf("../graphics/histogram2.pdf")
hist(inc_local$difflog, main = "", xlab = "Difference in candidate spending", breaks=50)
dev.off()

pdf("../graphics/density.pdf")
plot(density(inc_local$difflog), main = "", xlab = "Difference in candidate spending") 
dev.off()

pdf("../graphics/barplot.pdf")
barplot(table(inc_local$seniority), ylim=c(0, 600), xlab="Years of service")

dev.off()
pdf("../graphics/barplot_H.pdf")
# Horizontal bar plot
barplot(table(inc_local$seniority), xlim=c(0, 600), ylab="Years of service", horiz = T)
dev.off()

pdf("../graphics/boxplot.pdf")
boxplot(difflog ~ south, data = inc_local, frame = F)
dev.off()
pdf("../graphics/boxplot_H.pdf")
# Horizontal box plots
boxplot(difflog ~ south, data = inc_local, frame = F, horizontal = T)
dev.off()

pdf("../graphics/lineplot1.pdf")
south_year_avg <- inc_local %>% 
  group_by(south, year) %>% 
  summarize(avg = mean(difflog))
plot(south_year_avg[1:10,]$year, south_year_avg[1:10,]$avg, type = "b", frame = F, pch = 20, xlab = "Year", ylab = "Average difference in spending in North")
dev.off()
pdf("../graphics/lineplot2.pdf", width=8)
plot(south_year_avg[1:10,]$year, south_year_avg[1:10,]$avg, type = "b", frame = F, pch = 20, xlab = "Year", ylab = "Average difference in spending")
lines(south_year_avg[11:20,]$year, south_year_avg[11:20,]$avg, pch = 18, col = "red", type = "b", lty = 2)
# Add a legend to the plot
legend("bottomright", legend=c("North", "South"),
       col=c("black", "red"), lty = 1:2, cex=0.8, box.lty=0)
dev.off()

pdf("../graphics/text_labelsPlot.pdf")
# Generate some data
my_new <- data.frame(x=1:10, x2=letters[1:10], y1=x*x, y2=2*y1)
# First line plot
plot(my_new$x, my_new$y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# Add a second line
lines(my_new$x, my_new$y2, pch=18, col="blue", type="b", lty=2)
# Add legends
legend("topleft", legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)
text(my_new$x, 2, my_new$x2, 
     cex=0.65, pos=1,col="black")
dev.off()

pdf("../graphics/axesPlot.pdf")
plot(my_new$x, my_new$y1, pch=18, col="red", type="b",
     frame=FALSE, xaxt="n") # Remove x axis
axis(1, 1:4, LETTERS[1:4], col.axis="blue")
axis(3, col = "darkgreen", lty = 2, lwd = 0.5)
axis(4, col = "violet", col.axis = "dark violet", lwd = 2)
dev.off()

pdf("../graphics/segments_plot.pdf")
plot(0, 0, col = "white", xlab = "", ylab = "")
segments(x0 = - 1, y0 = - 0.5, x1 = 0.5, y1 = 0)
dev.off()
