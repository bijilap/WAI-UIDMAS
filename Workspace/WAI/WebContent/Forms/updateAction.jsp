<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connectToDb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
     	 <link href="default.css" rel="stylesheet" type="text/css" />
     	 <style>
#myContent
{
	margin: 50px 0 0 270px;
    width: 740px;
}
a.dashboard-module, 
a.dashboard-module:visited { 
	width: 142px; 
	height: 142px; 
	display: block; 
	float: left; 
	background: url(Resources/dashboard-module.gif) top left no-repeat; 
	margin: 0 6px 8px 0;  
	text-align: center; 
	color: #444444; 
	}
	
a.dashboard-module:hover, 
a.dashboard-module:active { 
	background-position: bottom left;
	text-decoration: none; 
	color:#0063be; 
	}

a.dashboard-module img { 
	margin-top: 20px; 
	}
	
a.dashboard-module span { 
	margin-top: 10px; 
	display: block; 
	}

</style>





</head>
<%
connectToDb Con=new connectToDb();
Connection con=connectToDb.dbconnect();

String uid=request.getParameter("uid");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String email=request.getParameter("email");

String queryString="INSERT INTO db2admin.UPDATE_FORM(UID,FNAME,MNAME,LNAME,R_ADDR,MOB_NO,EMAIL) VALUES (?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(queryString);
ps.setString(1,uid);
ps.setString(2,fname);
ps.setString(3, mname);
ps.setString(4,lname);
ps.setString(5,address);
ps.setString(6,phone);
ps.setString(7,email);
int rs=ps.executeUpdate();



%>

<body>
Updated Successfully..

</body>
</html>