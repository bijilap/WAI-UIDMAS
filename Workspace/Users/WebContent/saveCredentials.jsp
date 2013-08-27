<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="reports.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null)
{
	session.setAttribute("errorToShowOnLoginPage","Please Log In To Continue");
	String uri = request.getRequestURI();
	session.setAttribute("redirectTo", uri);
	response.sendRedirect("indexnews.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Report rep=new Report();
    rep.userLogin(session.getAttribute( "userid").toString(),request.getRealPath("/").toString());
%>
<jsp:forward page="userlogin.pdf"></jsp:forward>
</body>
</html>