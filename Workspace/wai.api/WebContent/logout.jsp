<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function getFormElements(formId){
	x=document.getElementById(formId);
	strSend="";
	var i=0;
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
function loadServlet()
{	
//parameterList=getFormElements(formId);
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
xmlhttp.open("GET","verifyAjax.html",true);
xmlhttp.send();
}
</script>
</head>
<body>
<div id="main">
</div>
<form method="get" action="javascript:loadServlet()">
<input type="submit" value="Submit" id="submit" name="submit">
</form>
</body>
</html>