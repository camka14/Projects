# Python version
print('Hello')
import sys
print('Python: {}'.format(sys.version))
# scipy
import scipy
print('scipy: {}'.format(scipy.__version__))
# numpy
import numpy
print('numpy: {}'.format(numpy.__version__))
# matplotlib
import matplotlib
print('matplotlib: {}'.format(matplotlib.__version__))
# pandas
import pandas
print('pandas: {}'.format(pandas.__version__))
# scikit-learn
import sklearn
print('sklearn: {}'.format(sklearn.__version__))

# Load CSV using Pandas from URL
import pandas
url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv"
names = ['preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class']
data = pandas.read_csv(url, names=names, header=None)

# Data Helper Functions
print("Shape:\n", data.shape, "\n")
description = data.describe()
print("Description:\n" , description, "\n")
header = data.head()
print("Header:\n", header, "\n")
dataTypes = data.dtypes
print("Data Types:\n", dataTypes, "\n")
correlation = data.corr()
print("Correlation:\n", correlation, "\n")


# Plotting Helper Functions
# from pandas.plotting import scatter_matrix
# scatter_matrix(data)
# data.hist()
# data.plot(kind='box')

# Standardizing Data
from sklearn.preprocessing import StandardScaler,Normalizer
array = data.values
# separate array into input and output components
X = array[:,0:8]
Y = array[:,8]
scaler = StandardScaler().fit(X)
rescaledX = scaler.transform(X)
# summarize transformed data
numpy.set_printoptions(precision=3)
print("Mean = 0, STD = 1:\n", rescaledX[0:5,:], "\n")
normalizedX = Normalizer().fit_transform(X)
print("Range = 0-1:\n", normalizedX[0:5,:], "\n")

# Evaluate using Cross Validation
# from pandas import read_csv
from sklearn.model_selection import KFold
from sklearn.model_selection import cross_val_score, LeaveOneOut
from sklearn.linear_model import LogisticRegression
kfold = KFold(n_splits=10, random_state=7)
model = LogisticRegression(solver='liblinear')
CVSresults = cross_val_score(model, X, Y, cv=kfold)
print("Accuracy: %.3f%% (%.3f%%)\n" % (CVSresults.mean()*100.0, CVSresults.std()*100.0))

from sklearn.linear_model import LogisticRegression
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
models = []
models.append(('LR', LogisticRegression(solver='liblinear')))
models.append(('LDA', LinearDiscriminantAnalysis()))
# evaluate each model in turn
results = []
names = []
scoring = 'accuracy'
for name, model in models:
    kfold = KFold(n_splits=10, random_state=7)
    cv_results = cross_val_score(model, X, Y, cv=kfold, scoring=scoring)
    results.append(cv_results)
    names.append(name)
    msg = "%s: %f (%f)" % (name, cv_results.mean(), cv_results.std())
    print(msg)