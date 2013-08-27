<%@page import = "java.util.Date" session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%
  try
  {
	  Connection con=connectToDb.dbconnect();
      String QueryString = "UPDATE db2admin.USER_SIGNIN_LOG SET OUTTIME=? WHERE UID=? AND SESSIONID=?";
      PreparedStatement statement = con.prepareStatement(QueryString);  
      String sid=session.getId().toString();
      String uid=session.getAttribute("userid").toString();
     // System.out.println(uid);
      String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date ());
     // System.out.println(date);
      
      statement.setString(1,date);
      statement.setString(2,uid);
      statement.setString(3,sid);
      int scode = statement.executeUpdate(); 
      System.out.println(scode);
      statement.close();
      
      session.setAttribute("user", null);
      session.invalidate();
      response.sendRedirect("indexnews.jsp");
  }
  catch(Exception e)
  {
	  System.out.println("The signing out could not be logged");
	  e.printStackTrace();
	  session.setAttribute("userid", null);
	  session.invalidate();
	  response.sendRedirect("indexnews.jsp");
  }

%>