<%@page session="true"%>
<%
if(session.getAttribute("userid")==null||session.getAttribute("M")==null)
{
   response.sendRedirect("loginError.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AVATAR</title>
</head>
<body>
SUCCESS MODERATOR.....
<h3><a href="logout.jsp">Logout</a></h3>
</body>
</html>