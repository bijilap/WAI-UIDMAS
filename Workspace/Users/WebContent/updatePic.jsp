<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="workspace.GetPath"%>
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

<%@ page import="java.sql.*,database.*" %>
<%@ page import="gdk.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar- Update Profile Picture</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.textstyle3 {	font-family:Arial;
	font-weight:normal;
	font-style:normal;
	font-size:13px;
	text-decoration:none;
	color:#000000;
}
.textstyle5 {	font-family:Arial;
	font-weight:normal;
	font-style:normal;
	font-size:13px;
	text-decoration:none;
	color:blue;
}
</style>
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' title=''>Homepage</a></li><li><a href='' onclick='loadUpdate();return false;' title=''>Update</a></li><li><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li class='active'><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li><li style='float: right'><a href='logout.jsp'>Logout</a></li></ul>";
    }
  }
xmlhttp.open("GET","aboutUs.html",true);
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' title=''>Homepage</a></li><li><a href='' onclick='loadUpdate();return false;' title=''>Update</a></li><li class='active'><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li><li style='float: right'><a href='logout.jsp'>Logout</a></li></ul>";
    }
  }
xmlhttp.open("GET","FAQ.html",true);
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' title=''>Homepage</a></li><li class='active'><a href='' onclick='loadUpdate();return false;' title=''>Update</a></li><li><a href='' onclick='loadFaq();return false;' title=''>FAQs</a></li><li><a href='' onclick='loadAboutUs();return false;' title=''>About Us</a></li><li style='float: right'><a href='logout.jsp'>Logout</a></li></ul>";
    }
  }
xmlhttp.open("GET","update.jsp",true);
xmlhttp.send();
}
</script>
</head>

<body>
<%
				   String uid = session.getAttribute( "userid").toString();
	      		   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT UID, FNAME, MNAME, LNAME FROM db2admin.NOMINAL_ROLL WHERE UID='"+uid+"'";
                   ResultSet rs = statement.executeQuery(QueryString);
   if(rs.next())
		{ %>
	<div id="menu">
		<ul>
			<li><a href='myProfile.jsp' title="">Homepage</a></li>			
			<li class="active"><a href="" onclick='loadUpdate();return false;' title="">Update</a></li>
			<li><a href="" onclick="loadFaq();return false;" title="">FAQs</a></li>
			<li><a href="" onclick="loadAboutUs();return false;" title="">About Us</a></li>
			<li style="float: right"><a href="logout.jsp">Logout</a></li>
		</ul>
	</div>
  </a></span></div>
	<div id="logo">
		<h1><a href="" onclick="return false">AVATAR</a></h1>
		<h2><a href="" onclick="return false">by geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<div class="content" id="profilepic" ><img src="photo.png" width="174" height="218" alt="Profile Pic"/>
       </div>
		</div>
		<%
		
			String content=request.getParameter("content");
			fileIO f=new fileIO();
			String fullPath=request.getRealPath("/");
			String uri = request.getRequestURI();
			GetPath getpath = new GetPath();
			String workspacePath=getpath.returnPath(fullPath,uri);
			String newspath=workspacePath+"\\news.txt";
		%>
		<div id="updates" class="boxed">
			<h2 class="title">Actions</h2>
			<div class="content">
				<div id="change">
					<a href="saveCredentials.jsp" target="_blank"><b>Save Credentials</b></a>
					<br /><br /><br />
					<a href="saveAvatarCard.jsp" target="_blank"><b>Save Avatar Card</b></a>
					<br /><br /><br />
					<a href="soap/webpaymentpro.jsp" target="_blank">E-Payment</a> 
					<br /><br /><br />
					<a href="changePassword.jsp"><b>Change Password</b></a>
				</div>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Upload Image</h2>
			<div class="story">
				<table>
					<tr>
						<td><div align="right"><strong>UID : </strong></div></td>
						<td><div align="left"><%out.println(rs.getString("UID")); %></div></td>
					</tr>
					<tr>
						<td><div align="right"><strong>Name : </strong></div></td>
						<td><div align="left">
							<%
								if(rs.getString("FNAME")!=null)
									out.println(rs.getString("FNAME")+" ");
								if(rs.getString("MNAME")!=null)
									out.println(rs.getString("MNAME")+" ");
								if(rs.getString("LNAME")!=null)
									out.println(rs.getString("LNAME")+" ");
							%>
						</div></td>
					</tr>
				</table>
			</div>
            <div class="contact_form">

<form action="updatePicAction.jsp" method="post" enctype="multipart/form-data">
<p>
Please specify a image file:<br />
<input type="file" name="datafile" size="40">
</p>
<div>
  <input type="submit" value="Upload" >
</div>
</form><br />
<p> <b> Tips to upload the pic</b></p>
<ul>
<li>1.Click on browse</li>
<li>2.Select your recent passport size photo from computer</li>
<li>3.Click on upload to confirm</li>
</ul>
</div>
<%	} 
         con.close();
        %>
<div class="clear"></div>
</div>
</div>
		</div>
		<div id="example" class="post">
		  <div class="content">
  <p>&nbsp;</p>
</div>
		</div>

<div id="footer">
	<p id="legal">Copyright &copy; 2012 All Rights Reserved. Designed by <a href="" onclick="return false">Geneobrainiacs.Inc</a>.</p>
	<p id="links"><a href="" onclick="return false">Privacy Policy</a> | <a href="" onclick="return false">Terms of Use</a></p>
</div>

</body>
</html>
