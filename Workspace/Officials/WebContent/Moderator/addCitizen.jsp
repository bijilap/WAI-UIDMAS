<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*,java.io.*,database.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Approve Citizens</title>
		
		
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/tablesorter.css" media="screen" />
        
        <!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
        <link rel="stylesheet" type="text/css" href="Resources/theme-blue.css" media="screen" />
        <!--<link rel="stylesheet" type="text/css" href="css/theme-red.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-yellow.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-green.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-graphite.css" media="screen" />-->
        
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Resources/jquery-1.3.2.min.js" ></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Resources/jquery.tablesorter.min.js" ></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Resources/jquery.tablesorter.pager.js" ></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Resources/jquery.pstrength-min.1.2.js" ></script>
        
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
        
        <!-- Lightbox -->
		<script type="text/javascript" src="lightbox/js/prototype.js"></script>
		<script type="text/javascript" src="lightbox/js/scriptaculous.js?load=effects,builder"></script>
		<script type="text/javascript" src="lightbox/js/lightbox.js"></script>
		<link rel="stylesheet" href="lightbox/css/lightbox.css" type="text/css" media="screen" />
        
        <script type="text/javascript">
        function approveCitizen(url)
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
            document.getElementById("replacebody").innerHTML=xmlhttp.responseText;
            }
          }
        xmlhttp.open("GET",url,true);
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
                                <li id="current"><a href="addCitizen.jsp">Approve</a></li>
                                <li><a href="searchUID.jsp">Search</a></li>
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
                                
                <a href="addCitizen.jsp" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_user.gif" height="64" alt="edit" />
                	<span>Approve New Citizen</span>
                </a>
                
                <a href="addChanges.jsp" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_stats.gif" width="64" height="64" alt="edit" />
                	<span>Approve Citizen Detail Changes</span>
                </a>
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div>
            
            
            
            <div class="grid_12">
                
             
               <%

				   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT DOR,REG_NO,FNAME,LNAME,MOB_NO,MODERATOR_ID FROM db2admin.REG_FORM ";//WHERE MODERATOR_ID!=modid
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>
                
                <!-- Example table -->
                <div class="module">
                	<h2><span>Applicants for WAI ID</span></h2>
                    
                    <div class="module-table-body" id="replacebody">
                    	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="10%" style="width:10%">Date</th>
                                    <th width="20%" style="width:15%">ID</th>
                                    <th width="19%" style="width:25%">First Name</th>
                                    <th width="19%" style="width:25%">Last Name</th>
                                    <th width="36%" style="width:10%">Contact</th>        
                                    <th width="10%" style="width:15%"></th>                      
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {%> 
                                <tr>
                                    <td><%=rs.getString("DOR")%></td>
                                    <td><%=rs.getString("REG_NO")%></td>
                                    <td><%=rs.getString("FNAME")%></td>
                                    <td><%=rs.getString("LNAME")%></td>
                                    <td><%=rs.getString("MOB_NO")%></td>
                                    <td>
										<a href="" onclick="approveCitizen('approveCitizen.jsp?dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>'); return false;" >Approve</a>                           
                                    </td>
                                </tr>
                            <%
                            }
                           rs.close();
                           statement.close();
                           con.close();
                            %>
                            </tbody>
                        </table>
                        </form>                        
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