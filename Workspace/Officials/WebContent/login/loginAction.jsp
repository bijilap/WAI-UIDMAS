<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@ page import="java.security.MessageDigest" %>
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
          String checksum="";
          
          String QueryString = "SELECT CHECKSUM FROM db2admin.OFFICIALS WHERE USERID=?";
          PreparedStatement statement= con.prepareStatement(QueryString);
          statement.setString(1,userid);
          ResultSet rs = statement.executeQuery();   
          if(rs.next())
        	  checksum=rs.getString("CHECKSUM");
          
      		MessageDigest md = MessageDigest.getInstance("SHA-256");
  			md.update((password+checksum).getBytes());

  			byte byteData[] = md.digest();

  			StringBuffer sb = new StringBuffer();
  			for (int i = 0; i < byteData.length; i++) 
  			{
   				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
  			}
  			String hashpass=sb.toString();
          
          QueryString = "SELECT USERID,PASSWORD,TYPE,E_ID FROM db2admin.OFFICIALS WHERE USERID=? AND PASSWORD=?";
          statement= con.prepareStatement(QueryString);
          statement.setString(1,userid);
          statement.setString(2,hashpass);
          rs = statement.executeQuery();          
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