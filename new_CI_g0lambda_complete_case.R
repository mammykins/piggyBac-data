#create binomial error bars for each experiment in emta analysis
#SETUP
rm(list = ls()) #clear workspace
#.libPaths()
#.libPaths("C:/Program Files/R/R-2.14.0/library")
setwd("C://Users//mammykins//Google Drive//R//phd//B//meta") #set wd
getwd() #check wd has been changed, make sure file is here
set.seed(1337)

#LIBRARY

library(ggplot2)
library(gridExtra)
library(plyr) #to access round any
library(binom)
library(boot)

#INPUT
master <- read.csv("meta_oct2013.csv")
data <- master[, c("order","label","g0","X")]

good <- complete.cases(data)
data <- data[good, ]
        
#GENERATE CI
valid.rows <- c(1:6,8,9,11:28,31:68,71:79,84:86)
output <- NULL
df <- binom.bayes(x=data[1:76, "X"],
                  n=data[1:76,"g0"],conf.level=0.95,
        prior.shape1=0.73, prior.shape2=5.67, tol=1e-9) #values from meta-analysis

#Forest plot from http://www.r-bloggers.com/forest-plots-using-r-and-ggplot2/
d <- cbind(data,df) #join dataframes or columns for function to operate on

credplot.gg <- function(d){
  # d is a data frame with 4 columns
  # d$label gives variable / species names
  # d$mean gives center point
  # d$lower gives lower limits
  # d$upper gives upper limits
  require(ggplot2)
  p <- ggplot(d, aes(x=d$label, y=d$mean, ymin=d$lower, ymax=d$upper))+
    geom_pointrange(alpha=I(0.25),size=0.85, shape = d$order)+
    coord_flip() + geom_hline(aes(x=0), lty=2)+ xlab('Species')+ ylab('Transformation efficiency')+
    theme(legend.position="none",panel.background = element_blank())+
    theme(axis.title.x = element_text(face="bold", colour="grey", size=25),
          axis.title.y = element_text(face="bold", colour="grey", size=25),
          axis.text.x = element_text(angle=0, colour="black",size=15,vjust=0.5),
          axis.text.y = element_text(angle=0, colour="black",size=15,vjust=0.5, face = "italic"))
  
    return(p)
}

#run function on d
#unhash to save in wd
figure <- credplot.gg(d)
###output ready for Office
ggsave('forestplot_meta.png', dpi = 300) #weird but they seem to be the wrong way round
print(figure)
dev.off()