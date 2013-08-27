<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<html>
<head>
    <title>Avatar</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/default.css" />
</head>
<body>

<%
      try {
    	  connectToDb Con=new connectToDb();
    	  Connection con=Con.dbconnect();		 

          //ResultSet rs = null;         
          String uid =request.getParameter("UID");
          String password =request.getParameter("password");
          String QueryString = "SELECT UID,PASSWORD FROM db2admin.NOMINAL_ROLL WHERE UID=? AND PASSWORD=?";
          PreparedStatement statement= con.prepareStatement(QueryString);
          statement.setString(1,uid);
          statement.setString(2,password);
          System.out.println(QueryString);
          ResultSet rs = statement.executeQuery();          
    	 if (rs.next()) 
    	{  		
    	  	//session.setAttribute("userid",userid);    	  
    	  	
    	  	if(rs.getString("TYPE").equals("A"))
    	  	{
    	  		session.setAttribute("uid",uid);
    	  		session.setAttribute("A",uid);
    	  		System.out.println("im in 1");
    	  		response.sendRedirect("loginSuccessAdmin.jsp");    	  		
    	  	}
    	  	else
    	  	{
    	  		session.setAttribute("uid",uid);
    	  		session.setAttribute("M",uid);
    	  		System.out.println("im in 2");
    	  		response.sendRedirect("loginSuccessModerator.jsp");
    	  	}
    	}
    	 else
    	 {
    		 //session.setAttribute("","");
    		 response.sendRedirect("loginError.jsp");    		    
    	 }    	 
    	rs.close();
    	statement.close();
    	con.close();
	}
catch (Exception ex) {
	ex.printStackTrace();
    %>
  
     <b><font size="+3" color="red">Unable to connect to database.
        <%           
            }
        %>
</font></b>

  


</body>
</html>