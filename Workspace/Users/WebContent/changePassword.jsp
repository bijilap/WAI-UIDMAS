<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.sql.*,database.*,java.io.*" %>
<%@page session="true"%>
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
<%
String U_ID=session.getAttribute( "userid").toString();
connectToDb Con=new connectToDb();
Connection con=connectToDb.dbconnect();
Statement statement = con.createStatement();
Blob image = null;
byte[ ] imgData = null ;
	
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Citizen's Profile</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
table
{
	
	width:100%;
	height:50px;
	text-align:left;
	
}
table
{
align:left;
}
th,tr
{
font-size:25;
width:45%;
height:45px;
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

<script>

function checkPasswrdMatch()
{
	var passwrd=document.getElementById("newPasswrd");
	var confirmPasswrd=document.getElementById("confirmPasswrd");
	if((passwrd.value)!=(confirmPasswrd.value))
		{			
			confirmPasswrd.setCustomValidity('Passwords do not match');
			return false;
		}
	else
	{
		confirmPasswrd.setCustomValidity('');
		return true;
	}
}

</script>
</head>
<body>
	<div id="menu">
		<ul>
			<li class="active"><a href='myProfile.jsp' title="">Homepage</a></li>			
			<li><a href="" onclick='loadUpdate();return false;' title="">Update</a></li>
			<li><a href="" onclick="loadFaq();return false;" title="">FAQs</a></li>
			<li><a href="" onclick="loadAboutUs();return false;" title="">About Us</a></li>
			<li style="float: right"><a href="logout.jsp">Logout</a></li>
		</ul>        
	</div>   
    <div class="logout" id="logout">
        	<a href="logout.jsp" style=cursor:default title="">Logout</a>
        </div>  
	<div id="logo">
	  <h1><a href="#">AVATAR</a></h1>
		<h2><a onclick="loadAboutUs()" title="">by geniobrainiacs</a></h2>
	</div>

<div id="content">
		<div id="main">
		<div id="welcome" class="post">
		<div class="story">
		<% 
			try{
				String QueryString = "SELECT FNAME,MNAME,LNAME,PHOTO,PASSWORD FROM DB2ADMIN.NOMINAL_ROLL , DB2ADMIN.CONTACT , DB2ADMIN.IDENTIFICATION WHERE DB2ADMIN.NOMINAL_ROLL.UID='"+U_ID+"'AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.CONTACT.UID AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.IDENTIFICATION.UID";
				System.out.println(QueryString);
				ResultSet rs1 = statement.executeQuery(QueryString);
				
				if(rs1.next())
				{
		%>
		
			<h1>Welcome					
    <% 
    if(rs1.getString("FNAME")!=null)
    	out.print(rs1.getString("FNAME")+" ");
    if(rs1.getString("MNAME")!=null)
    	out.print(rs1.getString("MNAME")+" ");
    if(rs1.getString("LNAME")!=null)
    	out.print(rs1.getString("LNAME")+" ");    
    %>
    	</h1>
			<!-- <h4>Your profile was last visited on (cookie's to b used):</h4> -->
			<br />
			
<div id="error">
	<%
		Object changePassMsgObj,chagePassSuccessObj;
		String success="false";
		if(((changePassMsgObj=session.getAttribute("passwordChangeMessage"))!=null) && (chagePassSuccessObj=session.getAttribute("passwordChangeSuccess"))!=null){
			if(chagePassSuccessObj.toString().equals("true")){
				success="#0033FF";
			}else{
				success="#FF0033";
			}
			%>
				<font color="<%=success %>" size="+2">
					<%out.print(changePassMsgObj.toString()); %>
				</font>
			<%
			session.removeAttribute("passwordChangeMessage");
			session.removeAttribute("passwordChangeSuccess");
		}
	%>
</div>
	
<table width="100%" border="0" cellpadding="6">
  <tr>
    <td><strong><em><font color="#000066" size="+2">Change Password :</font></em></strong></td>
  </tr>
</table>
<form action="changePasswordAction.jsp" method="get" id="passwordChange" autocomplete="off">

<table width="100%" border="0" cellpadding="6">
  <tr>
    <td><div align="right">
      <label><font color="#0033FF">Enter Current Password :</font></label>
    </div></td>
    <td><div align="left">
      <input name="passwrd" type="password" id="passwrd" size="30" required autofocus/>
    </div></td>
  </tr>
  <tr>
    <td><div align="right">
      <label><font color="#0033FF">Enter New Password :</font></label>
    </div></td>
    <td><div align="left">
      <input name="newPasswrd" type="password" id="newPasswrd" size="30" required oninput="checkPasswrdMatch()"/>
    </div></td>
  </tr>
    <tr>
    <td><div align="right">
      <label><font color="#0033FF">Confirm New Password :      </font></label>
    </div></td>
    <td><div align="left">
      <input name="confirmPasswrd" type="password" id="confirmPasswrd" size="30" required oninput="checkPasswrdMatch()"/>
    </div></td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  <tr>
    <td><div align="right">
      <input type="submit" name="submit" id="submit" value="Submit" />
    </div></td>
    <td><div align="left">
      <input type="reset" name="reset" id="reset" value="Reset" />
    </div></td>
  </tr>
</table>


</form>
		</div>
        </div>
		</div>
		<div id="sidebar">
			<div id="profpic">
			<!-- <div class="boxed">
				<div class="title">profile pic</div>
					<div class="content" max-height="12px" max-width="12px"> -->
			<table>
			<tr><td width="10%" height="10%">
					
		<%
			image = rs1.getBlob("PHOTO");
			imgData = image.getBytes(1,(int)image.length());
			}
			else 
				return;
			//response.setContentType("html");
			System.out.println(request.getRealPath("/"));
			OutputStream o=new FileOutputStream(request.getRealPath("/")+"photo.png");
			o.write(imgData);
			o.flush();
			o.close(); 
			  //Close the output stream
		 
		}
		catch(SQLException e)
		{
			out.println("SQL error : "+e);
		}
		catch(Exception e)
		{
			out.println("Unable to retrieve");
		}
		%>
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
				<div class="content">
						<img border="1" src="<%="photo.png" %>" alt="Profile Picture" width="160" height="200" />
				</div>
		</div>
			
			</td>
			</tr>
			</table>
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
	
    
		    
</div>

<div id="footer">
	<p id="legal">Copyright &copy; Avatar All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</html>
