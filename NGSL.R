## Importing Data ### lets use NGSL data## 
library("rio")
ngsl.data <- import("/Users/tassiwomack/Desktop/MasterRespones#1.xlsx")

ngsl.data<-import("/Users/ericwulff/Desktop/MHS/NGSLallresponses.csv")



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

######

library(rio)
install.packages('dplyr')

library(dplyr)
## importing data 
ngsl.data<-import("/Users/ericwulff/Desktop/MHS/MasterRespones#1.xlsx")

## removing the first row
ngsl.data<-ngsl.data[-1,]
#renaming variables 
colnames(ngsl.data)<-c('student','extra','r1','a1','e1','cr1','cl1','r2','a2','e2','cr2','cl2','r3','a3','e3','cr3','cl3','extra2','grade')
#deleting columns 
ngsl.data$extra=NULL 
ngsl.data$extra2=NULL
##### removes all na data from dataset #### 
ngsl.data<-na.omit(ngsl.data)
### making every column numeric ### 
ngsl.data$a1<-as.numeric(as.character(ngsl.data$a1))
ngsl.data$e1<-as.numeric(as.character(ngsl.data$e1))
ngsl.data$cr1<-as.numeric(as.character(ngsl.data$cr1))
ngsl.data$cl1<-as.numeric(as.character(ngsl.data$cl1))
ngsl.data$a2<-as.numeric(as.character(ngsl.data$a2))
ngsl.data$e2<-as.numeric(as.character(ngsl.data$e2))
ngsl.data$cr2<-as.numeric(as.character(ngsl.data$cr2))
ngsl.data$cl2<-as.numeric(as.character(ngsl.data$cl2))
ngsl.data$a3<-as.numeric(as.character(ngsl.data$a3))
ngsl.data$e3<-as.numeric(as.character(ngsl.data$e3))
ngsl.data$cr3<-as.numeric(as.character(ngsl.data$cr3))
ngsl.data$cl3<-as.numeric(as.character(ngsl.data$cl3))

## averaging the column scores per response and creating new columns 
ngsl.data<-mutate(ngsl.data, avg1=((a1+e1+cr1+cl1)/4), avg2=((a2+e2+cr2+cl2)/4),avg3=((a3+e3+cr3+cl3)/4))
ngsl.data
## run t-test on averages 
t.test(finaldata$avg1,finaldata$avg3) ###ttest with two numeric variables###
t.test(finaldata$avg2,finaldata$avg3)

## export 
write.csv(finaldata, file="NGSLallresponses.csv")

####################################

ngsl.data<-import("/Users/ericwulff/Desktop/MHS/NGSLallresponses.csv")

ngsl.data <- import('/Users/tassiwomack/NGSLallresponses.csv')

ngsl.data<-mutate(ngsl.data, davg13= (avg3-avg1)) ##add column with difference between avg3 and avg1 called davg13##
ngsl.data<-mutate(ngsl.data, avgtotal= ((avg1+avg2+avg3)/2))##add average total #33

cor(ngsl.data$grade,ngsl.data$davg13) ## correlation between grade and difference in avgerage from 1 to 3##
cor(ngsl.data$grade,ngsl.data$avg3)
cor(ngsl.data$grade,ngsl.data$avgtotal)
cor(ngsl.data$grade,ngsl.data$avgtotal)

### run linear model 
mod1 <- lm(grade ~ avgtotal, data = ngsl.data)
summary(mod1)





