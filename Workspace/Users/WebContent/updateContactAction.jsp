<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("loginError.jsp");
}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar- Update Contact Details</title>
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
                   Statement st = con.createStatement();
                 %>
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
			<div class="content" id="profilepic" >
			<img border="1" src="<%="photo.png" %>" alt="Profile Picture" width="160" height="200" />
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
			<h2 class="title">Update Name and contact Details</h2>
			<div class="story">
 <%
			 
 			String uid = session.getAttribute( "userid").toString(); 
            String fname =request.getParameter("fname");
			String mname =request.getParameter("mname");
            String lname =request.getParameter("lname");
            
            String mob_no =request.getParameter("mob_no");
            String email =request.getParameter("email");
            String p_addr =request.getParameter("p_addr");
            String r_addr =request.getParameter("r_addr");
            int flag=0;
            String query;
            FileInputStream fis;
            File f;
            String saveFile=request.getParameter("datafile");
            PreparedStatement psmt = null;
            
             try{
             
            	
                query="INSERT INTO DB2ADMIN.UPDATE_FORM (UID) VALUES (?)";
                System.out.println(uid);
                psmt=con.prepareStatement(query);
                psmt.setString(1, uid);
                int val = psmt.executeUpdate();
                
                
                
                if(fname!=null)
                {
                	fname=fname.toUpperCase();
                	 query="UPDATE db2admin.UPDATE_FORM SET FNAME=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, fname);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                	 System.out.println(query);
                }
                if(lname!=null)
                {
                	 
         			lname=lname.toUpperCase();
                	 query="UPDATE db2admin.UPDATE_FORM SET LNAME=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, lname);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(mname!=null)
                {
                	mname=mname.toUpperCase(); 
                	query="UPDATE db2admin.UPDATE_FORM SET MNAME=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, mname);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(mob_no!=null)
                {
                	 query="UPDATE db2admin.UPDATE_FORM SET MOB_NO=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, mob_no);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(email!=null)
                {
                	 query="UPDATE db2admin.UPDATE_FORM SET EMAIL=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, email);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(p_addr!=null)
                {
                	 query="UPDATE db2admin.UPDATE_FORM SET P_ADDR=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, p_addr);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(r_addr!=null)
                {
                	 query="UPDATE db2admin.UPDATE_FORM SET R_ADDR=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 psmt.setString(1, r_addr);
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                if(saveFile!=null)
                {
                	 query="UPDATE db2admin.UPDATE_FORM SET PROOF=? WHERE UID=?";
                	 psmt=con.prepareStatement(query);
                	 f=new File(request.getRealPath("/")+"resource\\"+saveFile);
                	 fis = new FileInputStream(f);
              	   	 psmt.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
                     psmt.setString(2, uid);
                     val = psmt.executeUpdate(); 	 
                }
                 %>
                
                <span class="notification n-success">Your Updates have been sent for confirmation.Click on home to return back.</span>
               
              <%
              }
              catch (SQLException s){%>
              <span class="notification n-attention">A connection to the database failed.</span>
              <%
                System.out.println("Database Connection Failed!");
              s.printStackTrace();
              }
            
         %>           
</div>
   	  </div>
</div>
</div>
<div id="footer">
	<p id="legal">Copyright &copy; 2012 All Rights Reserved. Designed by <a href="makers.html">Geneobrainiacs.Inc</a>.</p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>
</body>
</html>
