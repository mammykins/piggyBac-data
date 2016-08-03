#funnel plot for more compelte data set, trusty DBM OXITEC!
#plot funnel plot then circle published DBM data
#it work now add other species ae, mf, dbm, pbw
#SETUP
rm(list = ls()) #clear workspace
#.libPaths()
#.libPaths("C:/Program Files/R/R-2.14.0/library")
setwd("C://Users//mammykins//Google Drive//R//phd//B//piggyBac") #set wd
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

##############################
##############################AE
#INPUT
master <- read.csv("master2015jan.csv")

#plot just the Oxitec DBM data from Oxitec
ae.ox <- select(master, species, g0, g0.lambda, X) %>%
  na.omit() %>%
  filter(species == "ae")

#plotting parameters
par(mfrow=c(2, 2))
#plot it
funnelPlot(x = ae.ox$X, n = ae.ox$g0,method = "wilson", main = substitute(paste(italic("Aedes aegypti"))),
           xlab = "Number of injection survivors",
           ylab = "Transformation efficiency (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = FALSE)) #no legend

#add points from published ae data (meta)
setwd("C://Users//mammykins//Google Drive//R//phd//B//meta") #set wd
getwd() #check wd has been changed, make sure file is here
set.seed(1337)
meta <- read.csv("meta_oct2013.csv")
meta <- select(meta, g0, X, species) %>%
  na.omit() #removes NA
#get just ae
ae.meta <- select(meta, species, g0, X) %>%
  na.omit() %>%
  mutate(g0.lambda = X / g0) %>%
  filter(species == "Aedes aegypti")

points(x = ae.meta$g0, y = ae.meta$g0.lambda*100,
       pch = 19, col = "black", cex = 1) #times by 100 trnasformation efficiency
##########################################
##########################################


##############################
##############################DBM

#plot just the Oxitec DBM data from Oxitec
dbm.ox <- select(master, species, g0, g0.lambda, X) %>%
  na.omit() %>%
  filter(species == "dbm")

#plot it
funnelPlot(x = dbm.ox$X, n = dbm.ox$g0,method = "wilson", main = substitute(paste(italic("Plutella xylostella"))),
           xlab = "Number of injection survivors",
           ylab = "Transformation efficiency (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = FALSE)) #no legend

#add points from published dbm data (meta)
meta <- read.csv("meta_oct2013.csv")
meta <- select(meta, g0, X, species) %>%
  na.omit() #removes NA
#get just dbm
dbm.meta <- select(meta, species, g0, X) %>%
  na.omit() %>%
  mutate(g0.lambda = X / g0) %>%
  filter(species == "Plutella xylostella")

points(x = dbm.meta$g0, y = dbm.meta$g0.lambda*100,
       pch = 19, col = "black", cex = 1) #times by 100 trnasformation efficiency
##########################################
##########################################

##############################
##############################MF

#plot just the Oxitec mf data from Oxitec
mf.ox <- select(master, species, g0, g0.lambda, X) %>%
  na.omit() %>%
  filter(species == "mf")

#plot it
funnelPlot(x = mf.ox$X, n = mf.ox$g0,method = "wilson", main = substitute(paste(italic("Ceratitis capitata"))),
           xlab = "Number of injection survivors",
           ylab = "Transformation efficiency (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = FALSE),
           ylim = c(0,10)) #no legend

#add points from published mf data (meta)
meta <- read.csv("meta_oct2013.csv")
meta <- select(meta, g0, X, species) %>%
  na.omit() #removes NA
#get just mf
mf.meta <- select(meta, species, g0, X) %>%
  na.omit() %>%
  mutate(g0.lambda = X / g0) %>%
  filter(species == "Ceratitis capitata")

points(x = mf.meta$g0, y = mf.meta$g0.lambda*100,
       pch = 19, col = "black", cex = 1) #times by 100 trnasformation efficiency
##########################################
##########################################

##############################
##############################pbw

#plot just the Oxitec pbw data from Oxitec
pbw.ox <- select(master, species, g0, g0.lambda, X) %>%
  na.omit() %>%
  filter(species == "pbw")

#plot it
funnelPlot(x = pbw.ox$X, n = pbw.ox$g0,method = "wilson", main = substitute(paste(italic("Pectinophora gossypiella"))),
           xlab = "Number of injection survivors",
           ylab = "Transformation efficiency (%)",
           labels = "",
           ap = list(pch = 1, col="black"),
           am = list(col = "black"),
           a2 = list(col = "black", lty = 4),
           a3 = list(col = "black", lty = 2),
           al = list(plot = FALSE), ylim = c(0,10)) #no legend

#add points from published pbw data (meta)
meta <- read.csv("meta_oct2013.csv")
meta <- select(meta, g0, X, species) %>%
  na.omit() #removes NA
#get just pbw
pbw.meta <- select(meta, species, g0, X) %>%
  na.omit() %>%
  mutate(g0.lambda = X / g0) %>%
  filter(species == "Pectinophora gossypiella")

points(x = pbw.meta$g0, y = pbw.meta$g0.lambda*100,
       pch = 19, col = "black", cex = 1) #times by 100 trnasformation efficiency
##########################################
##########################################
par(mfrow=c(1, 1)) #reset incase
