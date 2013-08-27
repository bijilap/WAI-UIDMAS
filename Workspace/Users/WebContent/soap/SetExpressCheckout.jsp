<%@ include file='constants.jsp' %>
<%@ page import="com.paypal.sdk.services.CallerServices" %>
<%@ page import="com.paypal.soap.api.*" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="java.math.*" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal JSP SDK - ExpressCheckout API</title>
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
<font size=2 color=black face=Verdana><b>SetExpressCheckout</b></font>
<br><br>
<%
try {
	CallerServices caller = (CallerServices) session.getValue("caller");
	SetExpressCheckoutRequestType pprequest = new SetExpressCheckoutRequestType();
	SetExpressCheckoutRequestDetailsType details = new SetExpressCheckoutRequestDetailsType();

	StringBuffer url = new StringBuffer();
	url.append("http://");
	url.append(request.getServerName());
	url.append(":");
	url.append(request.getServerPort());
	url.append(request.getContextPath());

	String returnURL = url.toString()
			+ "/soap/GetExpressCheckoutDetails.jsp";
	String cancelURL = url.toString() + "/soap/Calls.html";

	details.setReturnURL(returnURL + "?paymentAmount="
			+ request.getParameter("paymentAmount")
			+ "&currencyCodeType="
			+ request.getParameter("currencyCodeType"));
	details.setCancelURL(cancelURL);
	details.setBuyerEmail(request.getParameter("buyersemail"));	

	details.setPaymentAction(PaymentActionCodeType.fromString(request
			.getParameter("paymentType")));
	session.setAttribute("paymentType", request
			.getParameter("paymentType"));
	
	details.setCallbackURL("https://www.ppcallback.com/callback.pl");
	details.setCallbackTimeout("5");

	// populate line item details
	String[] amountItems = request.getParameterValues("L_AMT");
	String[] qtyItems = request.getParameterValues("L_QTY");
	String[] names = request.getParameterValues("L_NAME");	
	float ft=0.0f;
	PaymentDetailsItemType[] lineItems = new PaymentDetailsItemType[names.length];
	for (int i = 0; i < names.length; i++) {
		
		//if(names[i]!= null && !names[i].equalsIgnoreCase("")){
		//	String AMT=(amountItems[i].trim()=="")? "0" : amountItems[i];
		//	PaymentDetailsItemType item = new PaymentDetailsItemType();
		//	BasicAmountType amt = new BasicAmountType();
		//	amt.setCurrencyID(CurrencyCodeType.fromString(request
		//					.getParameter("currencyCodeType")));
		//	amt.set_value(amountItems[i]);
		//	String QTY=(qtyItems[i].trim()=="")? "0" : qtyItems[i];
		//	item.setQuantity(new BigInteger(QTY));
		//	item.setName(names[i]);
		//	item.setNumber(Integer.toString(i));
		//	item.setAmount(amt);
		//	ft += Float.valueOf(QTY).floatValue()*Float.valueOf(AMT).floatValue();
		//	lineItems[i] = item;
		// }
		
		PaymentDetailsItemType item = new PaymentDetailsItemType();
		BasicAmountType amt = new BasicAmountType();
		amt.setCurrencyID(CurrencyCodeType.fromString(request
				.getParameter("currencyCodeType")));
		amt.set_value(amountItems[i]);
		item.setQuantity(new BigInteger(qtyItems[i]));
		item.setName(names[i]);
		item.setNumber(Integer.toString(i));
		item.setAmount(amt);
		ft += Float.valueOf(qtyItems[i].trim()).floatValue()*Float.valueOf(amountItems[i].trim()).floatValue();
		lineItems[i] = item;
	}

	BasicAmountType shippingTotal = new BasicAmountType();
	shippingTotal.set_value("3.00");
	shippingTotal.setCurrencyID(CurrencyCodeType.fromString(request
			.getParameter("currencyCodeType")));
	BasicAmountType itemsTotal = new BasicAmountType();
	itemsTotal.set_value(Float.toString(ft));
	itemsTotal.setCurrencyID(CurrencyCodeType.fromString(request
			.getParameter("currencyCodeType")));
	
	PaymentDetailsType[] payDetails = new PaymentDetailsType[1];
	PaymentDetailsType paydtl=new PaymentDetailsType();
	paydtl.setPaymentDetailsItem(lineItems);
	paydtl.setShippingTotal(shippingTotal);
	paydtl.setItemTotal(itemsTotal);
	payDetails[0]=paydtl;
	details.setPaymentDetails(payDetails);
	
	//populate shipping address details
	details.setAddressOverride("1");
	String[] shippingMethods = { "Ground", "UPS Air" };
	ShippingOptionType[] shippings = new ShippingOptionType[2];
	for (int i = 0; i < 2; i++) {
		ShippingOptionType ship = new ShippingOptionType();
		ship.setShippingOptionName(shippingMethods[i]);
		BasicAmountType amt = new BasicAmountType();
		amt.setCurrencyID(CurrencyCodeType.fromString(request
				.getParameter("currencyCodeType")));
		if (i == 0) {
			ship.setShippingOptionIsDefault("true");
			amt.set_value("3.00");
		} else {
			ship.setShippingOptionIsDefault("false");
			amt.set_value("17.00");
		}
		ship.setShippingOptionAmount(amt);
		shippings[i] = ship;
	}
	details.setFlatRateShippingOptions(shippings);


	//populate shipping address (in a real application buyer shipping address is chosen or collected on the merchant site)	
	AddressType address = new AddressType();
	address.setName(request.getParameter("NAME"));
	address.setStreet1(request.getParameter("SHIPTOSTREET"));
	address.setCityName(request.getParameter("SHIPTOCITY"));
	address.setStateOrProvince(request.getParameter("SHIPTOSTATE"));
	address.setCountryName(request.getParameter("SHIPTOCOUNTRYNAME"));
	address.setCountry(CountryCodeType.US);
	address.setPostalCode(request.getParameter("SHIPTOZIP"));	
	details.setAddress(address);
	
	//populate order total
	BasicAmountType orderTotal = new BasicAmountType();
	//orderTotal.set_value(request.getParameter("paymentAmount"));
	orderTotal.setCurrencyID(CurrencyCodeType.fromString(request
			.getParameter("currencyCodeType")));
	float amt = Util.round(ft + 3.00f,2);
	orderTotal.set_value(Float.toString(amt));
	details.setOrderTotal(orderTotal);
	float maxamt = Util.round(amt+35.00f,2);
	BasicAmountType maxAmount = new BasicAmountType();
	maxAmount.set_value(Float.toString(maxamt));
	maxAmount.setCurrencyID(CurrencyCodeType.fromString(request
			.getParameter("currencyCodeType")));
	details.setMaxAmount(maxAmount);
	
		
	pprequest.setSetExpressCheckoutRequestDetails(details);
	String testEnv = (String) session.getAttribute("environment");
	
		SetExpressCheckoutResponseType ppresponse = (SetExpressCheckoutResponseType) caller
				.call("SetExpressCheckout", pprequest);
		if (!ppresponse.getAck().equals(AckCodeType.Success)
				&& !ppresponse.getAck().equals(
						AckCodeType.SuccessWithWarning)) {
			session.setAttribute("response", ppresponse);
			response.sendRedirect("APIError.jsp");
			return;
		} else {
			String redirectURL = "https://www."
					+ testEnv
					+ ".paypal.com/cgi-bin/webscr?cmd=_express-checkout&token="
					+ ppresponse.getToken();
			response.sendRedirect(redirectURL);
		}
	} catch (Exception e) {
		out.println(e);
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>
</center>
<div id="footer">
	<p id="legal">Copyright &copy; Avatar All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</html>