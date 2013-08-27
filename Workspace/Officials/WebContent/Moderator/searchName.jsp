<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*,java.io.*,database.*" %>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>WAI Search</title>
       
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
        
        <!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
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
		<script type="text/javascript" src="Resources/thickbox.js" ></script>
        
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
		
		<script type="text/javascript">
		function search()
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
            document.getElementById("results").innerHTML=xmlhttp.responseText;
            }
          }
        xmlhttp.open("POST","searchNameAction.jsp?content="+document.getElementById("bar").value,true);
        xmlhttp.send();
        }
		
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
                                <li><a href="moderatorProfile.jsp">Home</a></li>
                                <li><a href="inbox.jsp">Mail</a></li>
                                <li><a href="addCitizen.jsp">Approve</a></li>
                                <li id="current"><a href="searchUID.jsp">Search</a></li>
                                <li><a href="help.jsp">Help</a></li>
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
        

            
            <!-- Dashboard icons -->
            <div class="grid_7">
            	<a href="searchUID.jsp" class="dashboard-module">
                	<img src="images/search2.png"  width="64" height="64" alt="edit" />
                	<span>UID Wise</span>
                </a>
                
                <a href="searchName.jsp" class="dashboard-module">
                	<img src="images/search3.png"  width="64" height="64" alt="edit" />
                	<span>Name Wise</span>
                </a>
                
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div>
            
            <div class="grid_6">
            <form action="">
			<fieldset>
			<h2>WAI Search</h2>
			<input class="input-long" type="text" id="bar" onkeypress="search()">
			<input class="submit-green" type="submit" value="Search">
			</fieldset>
			</form>
            </div>
            
            <div class="grid_12">
                
                <!-- Notification boxes -->
                <div class="bottom-spacing">
                                
                    
              </div>
                <!-- Example table -->
                <div class="module">
                	<h2><span>Search Results</span></h2>
                    
                    <div class="module-table-body" id="results">
                    	                        
                        <div style="clear: both"></div>
                  </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
		  </div> <!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
            
            <!-- Form elements --><!-- End .grid_12 -->
                
            <!-- Settings-->
            <div class="grid_6"><!-- End .module -->
            </div> <!-- End .grid_6 -->
                
            <!-- Password --><!-- End .grid_6 -->
            <div style="clear:both;"></div><!-- End .grid_3 --><!-- End .grid_3 --><!-- End .grid_6 -->

            
          <div style="clear:both;"></div>
        </div> <!-- End .container_12 -->
		
           
        <!-- Footer -->
        <div id="footer">
        	<div class="container_12">
            	<div class="grid_12">
                	<!-- You can change the copyright line for your own -->
                	<p align="center">&copy; <a onclick="loadFooter()" style=cursor:default >Geniobrainiacs 2012</a></p>
        		</div>
            </div>
            <div style="clear:both;"></div>
        </div> <!-- End #footer -->
	</body>
</html>