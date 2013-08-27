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
		//System.out.println(rs1.next());
		
		/*PreparedStatement statement1= con.prepareStatement(QueryString1);
		statement1.setString(1,userid);
		System.out.println(QueryString1);
		ResultSet rs1 = statement1.executeQuery();*/
if(rs1.next())
{
	//System.out.println(QueryString1);				
	String to=emailId,sub,body;
	sub="AVATAR PASSWORD RETRIEVAL..";		
	String pass=rs1.getString("PASSWORD");
	System.out.println(sub+"\n"+to+"\n"+pass);
	body="Your AVATAR password is: "+pass+". Kindly Change it after you login.";	
	
	Mail m1=new Mail();
	m1.GmailSend(to,sub,body);
%>
			<h2 class="title">User Account</h2>
			<div id="innerLogin" class="content">
				<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">UID:</label><br />
					<input id="UID" type="text" name="UID" value="" />
					<label for="password">Password:</label>
					<input id="password" type="password" name="password" value="" />
					<div id=message>
					</div>					
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>
					<br />
					<p><font color="#0099CC"><b>Message has been successfully sent to your ID <%out.print(emailId); %>..</b></font></p>					
					</fieldset>
				</form>
			</div>
			<%
			
}
else
			System.out.println("i came here also");
	}
	else
	{
		%>
		<h2 class="title">User Account</h2>
		<div id="innerLogin" class="content">
			<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
				<fieldset>
				<legend>Sign-In</legend>
				<label for="UID">UID:</label><br />
				<input id="UID" type="text" name="UID" value="" />
				<label for="password">Password:</label>
				<input id="password" type="password" name="password" value="" />
				<div id=message>
				</div>
				<input id="signIn" type="submit" name="signIn" value="Sign In" />
				<br />
				<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>
				<p><font color="#ff0000"><b>The ID you provided does not match with the ID you provided in AVATAR..</b></font></p>					
				</fieldset>
			</form>
		</div>
		<%
	}
}
else
{
	%>
	<h2 class="title">User Account</h2>
	<div id="innerLogin" class="content">
		<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
			<fieldset>
			<legend>Sign-In</legend>
			<label for="UID">UID:</label><br />
			<input id="UID" type="text" name="UID" value="" />
			<label for="password">Password:</label>
			<input id="password" type="password" name="password" value="" />
			<div id=message>
			</div>
			<input id="signIn" type="submit" name="signIn" value="Sign In" />
			<br />
			<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>
			<p><font color="#ff0000"><b>The ID you provided does not match with the ID you provided in AVATAR..</b></font></p>					
			</fieldset>
		</form>
	</div>
	<%
}
}
catch(Exception Ex)
{
%>
<h2 class="title">User Account</h2>
			<div id="innerLogin" class="content">
				<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">UID:</label><br />
					<input id="UID" type="text" name="UID" value="" />
					<label for="password">Password:</label>
					<input id="password" type="password" name="password" value="" />
					<div id=message>
					</div>
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<br />
					<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadForgotPassword()">Forgot your password?</a></p>
					<p><font color="#ff0000"><b>Connection Error, try again..</b></font></p>									
					</fieldset>
				</form>
			</div>
<%	
}
%>
</body>
</html>