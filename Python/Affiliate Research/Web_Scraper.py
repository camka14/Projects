import requests
import csv
from bs4 import BeautifulSoup
import re
import unicodedata

headers = {
    'User-Agent': 'Samuel Razumovskiy',
    'From': 'camka14@gmail.com'
    }
sites = ['https://www.wpbeginner.com/guides/','https://fitsmallbusiness.com/small-business-website/','https://colorlib.com/wp/how-to-make-a-website/',
        'https://www.smashingmagazine.com/2016/02/beginners-guide-creating-wordpress-website/','https://business.tutsplus.com/articles/design-your-wordpress-website--cms-29552',
        'https://www.taniarascia.com/developing-a-wordpress-theme-from-scratch/']

f = open('web scrape.txt', 'w', encoding='utf-8')

def get_urls(url):

    #open page and make it a BS4 object
    page = requests.get(url, headers = headers)
    soup = BeautifulSoup(page.text, 'html.parser')

    if url==sites[0]:
        contents = soup.find("div", class_="entry-content").find_all("p")
    elif url==sites[1]:
        contents = soup.find("div", class_="entry-content clearfix").find_all("p")
    elif url==sites[2]:
        contents = soup.find("div", class_="single-blog-content entry clr").find_all("p")
    elif url==sites[3]:
        contents = soup.find("div", class_="c-garfield-the-cat").find_all("p")
    elif url==sites[4]:
        contents = soup.find("div", class_="post-body__content").find_all("p")
    else:
        contents = soup.find("section", class_ = "single-body").find_all("p")

    for content in contents:
        content = content.getText()
        content = " ".join(content.split())
        content = unicodedata.normalize('NFKD', content).encode('ascii', 'ignore').decode('utf-8', 'ignore')

        f.write(content)

    return

#changing pages and starting function
for site in sites:
    print(site)
    get_urls(site)

f.close()
