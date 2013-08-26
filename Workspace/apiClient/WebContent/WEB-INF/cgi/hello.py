from urllib import urlopen

print "Content-type: text/html \n\n";
res=urlopen('http://localhost:8080/wai.api/LoginToWaiApi?username=facebook&password=facebook')

print res