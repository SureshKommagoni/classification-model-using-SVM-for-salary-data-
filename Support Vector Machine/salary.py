import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

salary_train = pd.read_csv("file:///D:/DATA SCIENCE/ExcelR/Assignments/Support Vector Machine/SalaryData_Train(1).csv")
salary_test = pd.read_csv("file:///D:/DATA SCIENCE/ExcelR/Assignments/Support Vector Machine/SalaryData_Test(1).csv")

salary_train.head(10)

train_x = salary_train.iloc[:,:13]
train_y = salary_train.iloc[:,13]
test_x = salary_test.iloc[:,13]
test_y = salary_test.iloc[:,13]

# Create SVM classification object 
# 'linear', 'poly', 'rbf', 'sigmoid', 'precomputed'
from sklearn.svm import SVC

model_linear = SVC(kernel = "linear")

model_linear.fit(train_x, train_y)

pred_test_linear = model_linear.predict(test_x)

np.mean(pred_test_linear==test_y)

# kernel = poly

model_poly = SVC (kernel = "poly")
model_poly.fit(train_x, train_y)

pred_test_poly = model_poly.predict(test_x)

np.mean(pred_test_poly == test_y)

# kernal = rbf

model_rbf = SVC(kernel = "rbf")

model_rbf.fit(train_x, train_y)

pred_test_rbf= model_rbf.predict(test_x)

np.mean(pred_test_rbf==test_y)






