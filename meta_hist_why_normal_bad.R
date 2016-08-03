#meta_hist_why_normal_bad
#OVERVIEW plot histogram with normal density curve and cumulative version
rm(list = ls()) #clear workspace

setwd("C://Users//mammykins//Google Drive//R//phd//B//meta") #set wd

if(!require("dplyr")) {
  install.packages("dplyr")
  require("dplyr")
}

#INPUT
master <- read.csv("meta_mar2015.csv")

data <- tbl_df(master)
data2 <- select(data, order, species, label, g0, inj, X) %>%
  mutate(surv = g0 / inj,
         g0.lambda = X / g0,
         recip.surv = 1 / surv,
         recip.g0.lambda = 1 / g0.lambda)

data3 <- filter(data2, complete.cases(data2))

#OUTPUT

## For transformation efficiency
x <- data3$g0.lambda

## Calculate and plot the two histograms
hcum <- h <- hist(x, plot = FALSE, breaks = 10)
hcum$counts <- cumsum(hcum$counts)

tiff(filename = "meta_hist_g0lambda.png")  # SAVE AS...

plot(hcum, main = "", xlim = c(-0.2, 0.8),
     xlab = "Transformation efficiency", cex.lab=1.5, cex.axis = 1.25)
plot(h, add = T, col = "grey")

## Plot the density and cumulative density
d <- density(x)
lines(x = d$x, y = d$y * length(x) * diff(h$breaks)[1], lwd = 2)
lines(x = d$x, y = cumsum(d$y)/max(cumsum(d$y)) * length(x), lwd = 2, lty = "dashed")

dev.off() #TURN OFF DEV!