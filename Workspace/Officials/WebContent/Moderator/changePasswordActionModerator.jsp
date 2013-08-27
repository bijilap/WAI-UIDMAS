<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<%
String eid=session.getAttribute("eid").toString();
System.out.println(eid);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>My Profile</title>
	</head>
	<body>
	<%
		try
		{
			connectToDb Con=new connectToDb();
	    	Connection con=Con.dbconnect();	    		    
	    	String QueryString = "SELECT PASSWORD FROM db2admin.OFFICIALS WHERE E_ID='"+eid+"'";
	    	System.out.println(QueryString);
	    	Statement statement= con.createStatement();
	        ResultSet rs = statement.executeQuery(QueryString);	
	       if(rs.next())
	       {
	    	   if((rs.getString("PASSWORD").trim()).compareTo(request.getParameter("passwrd"))!=0)
		        {	
		        	%>		
		    		<div id="error">
		    		
		    		<font color="#FF0033" size="+2">Password you entered does not match with your WAI password</font>
		    		
		    		</div>
		    		<%
		        }
		        else
		        {
		        	String newPass= request.getParameter("newPasswrd");
		        	
		        	String QueryString1 = "UPDATE db2admin.OFFICIALS SET PASSWORD='"+newPass+"' WHERE E_ID='"+eid+"'";
		        	System.out.println(QueryString1);
		        	statement.executeUpdate(QueryString1);
		        	%>		
		        	<div id="success">
		        	
		        	<font color="#0033FF" size="+2">Password has been successfully changed.</font>
		        	
		        	</div>
		        	<%
		        }
			}
	       else
	       {
	    	   %>		
	        	<div>
	        	
	        	<font color="#0033FF" size="+2">Password NOT changed..!!</font>
	        	
	        	</div>
	        	<%
	       }
	       
		}
	       
		catch(Exception E)
		{
			E.printStackTrace();
			%>
			<p>Error changing password.. Try Again..!!</p>
			<%
		}
		%>
	</body>
</html>