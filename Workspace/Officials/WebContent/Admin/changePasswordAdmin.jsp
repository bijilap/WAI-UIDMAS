<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>My Profile</title>
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Resources/reset.css"  media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css"  media="screen" />
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css"  media="screen" />
        
        <!-- WYSIWYG editor stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/jquery.wysiwyg.css"  media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/tablesorter.css"  media="screen" />
        
        <!-- Thickbox stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/thickbox.css"  media="screen" />
        
        <link rel="stylesheet" type="text/css" href="Resources/theme-blue.css"  media="screen" />
        
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Resources/jquery-1.3.2.min.js" ></script>
        
		<!-- JQuery WYSIWYG plugin script -->
		<script type="text/javascript" src="Resources/jquery.wysiwyg.js" ></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Resources/jquery.tablesorter.min.js" ></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Resources/jquery.tablesorter.pager.js"></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Resources/jquery.pstrength-min.1.2.js" ></script>
        
		<!-- JQuery thickbox plugin script -->
		<script type="text/javascript" src="Resources/thickbox.js"></script>
        
        <!-- Initiate WYIWYG text area -->
		<script type="text/javascript">
			$(function()
			{
			$('#wysiwyg').wysiwyg(
			{
			controls : {
			separator01 : { visible : true },
			separator03 : { visible : true },
			separator04 : { visible : true },
			separator00 : { visible : true },
			separator07 : { visible : false },
			separator02 : { visible : false },
			separator08 : { visible : false },
			insertOrderedList : { visible : true },
			insertUnorderedList : { visible : true },
			undo: { visible : true },
			redo: { visible : true },
			justifyLeft: { visible : true },
			justifyCenter: { visible : true },
			justifyRight: { visible : true },
			justifyFull: { visible : true },
			subscript: { visible : true },
			superscript: { visible : true },
			underline: { visible : true },
            increaseFontSize : { visible : false },
            decreaseFontSize : { visible : false }
			}
			} );
			});
        </script>
        
        <!-- Initiate tablesorter script -->
        <script type="text/javascript">
			$(document).ready(function() { 
				$("#myTable") 
				.tablesorter({
					// zebra coloring
					widgets: ['zebra'],
					// pass the headers argument and assing a object 
					headers: { 
						// assign the sixth column (we start counting zero) 
						6: { 
							// disable it by setting the property sorter to false 
							sorter: false 
						} 
					}
				}) 
			.tablesorterPager({container: $("#pager")}); 
		}); 
			
			function loadFooter()
	        {
	        var xmlhttp;
	        if (window.XMLHttpRequest)
	          {// code for IE7+, Firefox, Chrome, Opera, Safari
	          xmlhttp=new XMLHttpRequest();
	          }
	        else
	          {// code for IE6, IE5
	          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	          }
	        xmlhttp.onreadystatechange=function()
	          {
	          if (xmlhttp.readyState==4 && xmlhttp.status==200)
	            {
	            document.getElementById("container").innerHTML=xmlhttp.responseText;
	            }
	          }
	        xmlhttp.open("GET","geniobrainiacs.html",true);
	        xmlhttp.send();
	        }
			
			
		</script>
		
				<script>

function checkPasswrdMatch()
{
	var passwrd=document.getElementById("newPasswrd");
	var confirmPasswrd=document.getElementById("confirmPasswrd");
	if((passwrd.value)!=(confirmPasswrd.value))
		{			
			confirmPasswrd.setCustomValidity('Passwords do not match');
			return false;
		}
	else
	{
		confirmPasswrd.setCustomValidity('');
		return true;
	}
}

</script>
        
        <!-- Initiate password strength script -->
<script type="text/javascript">
			$(function() {
			$('.password').pstrength();
			});
 </script>
        
<style type="text/css">
        table
        {
        		border-collapse:collapse;
        }
</style>

<!-- to submit form using ajax -->
<script type="text/javascript">
function getFormElements(formId){
	x=document.getElementById(formId);
	strSend="";
	for(i=0;i<x.length;i++){
		if(i!=(x.length)-1){
			strSend=strSend+x.elements[i].name+"="+x.elements[i].value+"&";
		}
		else{
			strSend=strSend+x.elements[i].name+"="+x.elements[i].value;
		}
	}
	if(strSend!=""){
		strSend="?"+strSend;
	}
	return strSend;
}
</script>

<script type="text/javascript">
function loadSubmitForm(formId,to)
{	
	parameterList=getFormElements(formId);
	document.getElementById(formId).reset();
	document.forms[0].elements[0].focus();
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("passwordNotification").innerHTML=xmlhttp.responseText;    
    }
  }
