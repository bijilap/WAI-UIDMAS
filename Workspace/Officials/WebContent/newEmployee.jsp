<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*,database.*" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>New Employee</title>
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Admin/Resources/reset.css"  media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Admin/Resources/grid.css"  media="screen" />

        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/styles.css"  media="screen" />
        
        <!-- WYSIWYG editor stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/jquery.wysiwyg.css"  media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/tablesorter.css"  media="screen" />
        
        <!-- Thickbox stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/thickbox.css"  media="screen" />
        
        <link rel="stylesheet" type="text/css" href="Admin/Resources/theme-blue.css"  media="screen" />
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Admin/Resources/jquery-1.3.2.min.js" ></script>
        
		<!-- JQuery WYSIWYG plugin script -->
		<script type="text/javascript" src="Admin/Resources/jquery.wysiwyg.js" ></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Admin/Resources/jquery.tablesorter.min.js" ></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Admin/Resources/jquery.tablesorter.pager.js" ></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Admin/Resources/jquery.pstrength-min.1.2.js" ></script>
        
		<!-- JQuery thickbox plugin script -->
		<script type="text/javascript" src="Admin/Resources/thickbox.js" ></script> 
        <!-- Initiate password strength script -->
        <script type="text/javascript">
        function checkPasswords()
        {	
      		var mismatchElement=document.getElementById("mismatch");
      		var enterPassword=document.getElementById("pass");
      		var reenterPassword=document.getElementById("repass");
      		if(enterPassword.value.length<6){
      			mismatchElement.innerHTML="<span class='notification-input ni-error'>Too short password</span>";
            	enterPassword.setCustomValidity('Too short password');
      		}else if(reenterPassword.value.length<6){
      			mismatchElement.innerHTML="<span class='notification-input ni-error'>Too short password</span>";
            	reenterPassword.setCustomValidity('Too short password');
      		}
      		else if(document.getElementById("pass").value==document.getElementById("repass").value)
        	{
            	mismatchElement.innerHTML="";
            	enterPassword.setCustomValidity('');
            	reenterPassword.setCustomValidity('');
        	}else{
        		mismatchElement.innerHTML="<span class='notification-input ni-error'>Passwords Mis-match</span>";
        		enterPassword.setCustomValidity('Passwords do not match');
            	reenterPassword.setCustomValidity('Passwords do not match');
        	}
        }
		</script>
        
		<script type="text/javascript">
			$(function() {
			$('.password').pstrength();
			});
        </script>
        <script type="text/javascript">
        function showState(state)
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
            document.getElementById("city").innerHTML=xmlhttp.responseText;
            }
          }
        xmlhttp.open("GET","getBranch.jsp?state="+state,true);
        xmlhttp.send();
        }
        
        function loadHelpSignUp()
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
            document.getElementById("logo").innerHTML="<ul id='nav'><li ><a href='login/login.jsp'>Log In</a></li><li><a href='' onclick='loadAboutUs();return false'>About</a></li><li id='current'><a href='' onclick='loadHelpSignUp();return false'>Help</a></li><li><a href='newEmployee.jsp'>Sign Up</a></li></ul>";
            }
          }
        xmlhttp.open("GET","helpSignUp.jsp",true);
        xmlhttp.send();
        }
        
        function loadAboutUs()
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
            document.getElementById("logo").innerHTML="<ul id='nav'><li ><a href='login/login.jsp'>Log In</a></li><li id='current'><a href='' onclick='loadAboutUs();return false'>About</a></li><li><a href='' onclick='loadHelpSignUp();return false'>Help</a></li><li><a href='newEmployee.jsp'>Sign Up</a></li></ul>";
            }
          }
        xmlhttp.open("GET","aboutUs.html",true);
        xmlhttp.send();
        }
        
        function loadNewEmployee()
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
        xmlhttp.open("GET","newEmployee.jsp",true);
        xmlhttp.send();
        }
		</script>
		
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
xmlhttp.open("POST",to+parameterList,true);
xmlhttp.send();
}
</script>
	</head>
	<body>
				<%

				   connectToDb Con=new connectToDb();
                Connection con=connectToDb.dbconnect();
                Statement statement = con.createStatement();
                   String QueryString = "SELECT STATE FROM DB2ADMIN.BRANCH GROUP BY STATE";
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>
    	<!-- Header -->
        <div id="header">
            <!-- Header. Status part -->
            <div id="header-status">
                <div class="container_12">
                    <div class="grid_8">
					&nbsp;
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
                               <li ><a href="login/login.jsp">Log In</a></li>
                                <li><a href="" onclick="loadAboutUs();return false">About</a></li>
                                <li><a href="" onclick="loadHelpSignUp();return false">Help</a></li>
                                <li id="current"><a href="newEmployee.jsp">Sign Up</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
            <div id="subnav">
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
        
		<div id="container" class="container_12">   
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div><!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
            
            <!-- Form elements -->    
            <div class="grid_12">
            
                <div class="module">
                     <h2><span>New User</span></h2>
                        
                     <div class="module-body">
                        <form action="javascript:loadSubmitForm('newEmployeeForm','newEmployeeAction.jsp')" id="newEmployeeForm" method="post"   style="padding-left:40px">

                            <p><label>Name</label>
                                <input type="text" class="input-short" name="fname" placeholder="First Name" required/>&nbsp;&nbsp;&nbsp;<input type="text" class="input-short" name="lname" placeholder="Surname or Initial"/></p>
                            
                            <p>
                                <label>Designation</label>
                                <select class="input-short" name="designation">
                                    <option value="Data Operator">Data Operator</option>
                                    <option value="Centre Manager">Centre Manager</option>
                                    <option value="Data Manager">Data Manager</option>
                                    <option value="Zonal Chief">Zonal Chief</option>
                                </select>
                            </p>
                            
                            <p><label>State </label>
                                <select class="input-short" name="state" id="state" onmouseout="showState(this.value)">
								<option value="-1"> </option>
								<%	   while(rs.next())
		{ %>
			<option value="<%=rs.getString("STATE")%>"><%=rs.getString("STATE")%></option>
<%		} %>
								</select>
                            </p>
                            
                            <p>
                              <label>City</label>
                            
                                <select class="input-short" name="city" id="city">
                          
								</select>
							 
                            </p>
                            
                            <p>
                              <label>User Name</label>
                              <input type="text" class="input-short" name="username" required/>@ geniobrainiacs.com
                            </p>
                            <p>
                              <label>Pick a password</label>
                              <input class="input-short password" type="password" name="password" id="pass" oninput="checkPasswords()" required/>
                            </p>
                          <p>
                            <label>Repeat password</label>
                              <input type="password" class="input-short"  id="repass" oninput="checkPasswords()" required/>
                              <div id="mismatch"></div>
                            </p>
                            <p>
                              <label>Date of Birth</label>
                              <input type="text" class="input-short" name="day" style="width:30px" placeholder="DD" required/> &nbsp;&nbsp;&nbsp;
                              <select type="text" class="input-short" name="month" style="width:100px" placeholder="MM"> 
                              	<option value="01">January</option>
                              	<option value="02">February</option>
                              	<option value="03">March</option>
                              	<option value="04">April</option>
                              	<option value="05">May</option>
                              	<option value="06">June</option>
                              	<option value="07">July</option>
                              	<option value="08">August</option>
                              	<option value="09">September</option>
                              	<option value="10">October</option>
                              	<option value="11">November</option>
                              	<option value="12">December</option>                         
                              </select> &nbsp;&nbsp;&nbsp;
                              <input type="text" class="input-short" name="year" placeholder="YYYY" style="width:50px" required/>
                            </p>
                            <p>
                              <label>Residential Address</label>
                              <textarea rows="5" cols="50" type="textarea" class="input-short" name="address" required></textarea>
                            </p>
                            <p>
                              <label>Email</label>
                              <input type="text" class="input-short" name="email" required/>
                            </p>
                            <p>
                              <label>Phone Number</label>
                              <input type="text" class="input-short" name="phone" required/>
                            </p>                             
                            <fieldset>
                              <ul>
                                <li></li>
                                    <li></li>
                                </ul>
                            </fieldset>
                            
                            <fieldset>
                                <legend></legend>
</fieldset>
                            
                            <fieldset>
                            </fieldset>
                            
                            <fieldset>
                                <input class="submit-green" type="submit" value="Submit" /> 
                                <input class="submit-gray" type="reset" value="Cancel" />
                            </fieldset>
                        </form>
                     </div> <!-- End .module-body -->

                </div>  <!-- End .module -->
        		<div style="clear:both;"></div>
            </div> <!-- End .grid_12 -->
                
            <!-- Settings-->
            <div class="grid_6"><!-- End .module -->
            </div> <!-- End .grid_6 -->
                
            <!-- Password --><!-- End .grid_6 -->
            <div style="clear:both;"></div><!-- End .grid_3 --><!-- End .grid_3 --><!-- End .grid_6 -->

            
          <div style="clear:both;"></div>
        </div> <!-- End .container_12 -->
		
         <%
         con.close();
         %>  
        <!-- Footer -->
        <div id="footer">
        	<div class="container_12">
            	<div class="grid_12">
                	<!-- You can change the copyright line for your own -->
                	<p align="center">&copy; <a href="" onclick="return false;">Geniobrainiacs 2012</a></p>
        		</div>
            </div>
            <div style="clear:both;"></div>
        </div> <!-- End #footer -->
	</body>
</html>