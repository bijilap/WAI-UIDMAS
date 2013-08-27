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

<%@ page import="forms.*;" %>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<div id="logo">
  <h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
	</div>
   <div align="middle">
    <strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI Registration Form</font></strong>
   </div>
  <div align="middle"> 
    <h3>Choose your mother tongue</h3> 
  </div>
  <div align="middle"> 
   		<select name="language" class="footer" id="language" onchange="loadForm()">
   		  <option selected="selected">Choose ...</option>
   		  <option value=1>Kannada</option>
   		  <option value=2>Hindi</option>
   		  <option value=3>Bengali</option>
   		  <option value=4>Telugu</option>
   		  <option value=5>Tamil</option>
	    </select>
  </div>
</html>
