<%@ page import="com.paypal.soap.api.*" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal SDK - API Error</title>
</head>
<body alink=#0000FF vlink=#0000FF>
<center>
<br>
<font size=2 color=black face=Verdana><b>PayPal API Error</b></font>
<br><br>
<b>A PayPal API has returned an error!</b><br><br>
<table width="700">
<%
	AbstractResponseType ppresponse = (AbstractResponseType) session.getValue("response");
%>
	<tr>
		<td>Ack:</td>
		<td><%= ppresponse.getAck() %></td>
	</tr>
	<tr>
		<td>Correlation ID:</td>
		<td><%= ppresponse.getCorrelationID() %></td>
	</tr>
	<tr>
		<td>Version:</td>
		<td><%= ppresponse.getVersion() %></td>
	</tr> 
<%
	for (int i = 0; i < ppresponse.getErrors().length; i++) {
%>
	<tr>
		<td>Error Number:</td>
		<td><%= ppresponse.getErrors(i).getErrorCode() %></td>
	</tr>
	<tr>
		<td>Short Message:</td>
		<td><%= ppresponse.getErrors(i).getShortMessage() %></td>
	</tr>
	<tr>
		<td>Long Message:</td>
		<td><%= ppresponse.getErrors(i).getLongMessage() %></td>
	</tr>
<%
	}
%>
</table>
</center>
<%
  String requestPage=request.getParameter("page"); 
  if(requestPage != null && requestPage.equalsIgnoreCase("RecurringPayments.jsp")){
%>
  <a id="CallsLink" href="RecurringPayments/<%=requestPage%>">Home</a>
<% }else{%>
  <a id="CallsLink" href="Calls.html">Home</a>
<%} %>  
</body>
</html>