<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*,database.*" %>
<%@ page import="gdk.*" %>

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

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar- Update Contact Details</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
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

</head>
<body>
<%
				  
	               String uid = session.getAttribute( "userid").toString();
	      		   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT db2admin.NOMINAL_ROLL.UID, FNAME, MNAME, LNAME,EMAIL,PHONE,db2admin.NOMINAL_ROLL.ADDRESS AS P_ADDR,db2admin.CONTACT.ADDRESS AS R_ADDR FROM db2admin.NOMINAL_ROLL, db2admin.CONTACT WHERE db2admin.NOMINAL_ROLL.UID=db2admin.CONTACT.UID AND db2admin.NOMINAL_ROLL.UID='"+uid+"'";
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>

<%	   if(rs.next())
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
	<div id="logo">
		<h1><a href="" onclick="return false">AVATAR</a></h1>
		<h2><a href="" onclick="return false">by geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<div class="content" id="profilepic">
			<img border="1" src="<%="photo.png" %>" alt="Profile Picture" width="160" height="200" />
             </div>
		</div>
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
			<h2 class="title">Update Name and contact Details</h2>

			<div class="story">
  	<div id=uid name="uid" value="<%=rs.getString("UID")%>"></div>
            	<div class="form_row">
<form action="updateContactAction.jsp"  method="post">
<label class="contact">
<strong>First Name:</strong>
</label>
<input class="contact_input" type="text" name="fname" placeholder="<%=rs.getString("FNAME")%>">
</div>
     	<div class="form_row">
<label class="contact">
<strong>Mid Name:</strong>
</label>
<input class="contact_input" type="text"  name="mname" placeholder="<%=rs.getString("MNAME")%>">
</div>
     	<div class="form_row">
<label class="contact">
<strong>Last Name:</strong>
</label>
<input class="contact_input" type="text" name="lname" placeholder="<%=rs.getString("LNAME")%>">
</div>
<div class="form_row">
<label class="contact">
<strong>Email:</strong>
</label>
<input class="contact_input" type="email" name="email" placeholder="<%=rs.getString("EMAIL")%>">
</div>
<div class="form_row">
<label class="contact">
<strong>Phone:</strong>
</label>
<input class="contact_input" type="number" name="mob_no" placeholder="<%=rs.getString("PHONE")%>">
</div>
<div class="form_row">
<label class="contact">
<strong>Permanent Address:</strong>
</label>
<br />
<textarea name="textarea" class="contact_textarea" name="p_addr" placeholder="<%=rs.getString("P_ADDR")%>"></textarea>
<br />
<br />
</div>
<div class="form_row">
<label class="contact">
<strong>Residential Address:</strong>
</label>
<textarea class="contact_textarea" name="r_addr" placeholder="<%=rs.getString("R_ADDR")%>"></textarea>
</div>
<div class="form_row">

<p>
Please upload supporting document:<br>
<input type="file" name="datafile" size="40">
</p>
</div>
<div class="form_row">
<input type="submit" name="submit" id="submit" value="Submit"/>
</form>
</div>
		</div>
      Note: Leave the fields as they are which you don't want to update!!
      <br/><br/>
	</div>
</div>
</div>
<%	} 
         con.close();
        %>
<div id="footer">
	<p id="legal">Copyright &copy; 2012 All Rights Reserved. Designed by <a href="" onclick="return false">Geneobrainiacs.Inc</a>.</p>
	<p id="links"><a href="" onclick="return false">Privacy Policy</a> | <a href="" onclick="return false">Terms of Use</a></p>
</div>


</body>
</html>
