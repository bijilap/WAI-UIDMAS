'''
Created on 11-Apr-2013

@author: Bijil
'''

from urllib import urlopen
import json
import pyodbc
import cgi

field_list=[]

print "Content-type: text/html \n\n";

#access_token_page=urlopen('https://graph.facebook.com/oauth/access_token?client_id=316908728437442&client_secret=9bb3762428e8e4919a1fd75262f7e39d&grant_type=client_credentials').read()
access_token_page=urlopen('https://graph.facebook.com/oauth/access_token?client_id=334537263316358&client_secret=b25e7552d4c4fea7cf1aa19bcf299aad&grant_type=client_credentials').read()

access_token=access_token_page.partition('=')
#print access_token[2]

form = cgi.FieldStorage()

fbuserid=form.getvalue('q', None)
json_data=urlopen('https://graph.facebook.com/'+str(fbuserid)+'?access_token='+access_token[2]).read()
json_data=json_data.replace('\u0040','@')

data=json.loads(json_data)
#print 'https://graph.facebook.com/'+str(fbuserid)+'?access_token='+access_token[2]

location=[]

try:
    fname=data['first_name']
    field_list.append("fname="+fname)
except:
    fname=''

try:    
    mname=data['middle_name']
    field_list.append("mname="+mname)
except:
    mname=''
    
try:
    lname=data['last_name']
    field_list.append("lname="+lname)
except:
    lname=''

try:
    gender=data['gender'].upper()
    field_list.append("gender="+gender[0])
except:
    gender=''
    
try:
    dob=data['birthday']
except:
    dob=''
try:
    email=data['email']
    field_list.append("email="+email)
except:
    email=''

query=''
size=len(field_list)
if size!=0:
    query+=field_list[0]
    for i in range(1,size):
        query+='&'+field_list[i]

response=urlopen("http://localhost:8080/wai.api/VerifyCredentials?"+query).read()

if response=='YES':
    print '<p>This is a real person whose details are present in the WAI database</p>'
elif response=='NO':
    print '<p>Such a person does not exist in the WAI database</p>'
else:
    print '<p>An error occurred with the graph api</p>'

#SELECT name,birthday FROM user WHERE uid = 678098230 

#urlopen('http://localhost:8080/wai.api/LoginToWaiApi?name=facebook&password=auth123');