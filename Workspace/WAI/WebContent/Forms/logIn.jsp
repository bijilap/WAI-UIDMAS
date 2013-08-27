<%@page import="workspace.GetPath"%>
<%@page import="gdk.fileIO"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")!=null){
	response.sendRedirect("modLink.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/default.css" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>WAI</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

<script>
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
    document.getElementById("main").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href=# onclick='loadHomepage();return false;' title=''>Homepage</a></li><li><a href=# onclick='loadAboutUs();return false;' title=''>About Us</a></li><li class='active'><a href=# onclick='loadContactUs();return false;' title=''>Contact Us</a></li></ul>";    
    }
  }
xmlhttp.open("GET","contact.html",true);
xmlhttp.send();
}

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
    document.getElementById("menu").innerHTML="<ul><li><a href=# onclick='loadHomepage();return false;' title=''>Homepage</a></li><li class='active'><a href=# onclick='loadAboutUs();return false;' title=''>About Us</a></li><li><a href=# onclick='loadContactUs();return false;' title=''>Contact Us</a></li></ul>";    
    }
  }
xmlhttp.open("GET","aboutUs.html",true);
xmlhttp.send();
}

function loadHomepage()
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
    document.getElementById("menu").innerHTML="<ul><li class='active'><a href=# onclick='loadHomepage();return false;' title=''>Homepage</a></li><li><a href=# onclick='loadAboutUs();return false;' title=''>About Us</a></li><li><a href=# onclick='loadContactUs();return false;' title=''>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","homepage.html",true);
xmlhttp.send();
}

function loadForgotPassword()
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
    document.getElementById("login").innerHTML=xmlhttp.responseText;    
    }
  }
xmlhttp.open("GET","forgotPassword.jsp",true);
xmlhttp.send();
}

function loadRecoverPassword()
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
//     document.getElementById("login").innerHTML=xmlhttp.responseText;   
	  javascript:location.reload(true);
    }
  }
xmlhttp.open("GET","recoverPassword.jsp?UID="+document.getElementById("UID").value +"&emailId="+document.getElementById("emailId").value,true);
xmlhttp.send();
}
</script>
</head>
<body>
	<div id="menu">
		<ul>
			<li class="active"><a href=# onclick="loadHomepage();return false;">Homepage</a></li>
			<li><a href=# onclick="loadAboutUs();return false;">About Us</a></li>
			<li><a href=# onclick="loadContactUs();return false;">Contact Us</a></li>
		</ul>
	</div>
	<div id="logo">
		<h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<div class="content">
				<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">Officer ID:</label>
					<input id="UID" type="text" name="UID" autofocus="autofocus" />
					<label for="password">Password:</label>
					<input id="password" type="password" name="password" value="" />
					<div id=message>
					<%
					if(session.getAttribute("messageToShowInLoginPage")!=null){
						%>
						<font color="#ff0000"><b><i><%=session.getAttribute("messageToShowInLoginPage").toString() %></i></b></font>
						<%
						session.removeAttribute("messageToShowInLoginPage");
					}
					%>
					</div>
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<p><a id="forgotPassword" onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>					
					</fieldset>
				</form>
			</div>
		</div>
		<div id="updates" class="boxed">
		<%
			String content=request.getParameter("content");
			fileIO f=new fileIO();
			String fullPath=request.getRealPath("/");
			String uri = request.getRequestURI();
			GetPath getpath = new GetPath();
			String workspacePath=getpath.returnPath(fullPath,uri);
			String newspath=workspacePath+"\\news.txt";
			System.out.println(newspath);			
		%>
			<h2 class="title">Recent Updates</h2>
			<div class="content">
				<marquee behavior="scroll" direction="up" height="150px" scrolldelay="300" >
					<font color="#000843"><%out.println(f.reader(newspath)); %></font>
				</marquee>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Welcome to WAI</h2>
			<div class="story">
				<p><strong>WAI</strong> is a Unique management system developed by <strong>Bijil Abraham Philip</strong>, <strong>Sunil B N</strong>, <strong>Harsha P</strong> and <strong>Prasanna Anant Hegde</strong> currently pursuing B.E in computer science and engineering at <strong>University Visvesvaraya College of Engineering (UVCE)</strong></p>
			</div>
		</div>
		<div id="example" class="post">
			<h2 class="title">About WAI</h2>
			<div class="story">
				<p>WAI Unique ID Management and Authentication System attempts to unify the tasks of providing an unique identity and using this information to authenticate an individual. WAI provides users with a unique identity both in the real world and the world wise. It aims at enabling users to overcome the hassles of having multiple 
				identities for diferent purposes.</p>
				<p>
				Presently users have multiple identities in the real world and on the web. Do I identify myself with my Aadhar Card or PAN or my Facebook id? Who am I? This is a common problem that grapples a typical net-savvy Indian citizen today. This is the question that we aim at solving.
				</p>
				<p>
				So if you haven't already regsitered, go register for WAI today!
				</p>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<p>Copyright &copy; 2012 Criterion. All Rights Reserved. Designed by
	 <a href="#">Geniobrainiacs</a>.
	 </p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>
</body>
</html>
