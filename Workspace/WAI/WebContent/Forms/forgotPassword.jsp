<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<h2 class="title">User Account</h2>
			<div id="innerLogin" class="content">
				<form id="login" method="post" autocomplete="off" action="javascript:loadRecoverPassword()">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">UID:</label><br />
					<input id="UID" type="text" name="UID" required/>
					<label for="emailId">Enter your Email ID:</label>
					<input id="emailId" type="email" name="emailId" value="" required/>
					<div id=message>
					<%
					if(session.getAttribute("forgotPasswordMessage")!=null){
						out.print(session.getAttribute("forgotPasswordMessage").toString());
					}
					%>
					</div>					
					<button>Recover Password</button>										
					</fieldset>
				</form>
			</div>
</body>
</html>