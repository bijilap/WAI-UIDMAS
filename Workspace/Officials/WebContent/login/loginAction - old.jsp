<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<html>
<head>
    <title>WAI</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/default.css" />
</head>
<body>

<%
      try {
          
    	  connectToDb Con=new connectToDb();
    	  Connection con=Con.dbconnect();

          //ResultSet rs = null;
          int flag;
          String userid =request.getParameter("USERID");
          String password =request.getParameter("password");
          String QueryString = "SELECT USERID,PASSWORD,TYPE,E_ID FROM db2admin.OFFICIALS WHERE USERID=? AND PASSWORD=?";
          PreparedStatement statement= con.prepareStatement(QueryString);
          statement.setString(1,userid);
          statement.setString(2,password);
          ResultSet rs = statement.executeQuery();          
    	 if (rs.next()) 
    	{  		
    		 //session.setMaxInactiveInterval(24 * 60 * 60);
    	  	//session.setAttribute("userid",userid);    	  
    	  	
    	  	if(rs.getString("TYPE").equals("A"))
    	  	{
    	  		session.setAttribute("userid",userid);
    	  		session.setAttribute("eid",rs.getString("E_ID"));
    	  		response.sendRedirect("../Admin/adminProfile.jsp");    	  		
    	  	}
    	  	else if(rs.getString("TYPE").equals("M"))
    	  	{
    	  		session.setAttribute("userid",userid);
    	  		session.setAttribute("eid",rs.getString("E_ID"));
    	  		response.sendRedirect("../Moderator/moderatorProfile.jsp");
    	  	}
    	  	else
       	 	{
       		 //session.setAttribute("","");
       		 response.sendRedirect("loginError.jsp");    		    
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
    %>
  
     <b><font size="+3" color="red">Unable to connect to database.
        <%           
            }
        %>
</font></b>

  


</body>
</html>