<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
    <h1><strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI NRI Emigration  Form</font></strong></h1>
<form id="emigrationForm" action="javascript:loadSubmitForm('emigrationForm','conAction.jsp','myContent')" method="post">
<table>
	<tr>
          <td width="25%">
	          <div align="right">
	          	<label for="uid">UID :&nbsp;&nbsp;</label>
	          </div>
          </td>          
          <td>
          	<div align="left"><input name="uid" type="text" id="uid" size="39" maxlength="13" required pattern="(.){13,13}" title="UID should be 13 digits"></div>
          </td>   
	</tr>
	<tr>
          <td width="25%">
          	<div align="right">
	          <label>State :&nbsp;&nbsp;</label>
	        </div>
	      </td>          
          <td>
          	<div align="left"><input name="state" type="text" id="state" size="39" maxlength="50" required></div>
          </td>   
	</tr>
	<tr>
          <td width="25%">
          	<div align="right"> 
	          <label>Country :&nbsp;&nbsp;</label>
	        </div>
	      </td>          
          <td>
          	<div align="left">
          		<input name="country" type="text" id="country" size="39" maxlength="50" required>
          	</div>
          </td>   
	</tr>
	<tr>
          <td width="25%">
          	<div align="right"> 
	          <label>Proof :&nbsp;&nbsp;</label>
	        </div>
	      </td>          
          <td>
          	<div align="left">
          		<input type="file" name="changeOfnationalityProof" value="" size="26">
          	</div>
          </td>   
	</tr>	
</table>
<div align="center">
            <input type="submit" name="submit" id="submit" value="Submit" />&nbsp;&nbsp;
            <input type="reset" name="reset" id="submit" value="Reset" />
        </div>


</form>
</div>

</body>
</html>