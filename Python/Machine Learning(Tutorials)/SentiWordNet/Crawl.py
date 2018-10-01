import requests,re
from time import sleep
from bs4 import BeautifulSoup

def get_post_mapping(content):
    post_detail_list = []
    post_soup = BeautifulSoup(content,"lxml")
    h3_content = post_soup.find_all("h3")
    for h3 in h3_content:
        post_detail_list.append({'title':h3.a.get_text(),'url':h3.a.attrs.get('href')})
    return post_detail_list

def get_post_content(content):
    plain_text = ""
    text_soup = BeautifulSoup(content, "lxml")
    para_list = text_soup.find_all("div", {'class':'cms-richtext'})
    for p in para_list[0]:
        plain_text += p.getText()
    return plain_text


base_url = "http://www.apress.com/in/blog/all-blog-posts"
blog_suffix = "/gradient-descent-optimization/15512052"
response = requests.get(base_url+blog_suffix)

if __name__=='__main__':

    crawl_url = "http://www.apress.com/in/blog/all-blog-posts"
    post_url_prefix = "http://www.apress.com"

    response = requests.get(crawl_url)

    if response.status_code == 200:
        blog_post_details = get_post_mapping(response.content)

    if blog_post_details:
        print("Blog posts found:{}".format(len(blog_post_details)))

        for post in blog_post_details:
            print("Crawling content for post titled:",post.get('title'))
            post_response = requests.get(post_url_prefix+post.get('url'))

            if post_response.status_code == 200:
                post['content'] = get_post_content(post_response.content)

            #print("Waiting for 10 secs befor crawling next post...\n\n"
            #sleep(10)

        for post in blog_post_details:
            print(post)
