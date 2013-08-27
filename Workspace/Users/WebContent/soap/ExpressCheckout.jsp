<%@ include file='constants.jsp'%>
<%@ page import="java.sql.*,database.*,java.io.*" %>
<%@page session="true"%>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>PayPal JAVA SDK - ExpressCheckout API</title>
<link href="default.css" rel="stylesheet" type="text/css" />
<LINK href="sdk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function cal_Dollar()
{
	document.getElementById("L_AMT").value=Math.round((document.getElementById("L_AMT1").value/47.43)*100)/100
}
</script>
</HEAD>
<body>
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
<%
String U_ID=session.getAttribute( "userid").toString();
String env = (String)session.getAttribute("environment");
String devEnv="developer";
if (env.equalsIgnoreCase("beta-sandbox")) {
  devEnv="beta-developer";
} 

connectToDb Con=new connectToDb();
Connection con=connectToDb.dbconnect();
Statement statement = con.createStatement();
%>
<center>
<% 
try{
				String QueryString = "SELECT FNAME,ADDRESS,DB2ADMIN.FINANCE.EMAIL,DB2ADMIN.FINANCE.PASSWORD FROM DB2ADMIN.NOMINAL_ROLL , DB2ADMIN.FINANCE WHERE DB2ADMIN.NOMINAL_ROLL.UID='"+U_ID+"'AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.FINANCE.UID ";
				//System.out.println(QueryString);
				ResultSet rs1 = statement.executeQuery(QueryString);
				
				if(rs1.next())
				{
					
				%>
<form method="POST" action="SetExpressCheckout.jsp">
<input type=hidden name=paymentType
	value=<%= request.getParameter("paymentType") %>>
<P><span id="apiheader"><font size=3 color=black face=Verdana><b>E-Payment</b> </font> </span></P>

<TABLE id="Table1">
	<tr>
		<td colspan="2" style="WIDTH: 390px"><br>
		</td>
	</tr>
	<tr>
		<td align=left><br>
		<input type="hidden" size="30" name="buyersemail" value="<%=rs1.getString("EMAIL")%>"></td>

	</tr>
	<tr>
		<td class="field"><br>Bill Type:</td>
		<td><input type="text" size="30" maxlength="32" name="L_NAME" value="Electricity Bill" /></td>


		<td class="field">Amount:</td>
		<td><input type="text" name="L_AMT1" id="L_AMT1" size="5" maxlength="32"
			 onmouseout="cal_Dollar()"/></td>
		<td><input type="hidden" name="L_AMT" id="L_AMT" size="5" maxlength="32" /></td>
		<td><input type="hidden" size="3" maxlength="32" name="L_QTY"
			value="1" /></td>

	</tr>
	<tr>
		<td>
		<input type="hidden" name="currencyCodeType" value="USD" /></td>
	</tr>
</TABLE>
<BR>
<TABLE id="Table2">
	<tr>
		<td><input type="hidden" size="30" maxlength="32" name="NAME"
			value="<%=rs1.getString("FNAME")%>" /></td>
		<td colspan="20"></td>	
	</tr>
	<tr>
		<td><input type="hidden" size="30" maxlength="32"
			name="SHIPTOSTREET" value="111 Bliss Ave" /></td>
        <td colspan="20"></td>			
	</tr>
	<tr>
		<td><input type="hidden" size="30" maxlength="32" name="SHIPTOCITY"
			value="San Jose" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td><input type="hidden" size="30" maxlength="32"
			name="SHIPTOSTATE" value="CA" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td><input type="hidden" size="30" maxlength="32"
			name="SHIPTOCOUNTRYNAME" value="US" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td><input type="hidden" size="30" maxlength="32" name="SHIPTOZIP"
			value="95128" /></td>
			<td colspan="20"></td>
	</tr>
	<TR>
		<TD><input type="image" name="submit"
			src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" /> <input
			type="hidden" name=paymentType 
			value=<%=request.getParameter("paymentType")%>></TD>
		
	</TR>
</TABLE>
</form>
<%
				}
				else
				{
					%>
<form action="createPaypalAccount.jsp" method="post">
            	<div class="form_row">
<h1>Avatar E-Payment</h1>
<p>Create a paypal account to avail the e-payment option. Enter your paypal credentials here to actiate your e-payment service</p>
<a href="https://www.paypal.com/in/cgi-bin/webscr?cmd=_flow&SESSION=B8tUcBaWgJjILB6ZfB8nVBBqZxShH41IsTKu3JyNMlLfqhlZ1e_6Z_Ovete&dispatch=5885d80a13c0db1f8e263663d3faee8dcbcd55a50598f04d927139403713ca13" target="_blank">Register for Paypal</a> 
<h2>Enter your Paypal Credentials</h2>
<label class="contact">
<strong>Paypal Email id:&nbsp;</strong>
</label>
<input class="contact_input"  name="email" size="24">
</div>
<br></br>
<div class="form_row">
<label class="contact">
<strong>Paypal Password:</strong>
</label>
<input class="contact_input" type="password"  name="password" size="24">
</div>
<br></br> 
<input type="submit" name="submit" id="submit" value="Submit" />    	
<div class="form_row">
</div>
<div class="form_row">
</div></form>
					<%
				}
}
catch(SQLException e)
				{
					out.println("SQL error : "+e);
				}
catch(Exception e)
				{
					out.println("Unable to retrieve");
				}
%>
</center>
<br>
<div id="footer">
	<p id="legal">Copyright &copy; Avatar All Rights Reserved. Designed by <a onclick="loadAboutUs()" title="">Geniobrainiacs</a>.</p>
</div>
</body>
</HTML>