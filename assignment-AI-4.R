library(datasets)
str(iris)
subset(iris, Species == "setosa")[1:5,]
subset(iris, Species == "versicolor")[1:5,]
subset(iris, Species == "virginica")[1:5,]
subset(iris, Petal.Length < 2)[,"Species"]
summary(iris)
par(mar=c(7,5,1,1)) # more space to labels
boxplot(iris,las=2)
irisVer <- subset(iris, Species == "versicolor")
irisSet <- subset(iris, Species == "setosa")
irisVir <- subset(iris, Species == "virginica")
par(mfrow=c(1,3),mar=c(6,3,2,1))
boxplot(irisVer[,1:4], main="Versicolor",ylim = c(0,8),las=2)
boxplot(irisSet[,1:4], main="Setosa",ylim = c(0,8),las=2)
boxplot(irisVir[,1:4], main="Virginica",ylim = c(0,8),las=2)
hist(iris$Petal.Length)
par(mfrow=c(1,3))
hist(irisVer$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(irisSet$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(irisVir$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
library(beanplot)
xiris <- iris
xiris$Species <- NULL
beanplot(xiris, main = "Iris flowers",col=c('#ff8080','#0000FF','#0000FF','#FF00FF'), border = "#000000")
corr <- cor(iris[,1:4])
round(corr,3)
pairs(iris[,1:4])
pairs(iris[,1:4],col=iris[,5],oma=c(4,4,6,12))
par(xpd=TRUE)
legend(0.85,0.6, as.vector(unique(iris$Species)),fill=c(1,2,3))
data <- iris[,1:4]
dim(data)
quartiles <- quantile(data$Sepal.Width, probs=c(.25, .75), na.rm = FALSE)
IQR <- IQR(data$Sepal.Width)

Lower <- quartiles[1] - 1.5*IQR
Upper <- quartiles[2] + 1.5*IQR 

data_no_outlier <- subset(data, data$Sepal.Width > Lower & data$Sepal.Width < Upper)

dim(data_no_outlier)
boxplot(data_no_outlier,las=2)
