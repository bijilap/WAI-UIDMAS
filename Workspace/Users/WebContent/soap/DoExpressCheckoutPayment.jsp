<%@ page import="com.paypal.sdk.services.CallerServices" %>
<%@ page import="com.paypal.soap.api.*" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal JSP SDK - DoExpressCheckoutPayment API</title>
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
<font size=2 color=black face=Verdana><b>DoExpressCheckoutPayment</b></font>
<br><br>
<%
	CallerServices caller = (CallerServices) session.getValue("caller");

    DoExpressCheckoutPaymentRequestType pprequest = new DoExpressCheckoutPaymentRequestType();
	DoExpressCheckoutPaymentRequestDetailsType details = new DoExpressCheckoutPaymentRequestDetailsType();
	details.setToken(request.getParameter("token"));
	details.setPayerID(request.getParameter("PayerID"));
	details.setPaymentAction(PaymentActionCodeType.fromString((String) session.getValue("paymentType")));
       
	PaymentDetailsType paymentDetails = new PaymentDetailsType();
	BasicAmountType orderTotal = new BasicAmountType();
	orderTotal.set_value(request.getParameter("paymentAmount"));
	orderTotal.setCurrencyID(CurrencyCodeType.fromString((String)request.getParameter("currencyCodeType")));
    paymentDetails.setOrderTotal(orderTotal);
    
    BasicAmountType itemTotal = new BasicAmountType();
	itemTotal.set_value(request.getParameter("paymentAmount"));
	itemTotal.setCurrencyID(CurrencyCodeType.fromString((String)request.getParameter("currencyCodeType")));
    paymentDetails.setItemTotal(itemTotal);
	
	PaymentDetailsItemType[] paymentItems = new PaymentDetailsItemType[1];
	PaymentDetailsItemType paymentItem = new PaymentDetailsItemType();
	paymentItem.setName("Photographic Print - Tropical Sunset");
	paymentItem.setQuantity(new BigInteger("1"));
	BasicAmountType amount = new BasicAmountType();
	amount.set_value(request.getParameter("paymentAmount"));
	amount.setCurrencyID(CurrencyCodeType.fromString((String)request.getParameter("currencyCodeType")));
	paymentItem.setAmount(amount);
			
	paymentItems[0] = paymentItem;
	paymentDetails.setPaymentDetailsItem(paymentItems);
	
	PaymentDetailsType[] payDetailType = new PaymentDetailsType[1];
	payDetailType[0]= paymentDetails;
    details.setPaymentDetails(payDetailType);
  
    pprequest.setDoExpressCheckoutPaymentRequestDetails(details);
    
    try {
		DoExpressCheckoutPaymentResponseType ppresponse = (DoExpressCheckoutPaymentResponseType)caller.call("DoExpressCheckoutPayment", pprequest);
		
		if (!ppresponse.getAck().equals(AckCodeType.Success) && 
			!ppresponse.getAck().equals(AckCodeType.SuccessWithWarning)) {
			session.setAttribute("response", ppresponse);
			response.sendRedirect("APIError.jsp");
			return;
		}
		
		DoExpressCheckoutPaymentResponseDetailsType responseDetails = ppresponse.getDoExpressCheckoutPaymentResponseDetails();
%>
<b>Thank you for your payment!</b><br><br>
<table width=300>
	<tr>
		<td align=right>Transaction ID:</td>
		<td align=left><%= (responseDetails.getPaymentInfo())[0].getTransactionID() %></td>
	</tr>
	<tr>
		<td align=right>Amount:</td>
		<td align=left>Rs.<%= Math.round(Float.parseFloat(responseDetails.getPaymentInfo()[0].getGrossAmount().get_value().toString())*4745)/100  %></td>
	</tr>
</table>
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
