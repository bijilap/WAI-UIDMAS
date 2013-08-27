<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*,database.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar- User Profile</title>
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
	      String state = request.getParameter("uid").toString();
	      connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT UID, FNAME, MNAME, LNAME,EMAIL,P_ADDR,R_ADDR MOB_NO, P_ADDR, R_ADDR FROM AVATAR.USER WHERE UID='"+uid+"';
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>
<option value="-1"> </option>
<%	   if(rs.next())
		{ %>
	<div id="menu">
		<ul>
			<li ><a href="index.html" title="">Home</a></li>
			
			<li class="active"><a href="contact.html" title="">Profile</a></li>
			<li><a href="faqs.html" title="">FAQs</a></li>
		</ul>
	</div>
    <div class="logout"><span class="textstyle1"><a href="index.html"><strong>Logout</strong><br />
  </a></span></div>
	<div id="logo">
		<h1><a href="home.html">AVATAR</a></h1>
		<h2><a href="makers.html">by geniobrainiacs</a></h2>
	</div>
<div id="content">
	<div id="sidebar">
		<div id="login" class="boxed">
			<h2 class="title">User Account</h2>
			<div class="content" id="profilepic" ><img src="<%=rs.getString("profile pic") %>" width="174" height="218" alt="Profile Pic"/>
            <a href="updatepic.html" >Update Profile Picture</a>
             </div>
		</div>
		<div id="updates" class="boxed">
			<h2 class="title">Recent Updates</h2>
			<div class="content">
				<ul>
					<li>
						<h3>Some date</h3>
						<p><a href="#">We started Avatar Project</a></p>
					</li>
					<li>
						<h3>Some date</h3>
						<p><a href="#">We took months to find team members.. </a></p>
					</li>
					<li>
						<h3>Some date</h3>
						<p><a href="#">Finally Harsha, Bijil, Maithreyi, Sunil are part of team.</a></p>
					</li>
					<li>
						<h3>Some date</h3>
						<p><a href="#">Finally after long struggle SRS submitted.</a></p>
					</li>
					<li>
						<h3>Some date</h3>
						<p><a href="#">Harsha gave some usefull/useless thing for first time.</a></p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Profile details</h2>
			<div class="story">
            	<div id=uid value="<%=rs.getString("UID")%>"></div>
			  <div id=name value="<%=rs.getString("FNAME")%>"+value="<%=rs.getString("MNAME")%>"+value="<%=rs.getString("LNAME")%>"></div>
              <div id=p_address value="<%=rs.getString("P_ADDR")%>" ><br/></div>
              <div id=r_address value="<%=rs.getString("R_ADDR")%>" ><br/> </div>
              <div id=mob_no value="MOB: "+"<%=rs.getString("MOB_NO")%>"></div>
              <div id=Email value="<%=rs.getString("EMAIL")%>"></div>
               <a href="updatecontact.html" ><b>Edit name and contact details</b></a>
			</div>
			  <div class="clear"></div>
</div>
</div>
		</div>
		<div id="example" class="post">
		  <div class="content">
  <p>&nbsp;</p>
</div>
		</div>
	</div>
</div>
<div id="footer">
	<p id="legal">Copyright &copy; 2012 All Rights Reserved. Designed by <a href="makers.html">Geneobrainiacs.Inc</a>.</p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>
<%	} 
         con.close();
        %>
<body>
</body>
</html>
