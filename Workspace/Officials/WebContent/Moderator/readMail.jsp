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
            
            <div style="clear:both;"></div><!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
          
              <%

				   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                   Statement statement = con.createStatement();
                   String QueryString = "SELECT * FROM db2admin.MAILBOX WHERE FROM="+request.getParameter("from")+" AND TIMING="+request.getParameter("time")+" AND DATE="+request.getParameter("date") +" AND SUBJECT="+request.getParameter("sub");
                   System.out.println(QueryString);
                   ResultSet rs = statement.executeQuery(QueryString);
                 %>
                
            
            <!-- Form elements -->    
            <div class="grid_12">
            
                <div class="module">
                     <h2><span>Mail</span></h2>
                        
                     <div class="module-body">
 						<%
                             while (rs.next()) 
                              {%>  
                      <div>   
                      <b>From:</b>   
                      <textarea rows="1" cols="135" readonly><%=rs.getString("FROM")%>
					  </textarea> 
					  </div>
					 <div>
					 <b> Sub.: </b>
					 <textarea rows="2" cols="135" readonly><%=rs.getString("SUBJECT")%>
					 </textarea> 
                     </div> 
                     <textarea rows="20" cols="145" readonly><%=rs.getString("CONTENT")%>	
					 </textarea>   
                        
                     </div> <!-- End .module-body -->

                </div>  <!-- End .module -->
        		<div style="clear:both;"></div>
        		<%} 
        		 rs.close();
                 statement.close();
                 con.close();%>
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
                	<!-- You can change the copyright line for your own -->
                	<p>&copy; 2010. <a href="http://www.templatescreme" title="Visit For More Free Website Templates">Free Website Templates</a></p>
        		</div>
            </div>
            <div style="clear:both;"></div>
        </div> <!-- End #footer -->
	</body>
</html>