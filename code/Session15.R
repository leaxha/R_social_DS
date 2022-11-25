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
lapply(c("rvest"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

html_txt <- "\n
<!DOCTYPE html> \n
<html>\n
    <head>\n
        <title>A title</title> \n
    </head>\n
    <body>\n
        <h1 style='color:Red;'>A heading</h1> \n
        <p>A paragraph.</p> \n
    </body>\n
</html>"
html <- rvest::read_html(html_txt)
str(html)

children <- rvest::html_children(html)
children
body <- children[2]
rvest::html_name(body)
children2 <- rvest::html_children(body)
children2
rvest::html_attrs(children2[1])
rvest::html_text(children2[1])