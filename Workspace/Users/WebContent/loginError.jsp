<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@ page import="gdk.*" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
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
    document.getElementById("menu").innerHTML="<ul><li><a onclick='loadHomepage()' title=''>Homepage</a></li><li class='active'><a onclick='loadFaq()' title=''>FAQ's</a></li><li><a onclick='loadAboutUs()' title=''>About Us</a></li></ul>";
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
    document.getElementById("menu").innerHTML="<ul><li  class='active'><a onclick='loadHomepage()' title=''>Homepage</a></li><li><a onclick='loadFaq()' title=''>FAQ's</a></li><li><a onclick='loadAboutUs()'title=''>About Us</a></li></ul>";
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
    document.getElementById("menu").innerHTML="<ul><li><a onclick='loadHomepage()' title=''>Homepage</a></li><li><a onclick='loadFaq()' title=''>FAQ's</a></li><li class='active'><a onclick='loadAboutUs()' title=''>About Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","aboutUs.html",true);
xmlhttp.send();
}

</script>
</head>
<body>
	<div id="menu">
		<ul>
			<li class="active"><a onclick="loadHomepage()" title="">Homepage</a></li>
			<li><a onclick="loadFaq()" title="">FAQ's</a></li>
			<li><a onclick="loadAboutUs()" title="">About Us</a></li>
		</ul>
	</div>
	<div id="logo">
		<h1><a href="#">AVATAR</a></h1>
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
					<label for="UID">User ID:</label>
					<input id="UID" type="text" name="UID" value="" />
					<label for="password">Password:</label>
					<input id="password" type="password" name="password" value="" />
					<div id=message>
					<p><font color="#ff0000"><b> Invalid Username or Password</b></font></p>
					</div>
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<p><a href="#">Forgot your password?</a></p>					
					</fieldset>
				</form>
			</div>
		</div>
		<div id="updates" class="boxed">
			<h2 class="title">Recent Updates</h2>
			<div class="content">
				<ul>
					<li>
				<div class="myclass">
				<ul>
				<% fileIO f=new fileIO();
				   out.println(f.reader("news.txt"));
				%>
				</ul>
			  </div>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Welcome to Avatar</h2>
			<div class="story">
				<p><strong>Avatar</strong> is a Unique management system developed by <strong>Bijil.A.P</strong>, <strong>Sunil.B.N</strong>, <strong>Maithreyi.G.Rao</strong>and <strong>Harsha.P</strong> from the prestigious college UVCE.. <em>Enjoy :)</em></p>
			</div>
		</div>
		<div id="example" class="post">
			<h2 class="title">About Avatar</h2>
			<div class="story">
			  
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<p id="legal">Copyright &copy; Avatar. All Rights Reserved. Designed by Geniobrainiacs.</p>	
</div>
</body>
</html>
