<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h2 class="title">User Account</h2>
			<div id="innerLogin" class="content">
				<form id="login" method="post" autocomplete="off" action="loginAction.jsp">
					<fieldset>
					<legend>Sign-In</legend>
					<label for="UID">UID:</label><br />
					<input id="UID" type="text" name="UID" value="" /><br />
					<label for="emailId">Enter your Email ID:</label>
					<input id="emailId" type="text" name="emailId" value="" />
					<div id=message>
					</div>					
					<p><a onmouseover="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''" style=cursor:default onclick="loadRecoverPassword()">Recover password</a></p>										
					</fieldset>
				</form>
			</div>
</body>
</html>