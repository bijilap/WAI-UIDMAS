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
        
        <!-- Thickbox stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/thickbox.css"  media="screen" />
        
        <link rel="stylesheet" type="text/css" href="Resources/theme-blue.css"  media="screen" />
        
 
		
		<link class="include" rel="stylesheet" type="text/css" href="jsCharts/jquery.jqplot.min.css" />
    	<link rel="stylesheet" type="text/css" href="jsCharts/examples.min.css" />
    	<link type="text/css" rel="stylesheet" href="jsCharts/syntaxhighlighter/styles/shCoreDefault.min.css" />
    	<link type="text/css" rel="stylesheet" href="jsCharts/syntaxhighlighter/styles/shThemejqPlot.min.css" />

        <script class="include" type="text/javascript" src="jsCharts/jquery.min.js"></script>
        <style type="text/css">
    
    	.note {
        	font-size: 0.8em;
    	}
    	.jqplot-yaxis-tick {
      	white-space: nowrap;
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
        </div> <!-- End #header -->
        <div id="header-main"> </div>
		 <div id="container" class="container_12">
		         

            
            <div style="clear: both;"></div>
            <!-- Dashboard icons -->
            <div><br><br><br></br></div>
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
             </div>
            <%
            Connection con=connectToDb.dbconnect();
            Statement statement = con.createStatement();
            ResultSet rs;
            String query="";
            String wk1="",wk2="",wk3="",wk4="",wk5="",wk6="";
            try
            {
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)) AND LOGIN_TIME>((current timestamp)- 7 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk6=""+rs.getInt("COUNT");	
            	}
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)- 7 DAY) AND LOGIN_TIME>((current timestamp)- 14 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk5=""+rs.getInt("COUNT");	
            	}
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)- 14 DAY) AND LOGIN_TIME>((current timestamp)- 21 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk4=""+rs.getInt("COUNT");	
            	}
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)- 21 DAY) AND LOGIN_TIME>((current timestamp)- 28 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk3=""+rs.getInt("COUNT");	
            	}
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)- 28 DAY) AND LOGIN_TIME>((current timestamp)- 35 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk2=""+rs.getInt("COUNT");	
            	}
            	query="SELECT count(*) AS COUNT FROM DB2ADMIN.API_USAGE,sysibm.sysdummy1 WHERE LOGIN_TIME<=((current timestamp)- 35 DAY) AND LOGIN_TIME>((current timestamp)- 42 DAY)";
            	rs=statement.executeQuery(query);
            	if(rs.next())
            	{
            		wk1=""+rs.getInt("COUNT");	
            	}
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            }
            %>
        <div class="container_12">
         <div class="grid_12">    
			<div class="module">
			    <table>
				<tr><th><span>API Usage Statistics</span></th></tr>
				</table>
				<div style="padding:15px; padding-left:35px"><div id="chart1" style="height:450px; width:700px;"></div>
				<script class="code" type="text/javascript">
					$(document).ready(function(){
  						var plot1 = $.jqplot ('chart1', [[<%=wk1%>,<%=wk2%>,<%=wk3%>,<%=wk4%>,<%=wk5%>,<%=wk6%>]],{
  							 	axesDefaults: {
  							 		
  							 	},
  								 axes: {
  							        // options for each axis are specified in seperate option objects.
  							        xaxis: {
  							          label: "Week",
  							          // Turn off "padding".  This will allow data point to lie on the
  							          // edges of the grid.  Default padding is 1.2 and will keep all
  							          // points inside the bounds of the grid.
  							          pad: 0
  							        },
  							        yaxis: {
  							          label: "No. of API Logins",
  							         
  							        }
  							      }			
					});
  						
					});
				</script>
				</div>
			</div>
		 </div>
		</div>
		<script class="include" type="text/javascript" src="jsCharts/jquery.jqplot.min.js"></script>
    	<script type="text/javascript" src="jsCharts/syntaxhighlighter/scripts/shCore.min.js"></script>
    	<script type="text/javascript" src="jsCharts/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
    	<script type="text/javascript" src="jsCharts/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
    
    	<script class="include" language="javascript" type="text/javascript" src="jsCharts/plugins/jqplot.canvasTextRenderer.min.js"></script>
    	<script class="include" language="javascript" type="text/javascript" src="jsCharts/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>

           
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