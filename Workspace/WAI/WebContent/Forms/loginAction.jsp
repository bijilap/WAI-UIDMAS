<%@ page import="java.security.MessageDigest" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")!=null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("modLink.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WAI</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/default.css" />
</head>
<body>

<%
      try {
          
    	  connectToDb Con=new connectToDb();
    	  Connection con=Con.dbconnect();      
          
          String userid =request.getParameter("UID");
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
          QueryString = "SELECT USERID,PASSWORD FROM db2admin.OFFICIALS WHERE USERID=? AND PASSWORD=?";
          statement = con.prepareStatement(QueryString);
          statement.setString(1,userid);
          statement.setString(2,hashpass);
          rs = statement.executeQuery();          
    	 if (rs.next()) 
    	{  		
//     		session.setMaxInactiveInterval(24 * 60 * 60);    	  	
    	  	session.setAttribute("userid",userid);    	  	
    	  	if(session.getAttribute("redirectTo")!=null){
    	  		String redirectTo=session.getAttribute("redirectTo").toString();
    	  		session.removeAttribute("redirectTo");
    	  		response.sendRedirect(redirectTo);
    	  	}else{
    	  		response.sendRedirect("modLink.jsp");
    	  	}
    	}
    	 else
    	 {
    		 session.setAttribute("messageToShowInLoginPage", "Invalid username or password.Try again");
    		 response.sendRedirect("logIn.jsp");
    	 }    	 
    	rs.close();
    	statement.close();
    	con.close();
	}
catch (Exception ex) {
    %>
  
     <b><font size="+3" color="red">
        <%
                out.println("Unable to connect to database.");
            }
        %>
      </font>  
     </b>
     
    <table>
        <tr>
            <td><form ACTION="logIn.jsp" method="post" >
            <button type="submit"><-- back</button></TD>
            </form>
        </tr>
    </table>
    

</body>
</html>