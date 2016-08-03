#ploting box and whisker + scatterplot of efficiency data by order
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
library(dplyr) #to access round any, may need to change to plyr

#INPUT
master <- read.csv("meta_oct2013.csv")

x <- ggplot(master, aes(order, g0.lambda)) + geom_boxplot(width=0.8,fill=order, outlier.shape=8)+
  theme(legend.position = "none") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)+
  xlab("Order") + ylab("Transformation efficiency") +
  geom_jitter(alpha=I(0.75),position=position_jitter(width=0.2, height=0)) +
  theme_bw() +
  theme(axis.title.x = element_text(face="bold", colour="grey", size=25),
        axis.title.y = element_text(face="bold", colour="grey", size=25),
        axis.text.x = element_text(angle=0, colour="black",size=15,vjust=0.5),
        axis.text.y = element_text(angle=0, colour="black",size=15,vjust=0.5))


###output ready for Office
ggsave('g0lambda_overlay_meta.png', dpi = 300) #weird but they seem to be the wrong way round
print(x)
dev.off()

#######zero experiments
data_tbl_df <- tbl_df(master)

relevant_tbl_df <-
  data_tbl_df %>%
  select(species, inj, g0, X, order) %>% 
  mutate(s = g0/inj, g0.lambda = X / g0)

no.na.g0.lambda <- filter(relevant_tbl_df, g0.lambda >= 0) #create a df without NA
sum(no.na.g0.lambda[, "g0.lambda"] == 0)