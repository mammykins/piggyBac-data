#try to overlay boxplot onto scatterplot for all species 
#Oxitec data 2014
#SETUP
rm(list = ls()) #clear workspace
#.libPaths()
#.libPaths("C:/Program Files/R/R-2.14.0/library")
setwd("C://Users//mwg//Google Drive//R//phd//B//piggyBac") #set wd
getwd() #check wd has been changed, make sure file is here

#LIBRARY

library(ggplot2)
library(gridExtra)
library(plyr) #to access round any

#INPUT
master <- read.csv("master2015jan.csv")
#master <- master[master$species=="dbm",]

#quicker to type than adress in master
yvar <- master[,"surv"] #yvar is survival
xvar <- master[,"g0.lambda"] #xvar is transgenesis efficiency
zvar <- master[,"species"] #zvar is a dbm subset of surv and g0lambda
xy <- data.frame(xvar, yvar, zvar,master[]) #as I'm lifting the code this is what the variables are called in it

#boxplot
b1<-ggplot(xy, aes(zvar, xvar)) + 
  geom_boxplot(aes(fill = zvar)) +
  xlab("Species") + ylab("Transgenic efficiency") +
  theme_grey(base_size = 18) + theme(legend.position = "none")+
  scale_x_discrete(limits=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   breaks=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   labels=c("Aedes albopictus", "Aedes aegypti","Ceratitis capitata", "Bactrocera oleae", "Drosophila suzukii", "Plutella xylostella", "Pectinophora gossypiella", "Tuta absoluta", 
                            "Tribolium castaneum" ))+
  theme(axis.title.x = element_text(face="bold", colour="black", size=15),
        axis.title.y = element_text(face="bold", colour="black", size=15),
        axis.text.x = element_text(angle=90, face="italic", colour="grey",size=8,vjust=0.5))

#jitter plot
b2<-ggplot(xy, aes(zvar, xvar)) + 
  geom_jitter(alpha=I(1), aes(color=zvar)) +
  xlab("Species") + ylab("Transgenic efficiency") +
  theme_grey(base_size = 18) + theme(legend.position = "none")+
  scale_x_discrete(limits=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   breaks=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   labels=c("Aedes albopictus", "Aedes aegypti","Ceratitis capitata", "Bactrocera oleae", "Drosophila suzukii", "Plutella xylostella", "Pectinophora gossypiella", "Tuta absoluta", 
                            "Tribolium castaneum" ))+
  theme(axis.title.x = element_text(face="bold", colour="black", size=15),
        axis.title.y = element_text(face="bold", colour="black", size=15),
        axis.text.x = element_text(angle=90, face="italic", colour="grey",size=8,vjust=0.5)) 

#combine by putting colour inside the ggplot
b3 <- ggplot(xy, aes(zvar, xvar,color=zvar)) + geom_boxplot(width=0.8,fill=order, outlier.shape=8) + geom_jitter(alpha=I(0.5), position=position_jitter(width=0.2, height=0))+
  xlab("Species") + ylab("Transgenic efficiency") +
  theme_grey(base_size = 18) + theme(legend.position = "none")+
  scale_x_discrete(limits=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   breaks=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   labels=c("Aedes albopictus", "Aedes aegypti","Ceratitis capitata", "Bactrocera oleae", "Drosophila suzukii", "Plutella xylostella", "Pectinophora gossypiella", "Tuta absoluta", 
                            "Tribolium castaneum" ))+
  theme(axis.title.x = element_text(face="bold", colour="black", size=15),
        axis.title.y = element_text(face="bold", colour="black", size=15),
        axis.text.x = element_text(angle=90, face="italic", colour="grey",size=8,vjust=0.5))+ 
coord_cartesian(ylim=c(0, 0.2))

b4 <- ggplot(xy, aes(zvar, xvar)) + geom_boxplot(width=0.8,fill=order, outlier.shape=8) + geom_jitter(alpha=I(0.5), size = 2.2, position=position_jitter(width=0.2, height=0))+
  xlab("Species") + ylab("Transformation efficiency") +
  theme_grey(base_size = 18) + theme(legend.position = "none")+
  scale_x_discrete(limits=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   breaks=c("aa", "ae","mf","of","ds","dbm","pbw","tlm","tc"),
                   labels=c("Aedes \n albopictus", "Aedes \n aegypti","Ceratitis \n capitata", "Bactrocera \n oleae", "Drosophila \n suzukii", "Plutella \n xylostella", "Pectinophora \n gossypiella", "Tuta \n absoluta", 
                            "Tribolium \n castaneum"  ))+
  theme_bw() +
  theme(axis.title.x = element_text(face="bold", colour="grey", size=20),
        axis.title.y = element_text(face="bold", colour="grey", size=20, vjust = 1, hjust = 0.5),
        axis.text.x = element_text(angle=90, face="italic", colour="black",size=12,hjust=0.5))+
  coord_cartesian(ylim=c(0, 0.2))

b4 #+ theme(panel.background = element_blank()) #this removes background
###output ready for Office
ggsave('g0lambda_overlay.png') #weird but they seem to be the wrong way round
print(b4)
dev.off()