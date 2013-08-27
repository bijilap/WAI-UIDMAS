<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*,database.*" %>
<%@ page import="gdk.*" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>WAI- Update Contact Details</title>
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

</head>
<body>
<%
				  
	              
	      		   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   
                   String uid=request.getParameter("uid");
                   System.out.println(" "+uid);
                   Statement statement=con.createStatement();
                   String QueryString = "SELECT UID, FNAME, MNAME, LNAME,ADDRESS FROM db2admin.NOMINAL_ROLL WHERE UID=?";
                   PreparedStatement ps=con.prepareStatement(QueryString);
                   ps.setString(1,uid);
                   ResultSet rs = ps.executeQuery();
                   
                   if(rs.next())
                   {
                	 
                	  %>
	<div id="menu">
		<ul>
			<li><a href='homepage.html' style=cursor:default title="">Homepage</a></li>			
			<li><a onclick="FAQ.html" title="">FAQs</a></li>
			<li><a onclick="aboutUs.html" title="">About Us</a></li>
		</ul>
	</div>
    <div class="logout" id="logout">
        	<a href="logout.jsp" style=cursor:default title="">Logout</a>
        </div> 
	<div id="logo">
		<h1><a href="home.html">WAI</a></h1>
		<h2><a href="makers.html">by geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<h2>UID : <%=rs.getString("UID") %></h2>
			
			<div class="content" id="profilepic">
			<img border="1" src="<%="photo.png" %>" alt="Profile Picture" width="160" height="200" />
             </div>
		</div>
		
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Update Name and contact Details</h2>
			

			<div class="story">
  	<div id=uid name="uid" value="<%="uid"%>"></div>
            	<div class="form_row">
<form action="updateAction.jsp"  method="post">
<label class="contact">
<strong>First Name:</strong>
</label>
<input class="contact_input" type="text" name="fnameold" value="<%=rs.getString("FNAME")%>">
<input type="text" name="fname" ></input>
</div>
<input type="hidden" value="<%=rs.getString("UID") %>" name="uid"> </input>
     	<div class="form_row">
<label class="contact">
<strong>Mid Name:</strong>
</label>
<input class="contact_input" type="text"  name="mnameold" value="<%=rs.getString("MNAME")%>">
<input type="text" name="mname" ></input>
</div>
     	<div class="form_row">
<label class="contact">
<strong>Last Name:</strong>
</label>
<input class="contact_input" type="text" name="lnameold" value="<%=rs.getString("LNAME")%>">
<input type="text" name="lname" ></input>
</div>

<div class="form_row">
<label class="contact">
<strong>Permanent Address:</strong>
</label>
<br />
<textarea name="textarea" class="contact_textarea" name="p_addr" ><%=rs.getString("ADDRESS")%></textarea>
<input type="text" name="address"/>
<br />
<br />

</div>
<%} %>
<%

//System.out.println(" From contact.."+uid);
Statement statement_c=con.createStatement();
String QueryString1 ="SELECT UID,PHONE,EMAIL FROM db2admin.CONTACT WHERE UID=?";
PreparedStatement ps1=con.prepareStatement(QueryString1);
ps1.setString(1,uid);
ResultSet rs1 = ps1.executeQuery();


if(rs1.next())
{
	
%>
<div class="form_row">
<label class="contact">
<strong>Phone Number:</strong>
</label>
<input class="contact_input" type="text" name="phoneold" value="<%=rs1.getString("PHONE")%>">
<input type="text" name="phone" ></input>
</div>

<div class="form_row">
<label class="contact">
<strong>Email:</strong>
</label>
<input class="contact_input" type="text" name="emailold" value="<%=rs1.getString("EMAIL")%>">
<input type="text" name="email" ></input>
</div>


Please upload supporting document:<br>
<input type="file" name="datafile" size="40">
</p>
</div>
<div class="form_row">
<input type="submit" name="submit" id="submit" value="Submit"/>
</form>
<%} %>
</div>
		</div>
      <br/> Note: Leave the fields as they are which you don't want to update!!
	</div>
</div>
</div>
</body>
</html>
