<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Admin Help</title>
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
        
        <!-- WYSIWYG editor stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/jquery.wysiwyg.css" media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/tablesorter.css" media="screen" />
        
        <!-- Thickbox stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/thickbox.css" media="screen" />
        
        <!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
        <link rel="stylesheet" type="text/css" href="Resources/theme-blue.css" media="screen" />
        <!--<link rel="stylesheet" type="text/css" href="css/theme-red.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-yellow.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-green.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-graphite.css" media="screen" />-->
        
		
		<style type="text/css">
        heads 
         {
    		color: #0000FF;
    		font-family: "Arial ",Gadget,sans-serif;
    		font-size: 15px;
		 }
        </style>
		
		
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Resources/jquery-1.3.2.min.js" ></script>
        
		<!-- JQuery WYSIWYG plugin script -->
		<script type="text/javascript" src="Resources/jquery.wysiwyg.js" ></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Resources/jquery.tablesorter.min.js" ></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Resources/jquery.tablesorter.pager.js" ></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Resources/jquery.pstrength-min.1.2.js" ></script>
        
		<!-- JQuery thickbox plugin script -->
		<script type="text/javascript" src="Resources/thickbox.js" ></script>
        
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
                                <li><a href="searchUID.jsp">Search</a></li>
                                <li id="current"><a href="">Help</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
            <div id="subnav">
                <div class="container_12">
           
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
        
		<div id="container" class="container_12">
       
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div><!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
            <div align="center"><h1>Help</h1></div>
            <!-- Settings-->
            <div class="grid_6"><!-- End .module -->
            </div> 
            <!-- End .grid_6 -->
                
            <!-- Password --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
                        
            <div >
            <br />
  <p class="heads">&raquo; Login Help</p>
                <p class="ans">&bull;Enter your User id and confidential password. Then click on login button.</p>
                <br />
                  <p class="heads">&raquo;Forgot your password?</p>
                <p class="ans">&bull; Contact the Control  center.</p>
                <br />                   
                 <p class="heads">&raquo;Approve/Reject new citizen's.</p>
                <p class="ans">&bull; Once a citizen fills up the registration form, you will get the request sent to you. Look into the details and proofs, decide whether you should approve or not. </p>
                <br />
                  <p class="heads">&raquo;Send/Receive mails</p>
                <p class="ans">&bull; You have authority to send/receive mails to/from any official. Mails should be kept confidential. Unauthorized use can lead to spam. You can look into new mails in your inbox. While sending the mail for any official, you need to specify the user id and can send the mail to respective official. </p>                 
            </div> <!-- End .grid_6 -->

            
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