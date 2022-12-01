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
lapply(c("xml2"),  pkgTest)

# set working directory to current parent folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

xml_txt <- "<courses>
  <course> 
    <title>R for Social Data Science</title> 
      <code>HCI02</code> 
      <year>2022</year> 
      <term>Michaelmas</term> 
      <description>Course on computer programming in R.</description> 
  </course> 
</courses>"
xml <- xml2::read_xml(xml_txt)
str(xml)

xml_children <- xml2::xml_children(xml)
xml_children

xml2::xml_children(xml_children[1])
xml2::xml_text(xml_children(xml_children[1]))

dail_html <- read_html("https://en.wikipedia.org/wiki/Members_of_the_1st_D%C3%A1il")
rvest::html_elements(dail_html, xpath = "//p")
rvest::html_elements(dail_html, xpath = "//h1")

dail_tabs <- rvest::html_elements(dail_html, xpath = "//table")
tbody <- rvest::html_children(dail_tabs[5])
dial_members_1 <- as.data.frame(rvest::html_table(tbody))[,-3]
names(dial_members_1) <- dial_members_1[1,]
dial_members_1 <- dial_members_1[-1,]

lapply(c("WikipediR"),  pkgTest)
dail_xml <- page_content("en", "wikipedia", page_name = "Members of the 1st Dail")