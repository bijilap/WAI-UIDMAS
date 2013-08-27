    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
<%@page import="configuration.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<%@ page import="java.io.*" %> 
	<%@ page import="database.*" %>
	<%@ page import="java.util.Scanner" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AVATAR</title>
</head>
<body>



<%
try {
	Configuration con=new Configuration(request.getRealPath("/"));
	String path=con.getBackupRestorePath();
		
	String QueryString1="db2cmd db2 force applications all";	
	Process p1=Runtime.getRuntime().exec(QueryString1);		
	
	File directory = new File(path);
	// Get all files in directory	
	File[] files = directory.listFiles();
	for (File file : files)
	{
		// Delete each file
		if (!file.delete())
		{
			// Failed to delete file
			System.out.println("Failed to delete "+file);
		}
	}
	Thread.sleep(8000);
	String QueryString2="db2cmd db2 backup database AVATAR user db2admin using uvce13 to "+path+" with 3 buffers buffer 1000 without prompting";
    Process p2= Runtime.getRuntime().exec(QueryString2);
    %>
    <b><font color="#01DFD7"><span>Backup Process completed.</span></font></b>
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