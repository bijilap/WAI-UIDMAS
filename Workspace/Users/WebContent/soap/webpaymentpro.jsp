<%@ include file='constants.jsp' %>
<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null)
{
	session.setAttribute("errorToShowOnLoginPage","Please Log In To Continue");
	String uri = request.getRequestURI();
	session.setAttribute("redirectTo", uri);
	response.sendRedirect("indexnews.jsp");
}
%>

<html>
<head>
	<title>PayPal SDK - API Credentials</title>
	<link href="default.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
function loadAboutUs()
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
    document.getElementById("main").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li><a onclick='loadUpdate()' title=''>Update</a></li><li class='active'><a onclick='loadAboutUs()' title=''>About Us</a></li><li><a onclick='loadFaq()' title=''>FAQs</a></li>";
    }
  }
xmlhttp.open("GET","http://localhost:8080/Users/aboutUs.html",true);
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
    document.getElementById("main").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li><a onclick='loadUpdate()' title=''>Update</a></li><li><a onclick='loadAboutUs()' title=''>About Us</a></li class='active'><li class='active'><a onclick='loadFaq()' title=''>FAQs</a></li>";
    }
  }
xmlhttp.open("GET","http://localhost:8080/Users/FAQ.html",true);
xmlhttp.send();
}

function loadUpdate()
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
    document.getElementById("main").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li class='active'><a onclick='loadUpdate()' title=''>Update</a></li><li><a onclick='loadAboutUs()' title=''>About Us</a></li><li><a onclick='loadFaq()' title=''>FAQs</a></li>";
    }
  }
xmlhttp.open("GET","http://localhost:8080/Users/update.jsp",true);
xmlhttp.send();
}
</script>
</head>
<body  alink=#0000FF vlink=#0000FF>
<div id="menu">
		<ul>
			<li><a href='../myProfile.jsp'  title="">Home</a></li>
			<li class="active"><a href='webpaymentpro.jsp' style=cursor:default title="">E-Payment</a></li>			
		</ul>        
	</div>   
    <div class="logout" id="logout">
        	<a href="../logout.jsp" style=cursor:default title="">Logout</a>
        </div>  
	<div id="logo">
	  <h1><a href="#">AVATAR</a></h1>
		<h2><a onclick="loadAboutUs()" title="">by geniobrainiacs</a></h2>
	</div>
<br>
<center>
<form  action="Login.jsp"  method=post enctype="multipart/form-data" name="login">
<table width="700">
	<tr/>
	<tr>
		<td><input type="hidden" name="apiUsername" value="kseb_1333543510_biz_api1.gmail.com"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="apiPassword" value="1333543535"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="signature" value="AiywXcf2PeFcgOe3wB203MDAGny8AgHzUO29EKwelP5C3ct4IBk9mddr"></td>
	</tr>
	<tr>
			<td><input type="hidden" name="subjectEmail" value="" ></td>
	</tr>
	<tr>
			<td><input type="hidden" name="environment" value="sandbox"></td>
	</tr>
	<tr><h2>E-Payment Centre</h2></tr>
	<tr><p>Now pay your bills online, using your Avatar ID<p></tr>
	<tr>
		<td align="center">			
			<input type="submit" value="Pay Electricity Bill" name="custom">
		</td>
	</tr>
	<tr><tr>
</table>
<br><br><br><br><br><br><br><br><br>
</form>
<div id="footer">
	<p id="legal">Copyright &copy; Avatar All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</html>