library(rio)
library(psych)
### sorry for the wonky data file name ### 
NGSL.data <- import("/Users/tassiwomack/Desktop/features, numeric.csv",header = TRUE) 

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

### start with 5 to check to make sure it works #### 
pca310 <- principal(r = NGSLcor, nfactors = 310, n.obs = 488, rotate = 'none')
pca5
pca310

## 

NGSLpca <- NGSL.data[,c(1,2)]

#### factor.scores(NGSL.data1,pca310) ####
### make it into a values list #####
pcascores <- factor.scores(NGSL.data1,pca310)
str(pcascores)
head(pcascores)
pcascores$scores

NGSLpca$pcascores <- pcascores$scores[,1]

### Make a value table of just the component coefficents ###                                
pcascores <- pcascores$scores[,1:310]
### Convert that to a proper data frame 
tmp <- data.frame(pcascores)

### use combine fucntion 'cbind' to merge two data frames together 
new <- cbind(NGSLpca, tmp)

