<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("loginError.jsp");
}
%>
<%@ page import="java.sql.*,database.*,java.io.*" %>
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

</head>

<body>
<%
	      connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                  
                 %>
<	<div id="menu">
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
			<div class="content" id="profilepic" ><img src="images/tamanna194[1].jpg" width="174" height="218" alt="Profile Pic"/>
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
			<h2 class="title">Upload Image</h2>
            <div class="contact_form">

 <%
            //String profile_pic ="'"+request.getParameter("profile_pic")+"'";
            String uid =session.getAttribute( "userid").toString();          
            String saveFile=request.getParameter("datafile");
            FileInputStream fis;
            File f;
            String query;
            PreparedStatement psmt = null;
             try{
             
                query="INSERT INTO db2admin.UPDATE_FORM(UID,PHOTO) VALUES(?,?)";
                System.out.println(query);
                psmt=con.prepareStatement(query);
                psmt.setString(1, uid);
                f=new File(request.getRealPath("/")+"resource\\"+saveFile);
           	    fis = new FileInputStream(f);
         	   	psmt.setBinaryStream(2, (InputStream)fis, (int)(f.length()));
                int val = psmt.executeUpdate();
                 %>
                
                <span class="notification n-success">Your photo has been sent for confirmation.Click on home to return back.</span>
               
              <%
              }
              catch (SQLException s){%>
              <span class="notification n-attention">A connection to the database failed. Try after some time.</span>
              <%
                System.out.println("Database Connection Failed!");
              s.printStackTrace();
              }
            
         %>     
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

<body>
</body>
</html>
