<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify ME</title>
<script type="text/javascript">
function getFormElements(formId){
	x=document.getElementById(formId);
	strSend="";
	for(i=0;i<x.length;i++){
		if(i!=(x.length)-1){
			strSend=strSend+x.elements[i].name+"="+x.elements[i].value+"&";
		}
		else{
			strSend=strSend+x.elements[i].name+"="+x.elements[i].value;
		}
	}
	if(strSend!=""){
		strSend="?"+strSend;
	}
	return strSend;
}
</script>

<script type="text/javascript">
function loadServlet(formId,to)
{
parameterList=getFormElements(formId);
alert(parameterList);
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("main").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("POST",to+parameterList,true);
xmlhttp.setRequestHeader("Content-type", "multipart/form-data");
xmlhttp.send();
}
</script>
<script type="text/javascript">
function login(){
	document.getElementById("myFrame").style.visibility="visible";
	document.getElementById("myFrame").style.width="700px";
	document.getElementById("myFrame").style.height="50px";
}
</script>
<script type="text/javascript">
function login(){
	document.getElementById("myFrame").style.visibility="visible";
	document.getElementById("myFrame").style.width="700px";
	document.getElementById("myFrame").style.height="50px";
}
</script>
</head>
<body>
<iframe id="myFrame" name="myFrame" style="visibility: hidden;width: 0px;height: 0px;border: none;" scrolling="no"></iframe>
<form action="VerifyPerson" method="post" enctype="multipart/form-data" id="verifyForm" target="myFrame">
UID: <input type="text" name="UID" id="UID" />
<br/>
Hand: <input type="text" name="hand" id="hand">
<br/>
Finger: <input type="text" name="finger" id="finger">
<br/>
Image: <input type="file" name="image" id="image">
<br/>
<input type="submit" name="submit" id="submit" value="Submit" onClick="login()">
</form>
</body>
</html>