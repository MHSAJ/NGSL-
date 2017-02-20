library(rio)



NGSL.data <- import("/Users/ajwfg4/Desktop/NGSL Stuff/features, numeric .csv",header = TRUE) 

NGSLcor <- cor(NGSL.data)
head(NGSL.data)
