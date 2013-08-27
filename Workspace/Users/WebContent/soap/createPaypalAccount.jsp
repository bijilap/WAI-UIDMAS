<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.sql.*,database.*" %>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Avatar- Update Contact Details</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

</head>
<body>
<%

	connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement st = con.createStatement();
                 %>
<div id="menu">
		<ul>
			<li><a href='../myProfile.jsp'  title="">Home</a></li>
			<li class="active"><a href='webpaymentpro.jsp' style=cursor:default title="">E-Payment</a></li>			
		</ul>        
	</div>   
    <div class="logout" id="logout">
        	<a href="../logout.jsp" style=cursor:default title="">Logout</a>
        </div>  
	<div id="logo">
	  <h1><a href="#">AVATAR</a></h1>
		<h2><a onclick="loadAboutUs()" title="">by geniobrainiacs</a></h2>
	</div>
<br>
	<div id="main">
		<div id="welcome" class="post">
			<h2 class="title">Create Online Account</h2>
			<div class="story">
 <%
            String uid ="'"+session.getAttribute( "userid").toString()+"'";
			String service ="'Paypal',";
			String email ="'"+request.getParameter("email")+"',";
			String pass ="'"+request.getParameter("password")+"'";
	 		int flag=0;
            String query;
             try{
             
            	uid+=",";
                query="INSERT INTO db2admin.FINANCE(UID,SERVICE,EMAIL,PASSWORD) VALUES("+uid+service+email+pass+")";
                System.out.println(query);
                int val = st.executeUpdate(query);
                System.out.println(query);
                 %>
                
                <span class="notification n-success">Your account has been succesfuly added</span>
               
              <%
              }
              catch (SQLException s){%>
              <span class="notification n-attention">A connection to the database failed.Try later</span>
              <%
                System.out.println("Database Connection Failed!");
              }
            
         %>           
</div>
   	  </div>
</div>
<div id="footer">
	<p id="legal">Copyright &copy; 2012 All Rights Reserved. Designed by <a href="" onclick="return false">Geneobrainiacs.Inc</a>.</p>
	<p id="links"><a href="" onclick="return false">Privacy Policy</a> | <a href="" onclick="return false">Terms of Use</a></p>
</div>

<body>
</body>
</html>
