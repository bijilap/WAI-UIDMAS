<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="reports.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Acknwlgmnt rep=new Acknwlgmnt();
    rep.generateCard(request.getParameter("reg_no"),"1001",request.getRealPath("/").toString()+"Forms/");
%>
<jsp:forward page="acknldgmnt.pdf"></jsp:forward>
</body>
</html>