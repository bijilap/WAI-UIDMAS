'''
Created on Mar 4, 2013
 
@author: bphilip
'''
#Finishing the page ranking algorithm.
 
import re
from urllib import urlopen
 
def compute_ranks(graph):
    d = 0.8 # damping factor
    numloops = 10
   
    ranks = {}
    npages = len(graph)
    for page in graph:
        ranks[page] = 1.0 / npages
   
    for i in range(0, numloops):
        newranks = {}
        for page in graph:
            newrank = (1 - d) / npages
           
            for node in graph:
                if page in graph[node]:
                    newrank+=d*(ranks[node]/len(graph[node]))
           
            newranks[page] = newrank
        ranks = newranks
    return ranks
 

 
def crawl_web(seed): 
    tocrawl = [seed]
    crawled = []
    graph = {}  
    index = {}
    while tocrawl:
        page = tocrawl.pop()
        if page not in crawled:
            raw_content=get_page(page)
            content = cleanhtmltags(raw_content)
            add_page_to_index(index, page, content)
            outlinks = get_all_links(raw_content)
           
            
            graph[page] = outlinks
           
            
            union(tocrawl, outlinks)
            crawled.append(page)
    return index, graph
 
 
def get_page(url):
    print url
    try:
        return urlopen(url).read()
    except:
        return ""
    return ""
   
def get_next_target(page):
    start_link = page.find('<a href=')
    if start_link == -1:
        return None, 0
    start_quote = page.find('"', start_link)
    end_quote = page.find('"', start_quote + 1)
    url = page[start_quote + 1:end_quote]
    return url, end_quote
 
def get_all_links(page):
    links = []
    while True:
        url, endpos = get_next_target(page)
        if url:
            links.append(url)
            page = page[endpos:]
        else:
            break
    return links
 
def cleanhtmltags(raw_html):
    scripts = re.compile(r'<script.*?>.*?</script>', re.DOTALL)
    css = re.compile(r'<style.*?>.*?</style>', re.DOTALL)
    tags = re.compile(r'<.*?>', re.DOTALL)
    text=raw_html
    text = scripts.sub('', text)
    text = css.sub('', text)
    text = tags.sub('', text)
 
    return text
 
 
def union(a, b):
    for e in b:
        if e not in a:
            a.append(e)
 
def add_page_to_index(index, url, content):
    words = content.split()
    for word in words:
        add_to_index(index, word, url)
       
def add_to_index(index, keyword, url):
    if keyword in index:
        index[keyword].append(url)
    else:
        index[keyword] = [url]
 
def lookup(index, keyword):
    if keyword in index:
        return index[keyword]
    else:
        return None
 
#index, graph = crawl_web('http://udacity.com/cs101x/urank/index.html')
index, graph = crawl_web('http://visionuvce.in/')
ranks = compute_ranks(graph)
print index
print ''
 
print ranks
  
 
