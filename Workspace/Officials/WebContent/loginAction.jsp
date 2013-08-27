<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WAI</title>
    <link rel="stylesheet" type="text/css" media="screen" href="Admin/css/default.css" />
</head>
<body>

<%
      try {
          
    	  connectToDb Con=new connectToDb();
    	  Connection con=Con.dbconnect();

          //ResultSet rs = null;
          
          String userid =request.getParameter("USERID");
          String passwrd =request.getParameter("password");
          String QueryString = "SELECT USERID,PASSWORD,TYPE FROM db2admin.OFFICIALS WHERE USERID=? AND PASSWORD=?";
          PreparedStatement statement= con.prepareStatement(QueryString);
          statement.setString(1,userid);
          statement.setString(2,passwrd);
          ResultSet rs = statement.executeQuery();          
    	 if (rs.next()) 
    	{  		
    		 //session.setMaxInactiveInterval(24 * 60 * 60);
    	  	//session.setAttribute("userid",userid);    	  
    	  	
    	  	if(rs.getString("TYPE").equals("A"))
    	  	{
    	  		session.setAttribute("userid",userid);
    	  		session.setAttribute("A",userid);
    	  		response.sendRedirect("loginSuccessAdmin.jsp");
    	  	}
    	  	else
    	  	{
    	  		session.setAttribute("userid",userid);
    	  		session.setAttribute("M",userid);
    	  		response.sendRedirect("Moderator/mHome.jsp");
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
  
     <b><font size="+3" color="red"></b>
        <%
                out.println("Unable to connect to database.");
            }
        %>
    <TABLE>
        <TR>
            <TD><FORM ACTION="officialIndex.jsp" method="get" >
            <button type="submit"><-- back</button></TD>
        </TR>
    </TABLE>
</font>

  <div>
    <p id="footer"><a href="http://www.google.com">@Geniobrainiacs,2011</a></p>
    </div>


</body>
</html>