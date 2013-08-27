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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="forms.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="database.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<%@page session="true"%>

<html>
<head>
<%
	FormLang l=new FormLang();
	String str=request.getParameter("lang");
	int i=Integer.parseInt(str);
	l.lang_choice(i);
%>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />

<%@page contentType="text/html;charset=UTF-8"%>
</head>

<body >
<div id="logo">
  <h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
	</div>
	<div align="center">
    <h1><strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI Registration Form</font></strong></h1>
</div>
<div class="center">
<div>
  <form method="post" id="form1" name="form1" onsubmit="return validateAge()" action="javascript:loadSubmitForm('form1','submitForm.jsp','myContent')" >
    <font color="#000000"> 
      <table width="100%" >
        <tr>
          <td><div align="right"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right"></div></td>
          <td>&nbsp;</td>
          
        </tr>
        
        <%
        
        DateFormat dateFormat1 = new SimpleDateFormat("ssmmHHddMMyy");
        Date currentDate1 = new Date();
        String RNO=dateFormat1.format(currentDate1);
        System.out.println(RNO);
        
        %>
        
        <tr>
          <td width="44%">
          <label>
            <div align="right">Registration Number/<%=l.regno %>:        </div>
          </label></td>          
          <td width="54%">
          <input name="registrationNumber" type="text" id="registrationNumber" size="35" maxlength="40" value="<% out.println(RNO); %>" readonly/></td>   
        </tr>
        
        <%
          
          DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
          Date currentDate = new Date();
          String DOR=dateFormat.format(currentDate);
          System.out.println(DOR);
          %>
        
        <tr>        
          <td><label>
            <div align="right">Date/<%=l.date %>:</div>
          </label>          </td>
          <td><div align="left">
            <input name="date" type="text" id="date" size="35" maxlength="11" required readonly value="<%out.println(DOR); %>"/>            
          </div></td>          
        </tr>
        
        <tr>
          <td><div align="right"><font size="+1" color="#000000"><strong>PRIMARY DETAILS/<%=l.primary %>:</strong></font></div></td>
          <td><div align="left"></div></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right"><font color="RED"> * </font>First Name/<%=l.firstname %></div>
          </label></td>
          <td><input name="firstName" type="text" id="firstName" size="35" maxlength="40" required onblur="validateFirstName()"/></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Last Name/<%=l.lastname %></div>
          </label>          </td>
          <td><div align="left">
            <input name="lastName" type="text" id="lastName" size="35" maxlength="40" />
          </div></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Middle Name/<%=l.mname %></div>
          </label></td>
          <td><input name="middleName" type="text" id="middleName" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Father/Mother/Guardian Name/ <%=l.guardian%></div>
          </label></td>
          <td><input name="fatherName" type="text" id="fatherName" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Date Of Birth/<%=l.dob %></div>
            <td>
            <input name="dateOfBirth" type="text" readonly id="dateOfBirth" size="35"/>   
             <script type="text/javascript">
 		calendar.set("dateOfBirth");
 </script>      
 </td>   
          </label></td>
        <tr>
          <td><label>
            <div align="right">If Not Known Age/<%=l.age %></div>
          </label></td>
          <td><input name="ifNotKnownAge" type="text" id="ifNotKnownAge" size="35" maxlength="3" onblur="validateAge()"/></td>          
        </tr>
        <tr>
          <td><div align="right"><font color="RED"> * </font>Gender/<%=l.gender %></div></td>
          <td><label>
              <input type="radio" name="gender" value="M" id="gender_0" required/>Male/<%=l.male %>
          </label></td>
        </tr>
        <tr>
          <td><div></div></td>
          <td><label>
              <input type="radio" name="gender" value="F" id="gender_1"/>Female/<%=l.female %>
          </label></td>
        </tr>
        <tr>
          <td><div></div></td>
          <td><label>
              <input type="radio" name="gender" value="T" id="gender_2" />Transgender/<%=l.transgender %>
          </label></td>
        </tr>
        <tr>
          <td><div align="right"><strong><em>Residential Address/<%=l.raddress %></em></strong></div></td>
          <td>&nbsp;</td>          
        </tr>
        <tr>
          <td><label><div align="right">C/O/<%=l.co %> :</div></label></td>
          <td><input name="c/o" type="text" id="c/o" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><label><div align="right"><font color="RED"> * </font>House No. And Name/<%=l.hno %></div></label></td>
          <td><input name="houseNoAndName" type="text" id="houseNoAndName" size="35" maxlength="40" required onblur="validateHouseNo()"/></td>          
        </tr>
        <tr>
          <td><label>
          	<div align="right"><font color="RED"> * </font>Street Number And Name/<%=l.street %></div>
          </label></td>
          <td><input name="streetNoAndName" type="text" id="streetNoAndName" size="35" maxlength="40" required onblur="validateStreetNo()"/></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Landmark/<%=l.landmark %></div>
          </label></td>
          <td><input name="landmark" type="text" id="landmark" size="35" maxlength="40" /></td>          
        </tr>
        
        
        <tr>
