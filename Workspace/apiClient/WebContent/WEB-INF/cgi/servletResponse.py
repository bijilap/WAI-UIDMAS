import httplib, urllib
print "Content-type: text/html \n\n";
params = urllib.urlencode({'username': 'facebook', 'password': 'facebook'})
headers = {"Content-type": "application/x-www-form-urlencoded",
            "Accept": "text/plain"}
conn = httplib. HTTPConnection("localhost",8080)
conn.request("POST", "/wai.api/LoginToWaiApi", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()

#conn.request("GET", "/wai.api/VerifyCredentials?fname=bijil", headers)
response = urllib.urlopen("http://localhost:8080/wai.api/VerifyCredentials?fname=bijil&gender=m")
print str(response.read())

conn.close()