<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.sql.*,database.*,java.io.*" %>
<%@page session="true"%>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("loginError.jsp");
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li><a onclick='loadUpdate()' title=''>Update</a></li><li class='active'><a onclick='loadAboutUs()' title=''>About Us</a></li><li><a onclick='loadFaq()' title=''>FAQs</a></li>";
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li><a onclick='loadUpdate()' title=''>Update</a></li><li><a onclick='loadAboutUs()' title=''>About Us</a></li class='active'><li class='active'><a onclick='loadFaq()' title=''>FAQs</a></li>";
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
    document.getElementById("menu").innerHTML="<ul><li><a href='myProfile.jsp' style=cursor:default title=''>Homepage</a></li><li class='active'><a onclick='loadUpdate()' title=''>Update</a></li><li><a onclick='loadAboutUs()' title=''>About Us</a></li><li><a onclick='loadFaq()' title=''>FAQs</a></li>";
    }
  }
xmlhttp.open("GET","update.jsp",true);
xmlhttp.send();
}

function loadHistory()
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
    document.getElementById("offarea").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","loginHistory.jsp",true);
xmlhttp.send();
}

</script>
</head>
<body>
	<div id="menu">
		<ul>
			<li class="active"><a href='myProfile.jsp' style=cursor:default title="">Homepage</a></li>			
			<li><a onclick='loadUpdate()' title="">Update</a></li>
			<li><a onclick="loadFaq()" title="">FAQs</a></li>
			<li><a onclick="loadAboutUs()" title="">About Us</a></li>
				
		</ul>        
	</div>   
    <div class="logout" id="logout">
        	<a href="logout.jsp" style=cursor:default title="">Logout</a>
        </div>  
	<div id="logo">
	  <h1><a href="#">WAI</a></h1>
		<h2><a onclick="loadAboutUs()" title="">by geniobrainiacs</a></h2>
	</div>

<div id="content">
		<div id="main">
		<div id="welcome" class="post">
		<div class="story" id="offarea">
		<% 
			try{
				String QueryString = "SELECT * FROM DB2ADMIN.NOMINAL_ROLL , DB2ADMIN.CONTACT , DB2ADMIN.IDENTIFICATION WHERE DB2ADMIN.NOMINAL_ROLL.UID='"+U_ID+"'AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.CONTACT.UID AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.IDENTIFICATION.UID";
				System.out.println(QueryString);
				ResultSet rs1 = statement.executeQuery(QueryString);
				
				if(rs1.next())
				{
		%>
		
			<h2>Welcome					
    <% 
    if(rs1.getString("FNAME")!=null)
    	out.print(rs1.getString("FNAME")+" ");
    if(rs1.getString("MNAME")!=null)
    	out.print(rs1.getString("MNAME")+" ");
    if(rs1.getString("LNAME")!=null)
    	out.print(rs1.getString("LNAME")+" ");
    %>
    	</h2>
			<!-- <h4>Your profile was last visited on (cookie's to b used):</h4> -->
			<br />

		
<table align="left">
		<TR>
		<TH>Name</TH>
		<TD><%=rs1.getString("FNAME")%>  <%=rs1.getString("MNAME")%>  <%=rs1.getString("LNAME")%></TD>
		</tr>
		<TR>
		<TH>Date of Birth</TH>
		<TD><%=rs1.getString("DOB")%></TD>
		</tr>
		<TR>
		<TH>Age</TH>
		<TD><%=rs1.getInt("AGE")%></TD>
		</tr>
		<TR>
		<TH>Gender</TH>
		<TD><%=rs1.getString("GENDER")%></TD>
		</tr>
		<TR>
		<TH>Guardian</TH>
		<TD><%=rs1.getString("GUARDIAN")%></TD>
		</tr>
		<TR>
		<TH>Address</TH>
		<TD><%=rs1.getString("ADDRESS")%></TD>
		</tr>
		<TH>Mobile Number</TH>
		<TD><%=rs1.getString("PHONE")%></TD>
		</tr>
		<TR>
		<TH>e-mail Address</TH>
		<TD><%=rs1.getString("EMAIL")%></TD>
		</tr>
		<TR>
		</table>		
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
								<a href="" target="_blank" onclick="loadHistory(); return false;"><b>Login History</b></a>
								<br /><br /><br />
								<a href="saveAvatarCard.jsp" target="_blank"><b>Save WAI Card</b></a>
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
	<p id="legal">Copyright &copy; WAI All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</html>
