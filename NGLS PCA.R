library(rio)
library(psych)

NGSL.data <- import("/Users/ajwfg4/Desktop/NGSL Stuff/features, numeric .csv",header = TRUE) 

NGSL.data1 <-NGSL.data[,-c(1,2)] 
NGSLcor <- cor(NGSL.data1)
str(NGSLcor)
head(NGSL.data)

KMO <- KMO(NGSL.data1)
str(KMO)

L <- eigen(NGSLcor)$values
plot(L, type = 'b', main = 'SCREE PLOT')
abline(h=1)

Lround <- round(eigen(NGSLcor)$values, 5)
Lround

### look like 310 primary components #### 


pca310 <- principal(r = NGSLcor, nfactors = 310, n.obs = 488)

pca310

NGSLpca <- NGSL.data[,c(1,2)]

factor.scores(NGSL.data1,pca310)
pcascores <- factor.scores(NGSL.data1,pca310)
str(pcascores)
head(pcascores)
pcascores$scores
NGSLpca$pcascores <- pcascores$scores[,1]
                                