xmlhttp.open("POST",to+parameterList,true);
xmlhttp.send();
}
</script>
        
</head>
	<body>
    	<!-- Header -->
        <div id="header">
            <!-- Header. Status part -->
            <div id="header-status">
                <div class="container_12">
                    <div class="grid_8">
					&nbsp;
                    </div>
                    <div class="grid_4">
                        <a href="../login/logout.jsp" id="logout">
                        Logout
                        </a>
                    </div>
                </div>
                <div style="clear:both;"></div>
            </div> <!-- End #header-status -->
            
            <!-- Header. Main part -->
            <div id="header-main">
                <div class="container_12">
                    <div class="grid_12">
                        <div id="logo">
                             <ul id="nav">
                                <li><a href="adminProfile.jsp">Home</a></li>
                                <li><a href="addNews.jsp">Control Centre</a></li>
                                <li><a href="inbox.jsp">Mail</a></li>
                                <li><a href="addOfficials.jsp">Approve</a></li>
                                <li><a href="searchEID.jsp">Search</a></li>
                                <li><a href="help.jsp">Help</a></li>
                                <li id="current"><a href="changePassword.jsp">Change Password</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
        </div> <!-- End #header -->
		<br />
		<div id="container" class="container_12">
        <p>
        <div id="passwordNotification">
        	<font size="+5" color="#0066FF">
        	Change your password by providing the current password and enetering the new password of your choice.
        	</font>
        </div>
        </p>
                <br />
		<div class="module">
            <table width="100%" border="0" cellpadding="6">
  <tr>
    <td>    
    <h2><span><font size="+5"> Change Password </font></span></h2>
    </td>
  </tr>
</table>
<form action="javascript:loadSubmitForm('passwordChange','changePasswordActionAdmin.jsp')" method="get" id="passwordChange" name="passwordChange" autocomplete="off">

<table width="100%" border="0" cellpadding="6">
  
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
  
  
  <tr>
    <td><div align="right">
      <label><font color="#0033FF">Enter Current Password :</font></label>
    </div></td>
    <td><div align="left">
      <input name="passwrd" type="password" id="passwrd" size="30" required autofocus/>
    </div></td>
  </tr>
  
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
  
  
  <tr>
    <td><div align="right">
      <label><font color="#0033FF">Enter New Password :</font></label>
    </div></td>
    <td><div align="left">
      <input name="newPasswrd" type="password" id="newPasswrd" size="30" required oninput="checkPasswrdMatch()"/>
    </div></td>
  </tr>
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
  
  
    <tr>
    <td><div align="right">
      <label><font color="#0033FF">Confirm New Password :      </font></label>
    </div></td>
    <td><div align="left">
      <input name="confirmPasswrd" type="password" id="confirmPasswrd" size="30" required oninput="checkPasswrdMatch()"/>
    </div></td>
  </tr>
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
    
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  
  
  
  <tr>
    <td><div align="right"></div></td>
    <td><div align="left"></div></td>
  </tr>
  <tr>
    <td><div align="right">
      <input type="submit" name="submit1" id="submit1" value="Submit" />
    </div></td>
    <td><div align="left">
      <input type="reset" name="reset1" id="reset1" value="Reset" />
    </div></td>
  </tr>
  
  <tr>
    <td><div align="right"><font color="#990000">*</font></div></td>
    <td><div align="left"><font color="#990000">All Fields are mandatory.</font></div></td>
  </tr>
  
</table>


</form>

				</div>
                </div>  <!-- End .module -->
        		<div style="clear:both;"></div>
            </div> <!-- End .grid_12 -->
                
            <!-- Settings-->
          <div class="grid_6"><!-- End .module -->
            </div> <!-- End .grid_6 -->
                
            <!-- Password --><!-- End .grid_6 -->
          <div style="clear:both;"></div><!-- End .grid_3 --><!-- End .grid_3 -->
            
            <div class="grid_6">
            	<p>&nbsp;</p>
</div> 
            <!-- End .grid_6 -->

            
            <div style="clear:both;"></div>
        </div> <!-- End .container_12 -->
		
           
        <!-- Footer -->
        <div id="footer">
        	<div class="container_12">
            	<div class="grid_12">
                	<p align="center">&copy; <a onclick="loadFooter()" style=cursor:default >Geniobrainiacs 2012</a></p>
        		</div>
            </div>
            <div style="clear:both;"></div>
        </div> <!-- End #footer -->
	</body>
</html>