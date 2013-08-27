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
                                <li id="current"><a href="adminProfile.jsp">Home</a></li>
                                <li><a href="addNews.jsp">Control Centre</a></li>
                                <li><a href="inbox.jsp">Mail</a></li>
                                <li><a href="addOfficials.jsp">Approve</a></li>
                                <li><a href="searchEID.jsp">Search</a></li>
                                <li><a href="help.jsp">Help</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
        </div> <!-- End #header -->
        
		<div id="container" class="container_12">
        

            
            <!-- Dashboard icons -->
            <div class="grid_7">
                <a href="apiStatistics.jsp" class="dashboard-module">
                	<img src="Resources/api.jpg" width="64" height="64" alt="edit" />
                	<span>API Usage Statistics</span>
                </a>
                
                <a href="loginStatistics.jsp" class="dashboard-module">
                	<img src="Resources/login.jpg" width="64" height="64" alt="edit" />
                	<span>Login Statistics</span>
                </a>
                
                <a href="apiClientStat.jsp" class="dashboard-module">
                	<img src="Resources/employee.png" width="64" height="64" alt="edit" />
                	<span>Top API Clients</span>
                </a>
                
                <a href="genderRatio.jsp" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_stats.gif" width="64" height="64" alt="edit" />
                	<span>Gender Ratio</span>
                </a>                
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <!-- Account overview --><!-- End .grid_5 -->
            
            <div style="clear:both;"></div><!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
           <%
String userid=session.getAttribute("userid").toString();
String eid=null;
String uid=null;
String email=null;
connectToDb Con=new connectToDb();
Connection con=connectToDb.dbconnect();
Statement statement = con.createStatement();

try
{
	
	String qs="";
	eid=session.getAttribute("eid").toString();
	ResultSet rs;
	//qs="SELECT * FROM DB2ADMIN.CONTACT,DB2ADMIN.NOMINAL_ROLL WHERE DB2ADMIN.CONTACT.UID='"+uid+"'AND DB2ADMIN.CONTACT.UID=DB2ADMIN.NOMINAL_ROLL.UID";
	qs="SELECT FNAME,LNAME,E.E_ID,DESIGNATION,BRANCH,DOB,EMAIL,PHONE, ADDRESS,CITY FROM DB2ADMIN.EMPLOYEE E, DB2ADMIN.BRANCH B WHERE E.BRANCH=B.CODE AND E_ID='"+eid+"'";
	System.out.println(qs);
	rs = statement.executeQuery(qs);
%>
            
            <!-- Form elements -->    
            <div class="grid_12">
            
                <div class="module">
                <% if(rs.next())
                	{
                %>
                     <h2><span>Reports Centre</span></h2>
                        
                     <div class="module-body">
                        <form action="">
                          <p>
                          Reports Centre is the place to get statistics related to the WAI Project. Statistics 
                          are the corner stone for obtaining vital parameters. <br>
                          The API is a vital component of the WAI Project. The Reports Centre displays the statistics pertaining to number of API logins and top 5 API clients. <br>
                          WAI also provides information regarding the population such as gender ratio. <br>
                          WAI provides each user with an unique user page. Here the no. of logins per week can also be seen.
                          </p>
                       
   
        	<table style="border: 0px">
        	<thead> </thead>
        	</table>
        </div>
        </div>
        <%
	}
}
catch(Exception e)
{
	out.println(e);
	e.printStackTrace();
}

%>
                            
                
                          <p>
                            <label></label>
                            </p>
                                
                            <fieldset>
                              <ul>
                                  <li></li>
                                    <li></li>
                              </ul>
                              
                          </fieldset>
                            
                            <fieldset>
                              <ul>
                                <li></li>
                                    <li></li>
                              </ul>
                          </fieldset>
                            
                            <fieldset>
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