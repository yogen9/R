setwd("E:\\MyProgramms\\R\\Project")
#library(xts)

#read data from csvs
min_data <- read.csv("min.csv")
max_data <- read.csv("max.csv")

print(is.data.frame(min_data))
print(is.data.frame(max_data))
#print(min_data)
#print(max_data)

	#this calculates mean value of colums 
mean_min <- apply(min_data,2,mean)
mean_max <- apply(max_data,2,mean)
print(mean_min)
print(mean_max)


png(file = "mean_min.jpg")
plot(mean_min,type="o",xlab="Months",ylab="Temp",main="Min Temp. ALL Over",col="blue")
lines(mean_max,type="o",col="red")
dev.off()

colums = colnames(min_data)

png(file = "mean_max.jpg")
plot(mean_max,type="o",xlab="Months",ylab="Temp",main="Max Temp. ALL Over",col="red")
dev.off()

	#min max prediction

i <- as.integer(readline(prompt="Enter the Month for Min Max Prediction(in numeric) : "))
print(colums[i])
y <- max_data[[i]]
x <- min_data[[i]]
relation <- lm( y ~ x)
print(summary(relation))
temp <- readline()

png(file = "min_max_prediction.jpg")
plot(x,y,cex = 1.3,pch=16,col="blue",main=c("MAX & MIN of",colums[i],"Regression"),abline(relation),xlab="MIN",ylab="MAX")
dev.off()

pred_value <- as.integer(readline(prompt="Enter Min Temp for Predict Corresponding Max Temp : "))
print(pred_value) 
min<-data.frame(x=pred_value)
print(predict(relation,min))
temp <- readline()

	#side by side prediction for min

j <- as.integer(readline(prompt="Enter the First Month as Predictor (in numeric) : "))
print(colums[j])
k <- as.integer(readline(prompt="Enter the Second Month as Responce (in numeric) : "))
print(colums[k])
tog <- as.integer(readline(prompt="Which one MIN or MAX \n 1. MIN \n 2.MAX \n :  "))

if(tog == 1){
	y <- min_data[[k]]
	x <- min_data[[j]]
}else{
	y <- max_data[[k]]
	x <- max_data[[j]]
}

relation <- lm(y~x)
print(summary(relation))
temp <- readline()

png(file = "TwoMonthPrediction.jpg")
plot(x,y,cex=1.3,pch=16,col="blue",main=c(colums[j],colums[k],"Regression"),abline(relation),xlab=j,ylab=k) 
dev.off()

pred_value <- as.integer(readline(prompt="Enter Temp. Value for Prediction : "))
print(pred_value)
value<-data.frame(x=pred_value)
print(predict(relation,value))
temp <- readline()

	#Time Series 
m <- as.integer(readline(prompt="Enter the Month for Time Series Analysis(in numeric) : "))
tog <- as.integer(readline(prompt="Which one MIN or MAX \n 1. MIN \n 2.MAX \n :  ")) 

if(tog == 1){
	minT=ts(min_data[[m]],start=c(1901))
	plot(minT)
}else{
	maxT=ts(max_data[[m]],start=c(1901))
	plot(maxT)
}
temp <- readline()

	#decomposition
sub_min_data <- min_data[c(100:115),]       
apts1 <- ts(sub_min_data, frequency = 12) 
f1 <- decompose(apts1[,c(1:10)]) 

sub_max_data <- max_data[c(100:115),]       
apts2 <- ts(sub_max_data, frequency = 12) 
f2 <- decompose(apts2[,c(1:10)])

plot(f1$seasonal,col="blue")
temp <- readline()
plot(f2$trend[,1:10],col="red")


