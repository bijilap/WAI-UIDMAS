<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="article">
          <h2><span>Verify Card Details</span></h2>
          <div class="clr"></div>
          <p>Verify a WAI card by providing its details..</p>
	</div>
	<form action="/wai.api/VerifyCardInfo" method="post" id="verifyForm">
		<table>
		<tr>
			<td><div align="right">UID: </div></td>
			<td><div align="left"><input type="text" name="uid" id="uid" /></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		<tr>
			<td><div align="right">First Name: </div></td>
			<td><div align="left"><input type="text" name="fname" id="fname"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		<tr>
			<td><div align="right">Middle Name: </div></td>
			<td><div align="left"><input type="text" name="mname" id="mname"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		<tr>
			<td><div align="right">Last Name: </div></td>
			<td><div align="left"><input type="text" name="lname" id="lname"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		
		<tr>
			<td><div align="right">Date Of Birth: </div></td>
			<td><div align="left"><input type="text" name="dob" id="dob"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		<tr>
			<td><div align="right">Checksum: </div></td>
			<td><div align="left"><input type="text" name="checksum" id="checksum"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="left"></div></td>
		</tr>
		<tr>
			<td><div align="right"></div></td>
			<td><div align="center"><input type="submit" name="submit" id="submit" value="Submit" onClick="verifyIntoFrame()"></div></td>
		</tr>
		</table>
	</form>
	<div class="clr"></div>
	<div id="result" style="visibility: hidden;">
	<h2><iframe id="myFrame" name="myFrame" style="visibility: hidden;width: 0px;height: 0px;border: none;" scrolling="no"></iframe></h2>
</div>
</body>
</html>