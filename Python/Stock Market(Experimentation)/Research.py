from collections import Counter
from sklearn import svm, neighbors
from sklearn.ensemble import VotingClassifier, RandomForestClassifier
import numpy as np
import pandas as pd
import math

def process_data_for_labels(ticker):
    hm_days = 10
    df = pd.read_csv('Stock Market/sp500_joined_closes.csv', index_col=0)
    tickers = df.columns.values
    df.fillna(0, inplace=True)
    for i in range(1,hm_days+1):
        df['{}_{}d'.format(ticker, i)] = (df[ticker].shift(-i) - df[ticker]) / df[ticker]
    for i in df[ticker]:
        if i < 200:
            df[i]['{}_200ma'.format(ticker)] = mean(df.loc[0:i, ticker])
        else:
            df[i]['{}_200ma'.format(ticker)] = mean(df.loc[i-200:i, ticker])

    df.fillna(0, inplace=True)
    return tickers,df

def buy_sell_hold(*args):
    cols = [c for c in args]

    for col in cols:
        if col > 0.01:
            return 1
        elif col < -0.01:
            return -1
        else:
            return 0

def extract_feturesets(ticker):
    tickers, df = process_data_for_labels(ticker)

    df['{}_target'.format(ticker)] = list(map(buy_sell_hold,
                                            df['{}_1d'.format(ticker)],
                                            df['{}_2d'.format(ticker)],
                                            df['{}_3d'.format(ticker)],
                                            df['{}_4d'.format(ticker)],
                                            df['{}_5d'.format(ticker)],
                                            df['{}_6d'.format(ticker)],
                                            df['{}_7d'.format(ticker)]))
    vals = df['{}_target'.format(ticker)].values.tolist()
    str_vals = [str(i) for i in vals]
    print('Data spread', Counter(str_vals))

    df.fillna(0, inplace=True)

    df = df.replace([np.inf, -np.inf], np.nan)
    df.dropna(inplace=True)

    df_vals = df[[ticker for ticker in tickers]].pct_change()
    df_vals = df_vals.replace([np.inf, -np.inf], 0)
    df_vals.fillna(0, inplace=True)

    X = df_vals.values
    y = df['{}_target'.format(ticker)].values
    return X, y, df

def do_ml(ticker):
    X, y, df = extract_feturesets(ticker)

    X_train, X_test, y_train, y_test = cross_validation.train_test_split(X,y,test_size=0.25)

    clf = VotingClassifier([('lsvc', svm.LinearSVC()),
                            ('knn', neighbors.KNeighborsClassifier()),
                            ('rfor',RandomForestClassifier())])

    clf.fit(X_train, y_train)
    confidence = clf.score(X_test, y_test)
    print('Accuracy:', confidence)
    predictions = clf.predict(X_test)
    print('Predicted spread:', Counter(predictions))

    return confidence

do_ml('BAC')
