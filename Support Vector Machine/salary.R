# loading the salary_train and salary_test data sets

salary_train<- read.csv(file.choose())
salary_test <- read.csv(file.choose())

## Training a model on the data----
# begin by training a simple linear SVM

install.packages("kernlab")
library(kernlab)

salary_sal <- ksvm(salary_train$Salary ~. , data = salary_train, kernel = "vanilladot")
# basic infromation about the model

salary_sal

# Evaluating model performance
# predictions on testing dataset

salary_sal_prediction <- predict(salary_sal, salary_test)

head(salary_sal_prediction)

table(salary_sal_prediction, salary_test$Salary)

agreement <- salary_sal_prediction == salary_test$Salary
table(agreement)
prop.table(table(agreement))


# kernel = besseldot

salary_sal_bessel <- ksvm(salary_train$Salary ~. , data = salary_train, kernel = "besseldot")
# basic infromation about the model

salary_sal_bessel

# Evaluating model performance
# predictions on testing dataset

salary_sal_bessel_prediction <- predict(salary_sal_bessel, salary_test)

head(salary_sal_bessel_prediction)

table(salary_sal_bessel_prediction, salary_test$Salary)

agreement_bessel <- salary_sal_bessel_prediction == salary_test$Salary
table(agreement_bessel)
prop.table(table(agreement_bessel))


# kernel = polydot

salary_sal_poly <- ksvm(salary_train$Salary ~. , data = salary_train, kernel = "polydot")
# basic infromation about the model

salary_sal_poly

# Evaluating model performance
# predictions on testing dataset

salary_sal_poly_prediction <- predict(salary_sal_poly, salary_test)

head(salary_sal_poly_prediction)

table(salary_sal_poly_prediction, salary_test$Salary)

agreement_poly <- salary_sal_poly_prediction == salary_test$Salary
table(agreement_poly)
prop.table(table(agreement_poly))


# kernel = rbfdot 

salary_sal_rbf <- ksvm(salary_train$Salary ~., data = salary_train, kernel = "rbfdot")

# information about the model

salary_sal_rbf

salary_sal_rbf_prediction <- predict(salary_sal_rbf, salary_test)

head(salary_sal_rbf_prediction)

table(salary_sal_rbf_prediction, salary_test$Salary)

agreement_rbf <- salary_sal_rbf_prediction == salary_test$Salary
table(agreement_rbf)

prop.table(table(agreement_rbf))






