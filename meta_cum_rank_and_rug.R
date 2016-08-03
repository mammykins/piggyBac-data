#cumulative rank and rug for meta transformation efficiency
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

#INPUT
master <- read.csv("meta_oct2013.csv")

data <- select(master, g0, g0.lambda, X, label) %>%
  na.omit()

#plot
par(mfrow=c(1,1))

myplot <- plot.stepfun(ecdf(x = data$g0.lambda), main = "",
             xlab = "Transformation efficiency",
             ylab = "Relative rank", col = "black", pch = 19, cex = 0.2,
             col.points = "black",
             col.hor = "grey", col.vert = "grey")
rug(x = data$g0.lambda, ticksize = 0.02)


#tiff("meta_cum_rank_and_rug") 
#print(myplot)
#dev.off()

