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
		<title>WAI Mail: Compose</title>
       
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
                                <li><a href="adminProfile.jsp">Home</a></li>
                                <li><a href="addNews.jsp">Control Centre</a></li>
                                <li id="current"><a href="inbox.jsp">Mail</a></li>
                                <li><a href="addOfficials.jsp">Approve</a></li>
                                <li><a href="search.jsp">Search</a></li>
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
        
		<div class="container_12">
        

            
            <!-- Dashboard icons -->
            <div class="grid_7">
            	<a href="composeMail.jsp" class="dashboard-module">
                	<img src="Resources/compose1.png"  width="64" height="64" alt="edit" />
                	<span>Compose mail</span>
                </a>
                
                <a href="inbox.jsp" class="dashboard-module">
                	<img src="Resources/inbox.png"  width="64" height="64" alt="edit" />
                	<span>Inbox</span>
                </a>
                
                <a href="outbox.jsp" class="dashboard-module">
                	<img src="Resources/outbox.png"  width="64" height="64" alt="edit" />
                	<span>Outbox</span>
                </a>
                
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div>
            
            
            
            <div class="grid_12">
                
                <!-- Notification boxes -->
                <div class="bottom-spacing">
                                
                    
              </div>
               <%

				   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT * FROM db2admin.MAILBOX WHERE TO='"+session.getAttribute("userid").toString()+"' ORDER BY DATE DESC, TIMING DESC";
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>
                
                <!-- Example table -->
                <div class="module">
                	<h2><span>Inbox</span></h2>
                    
                    <div class="module-table-body">
                    	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="20%" style="width:20%">Sender</th>
                                    <th width="45%" style="width:45%">Subject</th>
                                    <th width="10%" style="width:10%">Time</th>
                                    <th width="10%" style="width:10%">Date</th>
                                    <th width="15%" style="width:15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {%> 
                                <tr>
                                    <td><%=rs.getString("FROM")%></td>
                                    <td><a href="readMail.jsp?sub='<%=rs.getString("SUBJECT")%>'&date='<%=rs.getString("DATE")%>'&time='<%=rs.getString("TIMING")%>'&from='<%=rs.getString("FROM")%>'"><%=rs.getString("SUBJECT")%></a></td>
                                    <td><%=rs.getString("TIMING")%></td>
                                    <td><%=rs.getString("DATE")%></td>
                                    <td>
                                    	<input type="checkbox" />
                                        <a href="deleteMail.jsp?sub='<%=rs.getString("SUBJECT")%>'&date='<%=rs.getString("DATE")%>'&time='<%=rs.getString("TIMING")%>'&from='<%=rs.getString("FROM")%>'"><img src="Resources/bin.gif" /></a>
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