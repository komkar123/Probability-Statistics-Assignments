library(tidyverse)
library(e1071)

setwd("C:/Users/DELL/Downloads")

health <- read.csv('Health_Dataset.csv',header=TRUE, sep=',')

health_df=data.frame(health) 
health_df# task 1

underwt=health_df[health_df$BMI<18.5,]
underwt

underwt_num=nrow(underwt)
underwt_num                     #task 2


normal=(health_df[health_df$BMI>=18.5 & health_df$BMI<25 , ])
nrow(normal)

overwt=(health_df[health_df$BMI>=25 & health_df$BMI<30 , ])
nrow(overwt)

obese = (health_df[health_df$BMI>=30,])
nrow(obese)

normal_hy=normal[normal$Hypertension==TRUE,]
nrow(normal_hy)

overwt_hy=overwt[overwt$Hypertension==TRUE,]
nrow(overwt_hy)

over_normal = rbind(overwt_hy,normal_hy)

ggplot(NULL,aes(x=Hypertension)) +
  geom_bar(overwt_hy,mapping=aes(Hypertension),width=.1,fill='blue') +
  geom_bar(normal_hy,mapping=aes(Hypertension),width=.1,fill='red')


mean_nor=mean(normal$BMI)
mean_nor

median_nor=median(normal$BMI)
median_nor

range_nor=max(normal$BMI)-min(normal$BMI)
range_nor

int_quanrange=quantile(normal$BMI,.75)-quantile(normal$BMI,.25)
int_quanrange

var_nor=var(normal$BMI)
var_nor

sd_nor=sd(normal$BMI)
sd_nor


#task3

perc=data.frame("Stroke"=c(TRUE,TRUE,FALSE,FALSE),"Hypertension"=c(TRUE, FALSE, TRUE, FALSE))


per1=(nrow(health_df[health_df$Stroke=='TRUE'& health_df$Hypertension=='TRUE',]))/(nrow(health_df))*100;



per2=(nrow(health_df[health_df$Stroke=='TRUE'& health_df$Hypertension=='FALSE',]))/(nrow(health_df))*100;



per3=(nrow(health_df[health_df$Stroke=='FALSE'& health_df$Hypertension=='TRUE',]))/(nrow(health_df))*100;



per4=(nrow(health_df[health_df$Stroke=='FALSE'& health_df$Hypertension=='FALSE',]))/(nrow(health_df))*100;


Percentage1=data.frame(Percentage=c(per1,per2,per3,per4))

cbind(perc,Percentage1)








#health_df + 
#  group_by(Hypertension)
  #mutate(perc=(nrow(Hypertension)/nrow(health_df))*100)







#Task 4


mean_gluc=mean(health_df$Avg_Glucose_Level)

mean_gluc

sd_gluc=sd(health_df$Avg_Glucose_Level)

sd_gluc

cov_gluc=(sd_gluc/mean_gluc)*100;

cov_gluc 

skew_gluc=skewness(health_df$Avg_Glucose_Level)
skew_gluc

kur_gluc=kurtosis(health_df$Avg_Glucose_Level)
kur_gluc

ggplot(data=health_df)+
  geom_histogram(mapping=aes(x=health_df$Avg_Glucose_Level),colour=' blue',fill='light blue',binwidth=10)+
  xlab('Avg Glucose Level')+ylab('Frequency')

ggplot(data=health_df) +
  geom_point(mapping=aes(x=Age,y=Avg_Glucose_Level,color=Heart_Diseases))+
  geom_vline(xintercept = 30)+
  geom_vline(xintercept=60)+
  geom_hline(yintercept = 150)


ggplot(data=health_df) +
  geom_point(mapping=aes(x=Age,y=Avg_Glucose_Level,color=Stroke))+
  geom_vline(xintercept=50)+
  geom_hline(yintercept=150)
ggplot(data=health_df) +
  geom_point(mapping=aes(x=Age,y=BMI,color=Heart_Diseases))+
  geom_vline(xintercept=50)+
  geom_hline(yintercept=40)