<td width="41%" align="right" valign="middle">State: </td>
<td width="59%" align="left" valign="middle"><select name="state" id="state" onchange="javascript: dropdownlist(this.selectedIndex);">
<option selected="selected">-Select State-</option>
<option value="Andhra Pradesh">Andhra Pradesh</option> 
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option> 
<option value="Bihar">Bihar</option> 
<option value="Chhattisgarh">Chhattisgarh</option> 
<option value="Goa">Goa</option> 
<option value="Gujarat">Gujarat</option> 
<option value="Haryana">Haryana</option> 
<option value="Himachal Pradesh">Himachal Pradesh</option> 
<option value="Jammu and Kashmir">Jammu and Kashmir</option> 
<option value="Jharkhand">Jharkhand</option> 
<option value="Karnataka">Karnataka</option> 
<option value="Kerala">Kerala</option> 
<option value="Madya Pradesh">Madya Pradesh</option> 
<option value="Maharastra">Maharastra</option> 
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option> 
<option value="Mizoram">Mizoram</option> 
<option value="Nagaland">Nagaland</option> 
<option value="Orissa">Orissa</option> 
<option value="Punjab">Punjab</option>  
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Tripura">Tripura</option>
<option value="Uttaranchal">Uttaranchal</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="West Bengal">West Bengal</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
<option value="Puducherry">Puducherry</option>
</select></td>
</tr>
<tr>
<td align="right" valign="middle">City: </td>
<td align="left" valign="middle">

<select name="district" id="district" >
<option value="">Select City</option>
</select>
</td>
</tr>
        
        
        <tr>
          <td><label>
            <div align="right"><font color="RED"> * </font>Pincode/<%=l.pin %>:</div>
          </label></td>
          <td><input name="pincode" type="text" id="pincode" size="35" maxlength="40" onblur="validatePincode()" required/></td>          
        </tr>
        
        
        <tr>
          <td><div align="right"><strong><em>Permanent Address/<%=l.paddress %>:</em></strong></div></td>
          <td><label>
              <input type="radio" name="same" value="Same as above" id="same_0" onChange="copyAddress(1)"/>Same as above
          </label></td>
        </tr>
        <tr>
          <td><div></div></td>
          <td><label>
              <input type="radio" name="same" value="No" id="same_1" onChange="copyAddress(0)" />No
          </label></td>
        </tr>
        <tr>
          <td><label>
            <div align="right">C/O/<%=l.co %></div>
          </label></td>
          <td><input name="pc/o" type="text" id="pc/o" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">House No. And Name/<%=l.hno %></div>
          </label></td>
          <td><input name="phouseNoAndName" type="text" id="phouseNoAndName" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Street Number And Name/<%=l.street %></div>
          </label></td>
          <td><input name="pstreetNoAndName" type="text" id="pstreetNoAndName" size="35" maxlength="40" /></td>         
        </tr>
        <tr>
          <td><label>
            <div align="right">Landmark/<%=l.landmark %></div>
          </label></td>
          <td><input name="plandmark" type="text" id="plandmark" size="35" maxlength="40" /></td>          
        </tr>
