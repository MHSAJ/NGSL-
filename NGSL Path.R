library(lavaan)
library(rio)


####using lavaan to run path analysis####
# build regression models between single quotes "'" with IVs co-varying useing "~~" 
# use seperate lines to define the different models
# can use ";" to place models on one line

#### use rio package function import to load data, file directories and name
ngsl.data <- import('/Users/tassiwomack/NGSLdummydata.csv')
####shows data 
View(ngsl.data)
#### lets you easily see the headers in console 
str(ngsl.data)
####building the model 
mod1 <- '
crit ~ a*exp + b*ana
claim ~ c*exp + d*ana
ana ~~ exp
'

#run the model
out1 <- sem(data = ngsl.data, model = mod1, fixed.x = F)

#show the summary
summary(out1, standardized = T, rsq = T)
