library(tidyverse)
library(fitdistrplus)

d=read.csv('assignment_6.csv',header = TRUE,sep=',')
head(d)


ggplot(d,aes(x)) + geom_histogram(bins=50,color='Black',fill='steelblue')

ggplot(d,aes(y)) + geom_histogram(bins=50,color='Black',fill='steelblue')

descdist(d$y)
descdist(d$x)

fitg=fitdist(d$x,'gamma')
summary(fitg)

fitn=fitdist(d$y,'norm')
summary(fitn)

par(mfrow=c(2,2))
plot.legend=c('gamma')
denscomp(list(fitg),legendtext = plot.legend,xlab='X values',xlegend='topleft')
cdfcomp(list(fitg),legendtext = plot.legend,xlab='X values',xlegend='topleft')
qqcomp(list(fitg),legendtext = plot.legend,xlab='X values',xlegend='topleft')
ppcomp(list(fitg),legendtext = plot.legend,xlab='X values',xlegend='topleft')

par(mfrow=c(2,2))
plot.legend=c('norm')
denscomp(list(fitn),legendtext = plot.legend,xlab='X values',xlegend='topleft')
cdfcomp(list(fitn),legendtext = plot.legend,xlab='X values',xlegend='topleft')
qqcomp(list(fitn),legendtext = plot.legend,xlab='X values',xlegend='topleft')
ppcomp(list(fitn),legendtext = plot.legend,xlab='X values',xlegend='topleft')


