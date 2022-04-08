import requests
import csv
from bs4 import BeautifulSoup
import re

headers = {
    'User-Agent': 'Samuel Razumovskiy',
    'From': 'camka14@gmail.com'
    }
f=csv.reader(open('edurls.csv'))
f2 = open('edforum.txt','w', encoding = 'utf-8')

def get_urls(url):

    #open page and make it a BS4 object
    page = requests.get(url, headers = headers)
    soup = BeautifulSoup(page.text, 'html.parser')

    #decompose quotes
    quotes = soup.find_all("div", {'class':'bbcode_container'})
    for quote in quotes:
        quote.decompose()

    contents = soup.find_all("blockquote", class_ = "postcontent restore ")

    for content in contents:
        content = content.getText()

        #remove tabs in content
        content = re.sub('\t', '', content)
        content = re.sub('u\x93', '', content)
        f2.write(content)

    return soup

#changing pages and starting function
for row in f:
    for row in row:
        soup = get_urls(row)
        while True:
            try:
                next_page = soup.find('a', rel='next', href = True)
                next_page= next_page.get('href')
                soup = get_urls(next_page)
            except Exception as e:
                print(e)
                break

f.close()
f2.close()
