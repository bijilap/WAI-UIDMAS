<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.sql.*,database.*,java.io.*" %>
<%@page session="true"%>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("loginError.jsp");
}
%>
<%
String U_ID=session.getAttribute( "userid").toString();
connectToDb Con=new connectToDb();
Connection con=connectToDb.dbconnect();
Statement statement = con.createStatement();
Blob image = null;
byte[ ] imgData = null ;
	
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Citizen's Profile</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
	<% 
		try{
			String QueryString = "SELECT FNAME,MNAME,LNAME,PHOTO,PASSWORD FROM DB2ADMIN.NOMINAL_ROLL , DB2ADMIN.CONTACT , DB2ADMIN.IDENTIFICATION WHERE DB2ADMIN.NOMINAL_ROLL.UID='"+U_ID+"'AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.CONTACT.UID AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.IDENTIFICATION.UID";
			System.out.println(QueryString);
			ResultSet rs1 = statement.executeQuery(QueryString);
			
			if(rs1.next())
			{
				if((rs1.getString("PASSWORD").trim()).compareTo(request.getParameter("passwrd"))!=0)
					{
						session.setAttribute("passwordChangeMessage", "Password you entered does not match with your AVATAR password");
						session.setAttribute("passwordChangeSuccess", "false");
					}
				else
				{
					String newPass= request.getParameter("newPasswrd");
					String QueryString1 = "UPDATE db2admin.NOMINAL_ROLL SET PASSWORD='"+newPass+"' WHERE UID='"+U_ID+"'";
					System.out.println(QueryString);
					statement.executeUpdate(QueryString1);
					session.setAttribute("passwordChangeMessage", "Password has been successfully changed.");
					session.setAttribute("passwordChangeSuccess", "true");
				}
			}else{
				session.setAttribute("passwordChangeMessage", "Password you entered does not match with your AVATAR password");
				session.setAttribute("passwordChangeSuccess", "false");
			}
		}
		catch(SQLException e)
		{
			System.out.println("SQL error : "+e);
			session.setAttribute("passwordChangeMessage", "Server Error, Try again");
			session.setAttribute("passwordChangeSuccess", "false");
		}
		catch(Exception e)
		{
			System.out.println("Unable to retrieve");
			session.setAttribute("passwordChangeMessage", "Server Error, Try again");
			session.setAttribute("passwordChangeSuccess", "false");
		}
	response.sendRedirect("changePassword.jsp");
		%>
</body>
</html>
