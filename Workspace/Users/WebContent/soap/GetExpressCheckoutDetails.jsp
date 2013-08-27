<%@ page import="com.paypal.sdk.services.CallerServices" %>
<%@ page import="com.paypal.soap.api.*" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal JSP SDK - ExpressCheckout-Instant API- Simplified Order Review Page</title>
<link href="sdk.css" rel="stylesheet" type="text/css"/>
<link href="default.css" rel="stylesheet" type="text/css" />
</head> 
<body alink=#0000FF vlink=#0000FF>
<div id="menu">
		<ul>
			<li><a href='../myProfile.jsp'  title="">Home</a></li>
			<li class="active"><a href='webpaymentpro.jsp' style=cursor:default title="">E-Payment</a></li>			
		</ul>        
	</div>   
    <div class="logout" id="logout">
        	<a href="../logout.jsp" style=cursor:default title="">Logout</a>
        </div>  
	<div id="logo">
	  <h1><a href="#">AVATAR</a></h1>
		<h2><a onclick="loadAboutUs()" title="">by geniobrainiacs</a></h2>
	</div>
<br>
<center>
<!--font size=2 color=black face=Verdana><b>GetExpressCheckoutDetails</b></font-->

<%
	CallerServices caller = (CallerServices) session.getValue("caller");		
  
	GetExpressCheckoutDetailsRequestType pprequest = new GetExpressCheckoutDetailsRequestType();
	pprequest.setToken(request.getParameter("token"));

	try {
		GetExpressCheckoutDetailsResponseType ppresponse = (GetExpressCheckoutDetailsResponseType)caller.call("GetExpressCheckoutDetails", pprequest);
		
		if (!ppresponse.getAck().equals(AckCodeType.Success) && 
			!ppresponse.getAck().equals(AckCodeType.SuccessWithWarning)) {
			session.setAttribute("response", ppresponse);
			response.sendRedirect("APIError.jsp");
			return;
		} 
		
		GetExpressCheckoutDetailsResponseDetailsType details = ppresponse.getGetExpressCheckoutDetailsResponseDetails();
%>
<!--b>Review and Place Order</b-->
<table width=400>
 	<tr>
      <td colspan="2" class="header">
          <h3>Step 3: Confirm Payment</h3>
      </td>
    </tr>
	<tr>
		<td ><b>Order Total:<b></td>
		<td align=left>Rs.<%=Math.round(Float.parseFloat(details.getPaymentDetails()[0].getOrderTotal().toString())*4745)/100 %></td>
	</tr>
</table>
<form method=POST action="DoExpressCheckoutPayment.jsp?token=<%= details.getToken() %>&PayerID=<%= details.getPayerInfo().getPayerID()%>&currencyCodeType=<%= request.getParameter("currencyCodeType") %>&paymentAmount=<%= (details.getPaymentDetails())[0].getOrderTotal() %>">
	<input type=Submit value=Pay>
</form>
<%
	} catch (Exception e) {
		out.println(e);
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>

</center>
<br>
<br>
<br>
<div id="footer">
	<p id="legal">Copyright &copy; Avatar All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</html>