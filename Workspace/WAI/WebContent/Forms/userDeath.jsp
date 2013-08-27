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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="logo">
		<h1><a href="home.html">WAI</a></h1>
		<h2><a href="makers.html">by geniobrainiacs</a></h2>
	</div>
<div id="content">	
	<div id="main" style="float: left;margin-left: 150px;">
		<div id="welcome" class="post">
			<h2 class="title">Register a Death</h2>

			<div class="story">
  	            	<form id='userDeathForm' action="javascript:loadSubmitForm('userDeathForm','UserDeathAction.jsp','myContent')" enctype="multipart/form-data" method="post">
            	<div class="form_row">
					<label class="contact">
					<strong>UID of the deceased:&nbsp;</strong>
					</label>
					<input class="contact_input" type="number" name="uid" size="24" required>
				</div>
				<br/>
				<div class="form_row">
					<label class="contact">
					<strong>DOD:</strong>
					</label>
					<input class="contact_input" type="text" id="dod" name="dod" value="" size="24" required readonly>
					<script type="text/javascript">
					 		calendar.set("dod");
					 </script>
				</div> 
				<br/>  	
				<div class="form_row">
					<p>
					Please attach supporting file:(Death Certificate)<br>
					<input type="file" name="proof" size="40">
					</p>
				</div>
				<div class="form_row">
					<table width="100%">
				        <tr>
				          <td width="57%"><input type="submit" name="submit" id="submit" value="Submit" /></td>
				         </tr>
				      </table>
				</div>
</form>
	</div>
   </div>
</div>
</div>