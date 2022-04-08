import requests
import csv
from bs4 import BeautifulSoup
import re

headers = {
    'User-Agent': 'Samuel Razumovskiy',
    'From': 'camka14@gmail.com'
    }
init_url = 'https://www.pegym.com/forums/erectile-dysfunction-forum/?sort=dateline&order=asc&daysprune=-1'
f=csv.writer(open('edurls.csv', mode='w+', encoding='utf-8'))

def get_urls(url):

    #open page and make it a BS4 object
    page = requests.get(url, headers = headers)
    soup = BeautifulSoup(page.text, 'html.parser')
    stickies = ['thread_title_83457','thread_title_75629','thread_title_101572','thread_title_101573','thread_title_121190']
    url_list = []

    #removing stickies
    try:
        for sticky in stickies:
            sticky = soup.find("a", id = sticky, class_ = 'title')
            sticky.decompose()
    except:
        pass
    #collecting Urls
    new_urls = soup.find("div", id = 'content').find_all("a", class_ = 'title')

    for url in new_urls:
        url = url.get('href')
        f.writerow([url])

    return soup

#initializing function
soup= get_urls(init_url)

#changing pages
while True:
    try:
        next_page = soup.find('a', rel='next', href = True)
        next_page= next_page.get('href')
        soup = get_urls(next_page)
    except Exception as e:
        print(e)
        break

print (sum(1 for row in f))

f.close()
