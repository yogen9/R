setwd("E:\\MyProgramms\\R\\Project")
library(caret)
data <- iris
dataset <- data[c(1:120),]
pred <- data[c(121:150),]

dim(dataset)
sapply(dataset, class)
levels(dataset$Species)
summary(dataset)

x <- dataset[,1:4]
y <- dataset[,5]
featurePlot(x,y,plot="ellipse")

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"



# a) linear algorithms
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)


# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

print(fit.lda)

predictions <- predict(fit.lda, pred)
confusionMatrix(predictions, pred$Species)