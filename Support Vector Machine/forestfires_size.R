# loading the forestfires data

forestfires <- read.csv(file.choose())
View(forestfires)
summary(forestfires)

normalize <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

forestfires$FFMC <- normalize(forestfires$FFMC)
forestfires$DMC <- normalize(forestfires$DMC)
forestfires$DC <- normalize(forestfires$DC)
forestfires$ISI <- normalize(forestfires$ISI)
forestfires$temp <- normalize(forestfires$temp)
forestfires$RH <- normalize(forestfires$RH)
forestfires$wind <- normalize(forestfires$wind)
forestfires$rain <- normalize(forestfires$rain)
forestfires$area <- normalize(forestfires$area)
summary(forestfires)

attach(forestfires)
set.seed(123)
ind <- sample(2, nrow(forestfires), replace = TRUE, prob = c(0.7,0.3))
forestfires_train <- forestfires[ind == 1,]
forestfires_test <- forestfires[ind == 2,]

# Training a model on the data----
# begin by training a simple linear SVM

install.packages("kernlab")
library(kernlab)

forestfires_size <- ksvm(size_category ~., data = forestfires_train, kernel = "vanilladot")

# basic infromation about the model

forestfires_size


# Evaluating model performance
# predictions on testing dataset

forestfires_prediction <- predict(forestfires_size, forestfires_test)

head(forestfires_prediction)

table(forestfires_prediction, forestfires_test$size_category)

agreement <- forestfires_prediction == forestfires_test$size_category

table(agreement)
prop.table(table(agreement))

# improving model performance
# rbf -> Redial Basis Fucntion Kernel

forestfires_size_rbf <- ksvm(size_category ~. , data = forestfires_train, kernel = "rbfdot")

forestfires_size_rbf_prediction <- predict(forestfires_size_rbf, forestfires_test)

agreement_rbf <- forestfires_size_rbf_prediction == forestfires_test$size_category
table(agreement_rbf)

prop.table(table(agreement_rbf))

# # kernal = besseldot

forestfires_size_bessel <- ksvm(size_category ~. , data = forestfires_train, kernel = "besseldot")

forestfires_size_bessel_prediction <- predict(forestfires_size_bessel, forestfires_test)

agreement_bessel <- forestfires_size_bessel_prediction == forestfires_test$size_category
table(agreement_bessel)

prop.table(table(agreement_bessel))

# kernel = polydot

forestfires_size_poly <- ksvm(size_category ~. , data = forestfires_train, kernel = "polydot")

forestfires_size_poly_prediction <- predict(forestfires_size_poly, forestfires_test)

agreement_poly <- forestfires_size_poly_prediction == forestfires_test$size_category
table(agreement_poly)

prop.table(table(agreement_poly))
































