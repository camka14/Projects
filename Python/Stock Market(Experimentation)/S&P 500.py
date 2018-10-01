import bs4 as bs
import datetime as dt
import matplotlib.pyplot as plt
import numpy as np
from matplotlib import style
import os
import pandas as pd
import quandl as web
import pickle
import requests

style.use('ggplot')

web.ApiConfig.api_key =  'WXxrbJaM6BNGu3oW45rW'

def save_sp500_tickers():
    resp = requests.get('http://en.wikipedia.org/wiki/List_of_S%26P_500_companies')
    soup = bs.BeautifulSoup(resp.text, 'lxml')
    table = soup.find('table', {'class': 'wikitable sortable'})
    tickers = []
    for row in table.findAll('tr')[1:]:
        ticker = row.findAll('td')[0].text
        tickers.append(ticker)

    return tickers

def get_data_from_wiki(reload_sp500=False):
    if reload_sp500:
        tickers = save_sp500_tickers()
    else:
        with open("Stock Market/sp500tickers.pickle","rb") as f:
            tickers = pickle.load(f)

    if not os.path.exists('Stock Market/stock_dfs'):
        os.makedirs('Stock Market/stock_dfs')

    start = dt.datetime(2000,1,1)
    end = dt.datetime(2018,9,4)

    for ticker in tickers:
        print('WIKI/{}'.format(ticker))
        if reload_sp500 or not os.path.exists('Stock Market/stock_dfs/{}.csv'.format(ticker)):
            try:
                df = web.get('WIKI/{}'.format(ticker), start_date = start, end_date = end)
                df.to_csv('Stock Market/stock_dfs/{}.csv'.format(ticker))
            except:
                tickers.remove(ticker)
        else:
            print('Already have {}'.format(ticker))

        with open("Stock Market/sp500tickers.pickle","wb") as f:
            pickle.dump(tickers,f)

get_data_from_wiki(reload_sp500=True)

def compile_data():
    with open("Stock Market/sp500tickers.pickle", "rb") as f:
        tickers = pickle.load(f)

    main_df = pd.DataFrame()

    for count, ticker in enumerate(tickers):
        if os.path.exists('Stock Market/stock_dfs/{}.csv'.format(ticker)):
            df = pd.read_csv('Stock Market/stock_dfs/{}.csv'.format(ticker))
            df.set_index('Date', inplace=True)

            df.rename(columns = {'Adj. Close': ticker}, inplace=True)
            df.drop(['Open','High','Low','Close','Volume','Ex-Dividend','Split Ratio','Adj. Open','Adj. High','Adj. Low','Adj. Volume'], 1, inplace=True)

            if main_df.empty:
                main_df = df
            else:
                main_df = main_df.join(df, how='outer')

            if count%10 == 0:
                print(count)

    main_df.to_csv('Stock Market/sp500_joined_closes.csv')

compile_data()

def visualize_data():
    df = pd.read_csv('Stock Market/sp500_joined_closes.csv')
    df_corr = df.corr()

    data = df_corr.values
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)

    heatmap = ax.pcolor(data, cmap=plt.cm.RdYlGn)
    fig.colorbar(heatmap)
    ax.set_xticks(np.arange(data.shape[0]) + 0.5, minor=False)
    ax.set_yticks(np.arange(data.shape[1]) + 0.5, minor=False)
    ax.invert_yaxis()
    ax.xaxis.tick_top()

    column_labels = df_corr.columns
    row_labels = df_corr.index

    ax.set_xticklabels(column_labels)
    ax.set_yticklabels(row_labels)
    plt.xticks(rotation=90)
    heatmap.set_clim(-1,1)
    plt.tight_layout()
    plt.show()
