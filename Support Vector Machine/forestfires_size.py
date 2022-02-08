import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
import sklearn.svm as SVC
from sklearn.model_selection import train_test_split

forestfire = pd.read_csv("file:///D:/DATA SCIENCE/ExcelR/Assignments/Support Vector Machine/forestfires.csv")
forestfire.head(10)

forestfires = forestfire.iloc[:,2:31]

forestfires.loc[forestfires["size_category"] == "small"]=0
forestfires.loc[forestfires["size_category"] == "large"]=1

import seaborn as sns

sns.boxplot(x = "temp", y = "wind",data = forestfires, palette = "hls")

sns.pairplot(data = forestfires)

train, test = train_test_split(forestfires, test_size = 0.2)

train_x  = train.iloc[:,:28]
train_y = train.iloc[:,28]
test_x = test.iloc[:,:28]
test_y = test.iloc[:,28]

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
