## Importing Data ### lets use NGSL data## 
library("rio")
ngsl.data <- import("/Users/tassiwomack/Desktop/MasterRespones#1.xlsx")

#need to delete the 2nd column cause its junk [2] refers to second column, NULL = gone
ngsl.data[2] <- NULL
ngsl.data[17] <- NULL

## rename columns 
colnames(ngsl.data) <- c('student','SBA1','ana1','exp1','cri1','cla1','SBA2','ana2','exp2','cri2','cla2','SBA3','ana3','exp3','cri3','cla3','grade')

## clean up rows 
ngsl.data <- ngsl.data[-1,]

is.numeric(ngsl.data$ana1)

ngsl.data <- as.numeric(as.character(ngsl.data$ana1))

## make a subset looking at specific grades or scores 


## "read.csv" also reads csv files  
head(ngsl.data) #shows the first few observations
tail(r.data) #shows the last few observations
cov(r.data) #generates a covariance matrix to show in the screen 
cor(r.data) #generates a correlation matrix to show on the screen cov = cor kinda
m1 <- lm(gpa ~ am + iq + ses, data = r.data) #uses the raw data
summary(m1) #these are unstandardized

library(lm.beta) #to get quick standardized betas without rescaling
lm.beta(m1)