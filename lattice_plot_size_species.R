#comparing species survival & transgenic efficiency distributions by size
#http://learnr.wordpress.com/2009/06/29/ggplot2-version-of-figures-in-lattice-multivariate-data-visualization-with-r-part-2/

#SETUP
rm(list = ls()) #clear workspace
#.libPaths()
#.libPaths("C:/Program Files/R/R-2.14.0/library")
setwd("C://Users//mammykins//Google Drive//R//phd//B//piggyBac") #set wd
getwd() #check wd has been changed, make sure file is here

#LIBRARY
#LIBRARY - check if packages are installed and load them
if(!require("lattice")) {
  install.packages("lattice")
  require("lattice")
}

if(!require("gridExtra")) {
  install.packages("gridExtra")
  require("gridExtra")
}

if(!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}

#INPUT
#master <- read.csv("master2014may.csv")
master <- read.csv("master2015jan.csv")

bwtheme <- standard.theme("pdf", color=FALSE)

my.plot <- xyplot(g0.lambda ~ size/1000 | species, data = master,  # size changed to kbp
                  type = "p", ylim=c(0,0.3), pch=19,cex=0.8,
                  auto.key=TRUE, par.settings=bwtheme,
                  xlab = list(label = "Size (kbp)", cex = 1.2), 
                  ylab = list(label = "Transformation efficiency", cex = 1.2),
                  alpha = 0.3,strip = strip.custom(factor.levels = c(expression(italic("Aedes albopictus")), 
                                                                   expression(italic("Aedes aegypti")),  
                                                                   expression(italic("Plutella xylostella")),  
                                                                   expression(italic("Drosophila suzukii")),
                                                                   expression(italic("Ceratitis capitata")),
                                                                   expression(italic("Bactrocera oleae")),
                                                                   expression(italic("P. gossypiella")),
                                                                   expression(italic("Tribolium castaneum")),
                                                                   expression(italic("Tuta absoluta"))
                                                                   )))

print(my.plot)

###output ready for Office
#ggsave('boxplot_surv.png', dpi = 300) 
#print(b1)
#dev.off()

#tiff('lattice_g0lambda_bysize.jpg', bg="white")
#print(my.plot)
#dev.off()

trellis.device(device="png", filename="lattice_g0lambda_vs_size.png")
print(my.plot)
dev.off()