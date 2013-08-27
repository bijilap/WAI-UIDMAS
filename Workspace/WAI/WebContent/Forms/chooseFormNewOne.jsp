<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	String uri = request.getRequestURI();
	session.setAttribute("redirectTo", uri);
	response.sendRedirect("logIn.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="forms.*;" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi?key=INSERT-YOUR-KEY">
</script>
<style>
#myContent
{
	margin: 50px 0 0 270px;
    width: 740px;
}
a.dashboard-module, 
a.dashboard-module:visited { 
	width: 142px; 
	height: 142px; 
	display: block; 
	float: left; 
	background: url(Resources/dashboard-module.gif) top left no-repeat; 
	margin: 0 6px 8px 0;  
	text-align: center; 
	color: #444444; 
	}
	
a.dashboard-module:hover, 
a.dashboard-module:active { 
	background-position: bottom left;
	text-decoration: none; 
	color:#0063be; 
	}

a.dashboard-module img { 
	margin-top: 20px; 
	}
	
a.dashboard-module span { 
	margin-top: 10px; 
	display: block; 
	}
</style>
<script type="text/javascript">
function loadForm()
{
	window.location = "form_localLangSupport.jsp?lang="+document.getElementById("language").value
}

</script>

<script type="text/javascript">
function loadHelp()
{
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
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='chooseFormNewOne.jsp'>Local Lang Form</a></li><li class='active'><a href=# onclick='loadHelp();return false;'>Help</a></li><li><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","usrMan.jsp",true);
xmlhttp.send();
}

function loadContactUs()
{
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
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='chooseFormNewOne.jsp'>Local Lang Form</a></li><li><a href=# onclick='loadHelp();return false;'>Help</a></li><li><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li class='active'><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","contact.html",true);
xmlhttp.send();
}

function loadFaq()
{
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
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='chooseFormNewOne.jsp'>Local Lang Form</a></li><li><a href=# onclick='loadHelp();return false;'>Help</a></li><li class='active'><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","FAQ.html",true);
xmlhttp.send();
}
</script>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@page contentType="text/html;charset=UTF-8"%>
<title>WAI</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body >
<div id="menu">	
	<ul>
		<li><a href="modLink.jsp">Homepage</a></li>
		<li class="active"><a href="chooseFormNewOne.jsp">Local Lang Form</a></li>
		<li><a href=# onclick="loadHelp();return false;">Help</a></li>
		<li><a href=# onclick="loadFaq();return false;">FAQs</a></li>
		<li><a href=# onclick="loadContactUs();return false;">Contact Us</a></li>
		<li style="float: right"><a href="logout.jsp">Logout</a></li>
	</ul>
</div>
<div id="myContent" style="min-height: 400px;height: auto !important;height: 400px">
<div id="logo">
  <h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
</div>
   <div align="middle">
    <strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI Registration Form</font></strong>
   </div>
  <div align="middle"> 
    <h3>Choose your mother tongue</h3> 
  </div>
  <br/>
  <div align="middle"> 
   		<select name="language" class="footer" id="language" onchange="loadForm()">
   		  <option selected="selected">Choose ...</option>
   		  <option value=1>Kannada</option>
   		  <option value=2>Hindi</option>
   		  <option value=3>Bengali</option>
   		  <option value=4>Telugu</option>
   		  <option value=5>Tamil</option>
	    </select>
  </div>
</div>
<div id="footer">
	<p id="legal">Copyright &copy; 2012 Criterion. All Rights Reserved. Designed by <a href=# onclick="loadContactUs();return false;">Geniobrainiacs</a>.</p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>


</body>
</html>
