#from http://www.r-bloggers.com/power-tools-for-aspiring-data-journalists-r/
#ploting box and whisker + scatterplot of efficiency data by order
#SETUP
rm(list = ls()) #clear workspace
#.libPaths()
#.libPaths("C:/Program Files/R/R-2.14.0/library")
setwd("C://Users//mammykins//Google Drive//R//phd//B//meta") #set wd
getwd() #check wd has been changed, make sure file is here
set.seed(1337)

#LIBRARY
if(!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}
if(!require("dplyr")) {
  install.packages("dplyr")
  require("dplyr")
}

if(!require("berryFunctions")) {
  install.packages("berryFunctions")
  require("berryFunctions")
}
#INPUT
master <- read.csv("meta_oct2013.csv")
data <- select(master, g0, g0.lambda, X, label, inj) %>%
  na.omit() #removes NA

##berryfunciton funnel plot
#issue with zeroes also
data <- filter(data, g0.lambda > 0)

funnelPlot(x = data$X, n = data$g0,method = "wilson", main = "",
           xlab = "Number of injection survivors",
           ylab = "Transformation efficiency (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = TRUE)) #no legend

#for interest does survival work better?
data <- select(master, g0, g0.lambda, X, label, inj) %>%
  na.omit() %>%
  mutate(surv = g0 / inj)

data <- filter(data, surv > 0)

funnelPlot(x = data$g0, n = data$inj,method = "wilson", main = "",
           xlab = "Number of embryos injected",
           ylab = "Survival (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = TRUE)) #no legend