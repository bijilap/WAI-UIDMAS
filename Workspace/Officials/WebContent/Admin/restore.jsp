<%@page import="configuration.Configuration"%>
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
try {
	Configuration con=new Configuration(request.getRealPath("/"));
	String path=con.getBackupRestorePath();
	
	String QueryString2="db2cmd db2 restore database AVATAR user db2admin using uvce13 from "+path+" with 3 buffers buffer 1000 without rolling forward without prompting";	
    Process p= Runtime.getRuntime().exec(QueryString2);
    %>
    <b><font color="#01DFD7"><span>Restore Completed.</span></font></b>
    <%
}
catch (Exception ex) {
%>

<b><font color="#8A0829"><span>Unsuccessful.</span></font></b>
  <%   
      }
  %>


</body>
</html>