<tr>
<td width="41%" align="right" valign="middle">State:</td>
<td width="59%" align="left" valign="middle"><select name="pstate" id="pstate" onchange="javascript: dropdownlistp(this.selectedIndex);">
<option selected="selected">-Select State-</option>
<option value="Andhra Pradesh">Andhra Pradesh</option> 
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option> 
<option value="Bihar">Bihar</option> 
<option value="Chhattisgarh">Chhattisgarh</option> 
<option value="Goa">Goa</option> 
<option value="Gujarat">Gujarat</option> 
<option value="Haryana">Haryana</option> 
<option value="Himachal Pradesh">Himachal Pradesh</option> 
<option value="Jammu and Kashmir">Jammu and Kashmir</option> 
<option value="Jharkhand">Jharkhand</option> 
<option value="Karnataka">Karnataka</option> 
<option value="Kerala">Kerala</option> 
<option value="Madya Pradesh">Madya Pradesh</option> 
<option value="Maharastra">Maharastra</option> 
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option> 
<option value="Mizoram">Mizoram</option> 
<option value="Nagaland">Nagaland</option> 
<option value="Orissa">Orissa</option> 
<option value="Punjab">Punjab</option>  
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Tripura">Tripura</option>
<option value="Uttaranchal">Uttaranchal</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="West Bengal">West Bengal</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
<option value="Puducherry">Puducherry</option>
</select></td>
</tr>
<tr>
<td align="right" valign="middle">City:
</td>
<td align="left" valign="middle">
<select name="pdistrict" id="pdistrict" >
<option value="">Select City</option>
</select>
</td>
</tr>
        
        <tr>
          <td><label>
            <div align="right">Pincode/<%=l.pin %>:</div>
          </label></td>
          <td><input name="ppincode" type="text" id="ppincode" size="35" maxlength="40"/></td>          
        </tr>
        
        <tr>
          <td><div align="right"><strong><em>Optional Information/<%=l.optinfo %></em></strong></div></td>
          <td>&nbsp;</td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Email ID/<%=l.email %></div>
          </label></td>
          <td><input name="emailId" type="text" id="emailId" size="35" maxlength="40" oninput="validateEmailId()"/></td>          
        </tr>
        <tr>
          <td><label>
            <div align="right">Phone No./<%=l.phno %></div>
          </label></td>
          <td><input name="phoneNo" type="text" id="phoneNo" size="35" maxlength="40" /></td>          
        </tr>
        <tr>
          <td><div align="right"><font color="RED"> * </font>Mode of contact/<%=l.mode %></div></td>
          <td><label>
              <input type="radio" name="contact" value="cemail" id="contact_0" required onchange="validateEmailPresent()"/>E-Mail/<%=l.Email %>
          </label></td>
        </tr>
        <tr>
          <td><div></div></td>
          <td><label>
              <input type="radio" name="contact" value="mail" id="contact_1" onchange="validateEmailPresent()"/>Mail/<%=l.mail %>
          </label></td>
        </tr>
        <tr>
          <td><div></div></td>
          <td><label>
              <input type="radio" name="contact" value="both" id="contact_2" onchange="validateEmailPresent()"/>Both/<%=l.both %>
          </label></td>          
        </tr>
        <tr>
          <td><div align="right"><font size="+1" color="#000000"><strong>Secondary Details:</strong></font></div></td>
          <td><div align="left"></div></td>          
        </tr>
        
        <tr>
          <td><label>
            <div align="right">FingerPrint:</div>
          </label></td>
          <td><div><input name="fingerprint[]" type="file" id="fingerprint" size="35" multiple/></div></td>
          <td>&nbsp;</td>
        </tr>

        <tr>
          <td><label>
            <div align="right">Photo:</div>
          </label></td>
          <td><div>
            <input name="photo" type="file" id="photo" size="35" required />
          </div></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">Address Proof:</div></td>
          <td><div><input name="addressProof" type="file" id="addressProof" size="35" required /></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>

          <td><label>
            <div align="right">Birth Proof:<br />
            </div>
          </label></td>
          <td><div>
            <input name="birthProof" type="file" id="birthProof" size="35" required />
          </div></td>
          <td>&nbsp;</td>
        </tr>
        
        
      </table>

      <br /><br />
    <table width="100%" >
  <tr>
    <td width="47%"><div align="right">
      <input type="checkbox" name="accept" required id="accept"/>
    </div></td>
    <td ><label for="accept">
    I Accept All Terms And Conditions</label></td>
  </tr>
</table>

    <table width="100%">
      <tr>
        <td >
          <div align="right">
            <input type="submit" name="submit" id="submit" value="Submit" />
        </div></td>
        <td >
        <input type="reset" name="reset" id="reset" value="Reset" /></td>
      </tr>
    </table>
    </font>              
    
      </form>
      <%=request.getRealPath("/") %>
</body>
</html>
