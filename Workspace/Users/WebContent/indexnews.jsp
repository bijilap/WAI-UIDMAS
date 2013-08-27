<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@page import="workspace.GetPath"%>
<%@ page import="gdk.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")!=null)
{
	response.sendRedirect("myProfile.jsp");
}
%>	
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>WAI</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://j.maxmind.com/app/geoip.js"></script>

<script type="text/javascript" src="jquery/jquery.vticker.js"></script>
<script type="text/javascript"> 
$(function()
{
$('.myclass').vTicker({
	speed: 500,
	pause: 3000,
	showItems: 3,
	animation: 'fade',
	mousePause: false,
	height: 0,
	direction: 'up'
	});
});

function logLocation()
{
	var country=geoip_country_name();
	var state=geoip_region_name();
	var city=geoip_city();
	document.getElementById('location').value=(country+'&'+state+'&'+city);
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
    document.getElementById("menu").innerHTML="<ul><li><a href=''>Homepage</a></li><li class='active'><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","FAQ.html",true);
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
    document.getElementById("menu").innerHTML="<ul><li class='active'><a href=''>Homepage</a></li><li><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","homepage.html",true);
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
    document.getElementById("menu").innerHTML="<ul><li><a href=''>Homepage</a></li><li><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li class='active'><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","aboutUs.html",true);
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
    document.getElementById("login").innerHTML=xmlhttp.responseText;    
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
			<li class="active"><a href="" title="">Homepage</a></li>
			<li><a href="" onclick="loadFaq();return false;" title="">FAQs</a></li>
			<li><a href="" onclick="loadAboutUs();return false;" title="">About Us</a></li>
		</ul>
	</div>
	<div id="logo">
		<h1><a href="#">WAI</a></h1>
		<h2>by <a onclick="loadAboutUs()" title="">geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<div id="innerLogin" class="content">
				<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">UID:</label><br />
					<input id="UID" type="text" name="UID" value=""  onfocus="logLocation()" autofocus/>
					<label for="password">Password:</label>
					<input id="password" type="password" name="password" value="" />
					<input type="hidden" id="location" name="location"/>
					<div id="message">
						<%
							Object errorMsgObject;
							if((errorMsgObject=session.getAttribute("errorToShowOnLoginPage"))!=null){								
								%>
								<p><font color="#ff0000">
									<%out.println(errorMsgObject.toString()); %>
								<b></b></font></p>
								<%
								session.removeAttribute("errorToShowOnLoginPage");
							}
						%>
					</div>
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>					
					</fieldset>
				</form>
			</div>
		</div>
		<%
		
			String content=request.getParameter("content");
			fileIO f=new fileIO();
			String fullPath=request.getRealPath("/");
			String uri = request.getRequestURI();
			GetPath getpath = new GetPath();
			String workspacePath=getpath.returnPath(fullPath,uri);
			String newspath=workspacePath+"\\";
		%>
		<div id="updates" class="boxed">
			<h2 class="title">Recent Updates</h2>
			<div class="content">
				<div class="myclass">
				<ul>
				<marquee behavior="scroll" direction="up" height="100px" scrolldelay="300" >
					<font color="#000843"><%out.println(f.reader(newspath)); %></font>
				</marquee>
				</ul>
			  </div>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Welcome to WAI</h2>
			<div class="story">
				<p><strong>WAI</strong> is a Unique management system developed by <strong>Bijil.A.P</strong>, <strong> Harsha.P </strong>,<strong> Sunil.B.N </strong> and <strong> Prasanna.A.H</strong> from the prestigious college UVCE..</p>
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
	<p id="legal">Copyright &copy; WAI. All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>	
</div>
</body>
</html>
