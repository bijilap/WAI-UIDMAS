'''
Created on 17-Mar-2013

@author: Bijil
'''
from string import maketrans 
import pyodbc
import mechanize
import re
import cgi


def connectToDB():
    dburl='DRIVER={IBM DB2 ODBC DRIVER};PORT=50000;DATABASE=AVATAR;UID=db2admin;PWD=uvce13'
    con=pyodbc.connect(dburl)
    cursor=con.cursor()
    return con,cursor

def get_plain_text(uid,password):
    br=mechanize.Browser()
    br.open('http://localhost:8080/Users/indexnews.jsp')
    br.select_form(nr=0) 
    br['UID']=uid
    br['password']=password 
    br.submit()
    
    html=br._mech_open('http://localhost:8080/Users/myProfile.jsp').read()
    
    scripts = re.compile(r'<script.*?>.*?</script>', re.DOTALL)
    css = re.compile(r'<style.*?>.*?</style>', re.DOTALL)
    tags = re.compile(r'<.*?>', re.DOTALL)
    text=html
    text = scripts.sub('', text)
    text = css.sub('', text)
    text = tags.sub('', text)
    text= text.lower()
    intab = "'&,"
    outtab = "   "
    trantab = maketrans(intab, outtab)
    text=text.translate(trantab)
    wordlist=text.split()
    
    return wordlist

def get_uid_list(cursor):
    query='SELECT UID, PASSWORD FROM db2admin.NOMINAL_ROLL WHERE UID NOT IN (SELECT UID FROM db2admin.UID_VISITED)'
    cursor.execute(query)
    rows=cursor.fetchall()
    return rows

def add_keywords(con,cursor,wordlist,uid):
    query="INSERT INTO db2admin.USER_INDEX (KEYWORD,UID) VALUES ('%s','%s')"
    for word in wordlist:
        print word
        cursor.execute((query%(word,uid)))
        con.commit()
    query="INSERT INTO db2admin.UID_VISITED VALUES ('%s')"
    cursor.execute((query%uid))
    con.commit()

print "Content-type: text/html \n\n";

con,cursor=connectToDB()

print '<p>Indexing has begun.</p>'

rows=get_uid_list(cursor)
for row in rows:
    wordlist=get_plain_text(row[0],row[1])
    add_keywords(con,cursor,wordlist,row[0])
cursor.close();

print '<p>Indexing is now complete.</p>'