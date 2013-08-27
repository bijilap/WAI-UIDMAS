<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<html xmlns="http://www.w3.org/1999/xhtml">
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
          
          String userid =request.getParameter("UID");
          String passwrd =request.getParameter("password");          
          String QueryString = "SELECT UID,PASSWORD FROM db2admin.NOMINAL_ROLL WHERE UID=? AND PASSWORD=?";
          PreparedStatement statement = con.prepareStatement(QueryString);      
          statement.setString(1,userid);
          statement.setString(2,passwrd);
          ResultSet rs = statement.executeQuery();          
    	 if (rs.next()) 
    	{  		
    		 //session.setMaxInactiveInterval(24 * 60 * 60);
    	  	//session.setAttribute("userid",userid);
    	  	
    	  	session.setAttribute("userid",userid);
    	  	
    	  	String sid=session.getId().toString();
    	  	String ipAddr=request.getRemoteAddr();
    	  	String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date ());
    	  	String location=request.getParameter("location");
    	  	System.out.println(location);
    	  	String locationList[]=location.split("&");
    	  	
    	  	String query_signin="INSERT INTO db2admin.USER_SIGNIN_LOG(UID,SESSIONID,IPADDR,INTIME,COUNTRY,PROVINCE,CITY) VALUES(?,?,?,?,?,?,?)";
            statement = con.prepareStatement(query_signin);      
            statement.setString(1,userid);
            statement.setString(2,sid);
            statement.setString(3,ipAddr);
            statement.setString(4,date);
            statement.setString(5,locationList[0]);
            statement.setString(6,locationList[1]);
            statement.setString(7,locationList[2]);
            
            int scode = statement.executeUpdate(); 
            
    	  	response.sendRedirect("myProfile.jsp");
    	}
    	 else
    	 {
    		 session.setAttribute("errorToShowOnLoginPage","Invalid credentials");
//     		 response.sendRedirect("loginError.jsp");
			 response.sendRedirect("indexnews.jsp");
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
        		ex.printStackTrace();
            }
        %>
    <TABLE>
        <TR>
            <TD><FORM ACTION="Login.jsp" method="get" >
            <button type="submit"><-- back</button></TD>
        </TR>
    </TABLE>
</font>
  </div>

  <div>
    <p id="footer"><a href="http://www.google.com">@Geniobrainiacs,2011</a></p>
    </div>


</body>
</html>