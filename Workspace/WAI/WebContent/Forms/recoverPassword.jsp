<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="database.*" %>
<%@page session="true"%>
<%@ page import="gdk.*" %> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
connectToDb Con=new connectToDb();
Connection con=Con.dbconnect();

String userid =request.getParameter("UID");
String emailId =request.getParameter("emailId");
String QueryString = "SELECT EMAIL FROM DB2ADMIN.CONTACT WHERE UID="+userid;
System.out.println(QueryString+ "\n");
Statement statement = con.createStatement();      
ResultSet rs = statement.executeQuery(QueryString);
System.out.println(QueryString);
System.out.println(emailId);
if(rs.next())
{	
	String email=rs.getString("EMAIL");
	System.out.println(email);
	if(email.equals(emailId))
	{		
		System.out.println(userid);
		String QueryString1 = "SELECT PASSWORD FROM DB2ADMIN.NOMINAL_ROLL WHERE UID='"+userid+"'";			
		Statement statement1 = con.createStatement();    
		System.out.println(QueryString1);
		ResultSet rs1 = statement1.executeQuery(QueryString1);
if(rs1.next())
{	
	String to=emailId,sub,body;
	sub="WAI PASSWORD RETRIEVAL..";		
	String pass=rs1.getString("PASSWORD");
	System.out.println(sub+"\n"+to+"\n"+pass);
	body="Your WAI password is: "+pass+". Kindly Change it after you login.";	
	
	Mail m1=new Mail();
	m1.GmailSend(to,sub,body);
	String msg="Message has been successfully sent to your ID "+emailId;
	session.setAttribute("messageToShowInLoginPage", msg);
			
}
}
	else
	{
		String msg="The ID/UID you provided does not match with the ID/UID in WAI..";
		session.setAttribute("messageToShowInLoginPage", msg);
	}
}
else
{	
	String msg="The ID/UID you provided does not match with the ID/UID in WAI..";
	session.setAttribute("messageToShowInLoginPage", msg);
}
}
catch(Exception Ex)
{
		String msg="Connection Error, try again..";
		session.setAttribute("messageToShowInLoginPage", msg);
}
%>
</body>
</html>