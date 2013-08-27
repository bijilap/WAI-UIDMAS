<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*,java.io.*,database.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Approve Citizens</title>
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Resources/reset.css" tppabs="http://www.xooom.pl/work/magicadmin/css/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css" tppabs="http://www.xooom.pl/work/magicadmin/css/grid.css" media="screen" />
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css" tppabs="http://www.xooom.pl/work/magicadmin/css/styles.css" media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/tablesorter.css" tppabs="http://www.xooom.pl/work/magicadmin/css/tablesorter.css" media="screen" />
        
        <!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
        <link rel="stylesheet" type="text/css" href="Resources/theme-blue.css" tppabs="http://www.xooom.pl/work/magicadmin/css/theme-blue.css" media="screen" />
        <!--<link rel="stylesheet" type="text/css" href="css/theme-red.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-yellow.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-green.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-graphite.css" media="screen" />-->
        
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Resources/jquery-1.3.2.min.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery-1.3.2.min.js"></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Resources/jquery.tablesorter.min.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.min.js"></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Resources/jquery.tablesorter.pager.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.pager.js"></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Resources/jquery.pstrength-min.1.2.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.pstrength-min.1.2.js"></script>
        
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
                        <a href="" id="logout">
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
                                <li id="current"><a href="">Dashboard</a></li>
                                <li><a href="">Articles</a></li>
                                <li><a href="">Files</a></li>
                                <li><a href="">Profile</a></li>
                                <li><a href="">Settings</a></li>
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
        
		<div class="container_12">
        

            
            <!-- Dashboard icons -->
            <div class="grid_7">
            	<a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_write.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>New article</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_file.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_file.gif" width="64" height="64" alt="edit" />
                	<span>Upload file</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_files.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_files.gif" width="64" height="64" alt="edit" />
                	<span>Articles</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_calendar.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_calendar.gif" width="64" height="64" alt="edit" />
                	<span>Calendar</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_user.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_user.gif" width="64" height="64" alt="edit" />
                	<span>My profile</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_stats.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_stats.gif" width="64" height="64" alt="edit" />
                	<span>Stats</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Resources/Crystal_Clear_settings.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_settings.gif" width="64" height="64" alt="edit" />
                	<span>Settings</span>
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
										<a href="" onmouseover="approveCitizen('approveCitizen.jsp?dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>')" >Approve</a>                           
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
                        <div class="pager" id="pager">
                            <form action="">
                                <div>
                                <img class="first" src="Resources/arrow-stop-180.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop-180.gif" alt="first"/>
                                <img class="prev" src="Resources/arrow-180.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-180.gif" alt="prev"/> 
                                <input type="text" class="pagedisplay input-short align-center"/>
                                <img class="next" src="Resources/arrow.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow.gif" alt="next"/>
                                <img class="last" src="Resources/arrow-stop.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop.gif" alt="last"/> 
                                <select class="pagesize input-short align-center">
                                    <option value="10" selected="selected">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                </select>
                                </div>
                            </form>
                        </div>
                        <div class="table-apply">
                            <form action="">
                            <div>
                            <span>Apply action to selected:</span> 
                            <select class="input-medium">
                                <option value="1" selected="selected">Select action</option>
                                <option value="2">Publish</option>
                                <option value="3">Unpublish</option>
                                <option value="4">Delete</option>
                            </select>
                            </div>
                            </form>
                        </div>
                        <div style="clear: both"></div>
                  </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
                
                
                     <div class="pagination">           
                		<a href="" class="button"><span><img src="Resources/arrow-stop-180-small.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop-180-small.gif" height="9" width="12" alt="First" /> First</span></a> 
                        <a href="" class="button"><span><img src="Resources/arrow-180-small.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-180-small.gif" height="9" width="12" alt="Previous" /> Prev</span></a>
                        <div class="numbers">
                            <span>Page:</span> 
                            <a href="">1</a> 
                            <span>|</span> 
                            <a href="">2</a> 
                            <span>|</span> 
                            <span class="current">3</span> 
                            <span>|</span> 
                            <a href="">4</a> 
                            <span>|</span> 
                            <a href="">5</a> 
                            <span>|</span> 
                            <a href="">6</a> 
                            <span>|</span> 
                            <a href="">7</a> 
                            <span>|</span> 
                            <span>...</span> 
                            <span>|</span> 
                            <a href="">99</a>
                        </div> 
                        <a href="" class="button"><span>Next <img src="Resources/arrow-000-small.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-000-small.gif" height="9" width="12" alt="Next" /></span></a> 
                        <a href="" class="button last"><span>Last <img src="Resources/arrow-stop-000-small.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop-000-small.gif" height="9" width="12" alt="Last" /></span></a>
                        <div style="clear: both;"></div> 
                     </div>
                
                

                
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
                	<p>&copy; 2010. <a href="http://www.templatescreme" title="Visit For More Free Website Templates">Free Website Templates</a></p>
        		</div>
            </div>
            <div style="clear:both;"></div>
        </div> <!-- End #footer -->
	</body>
</html>