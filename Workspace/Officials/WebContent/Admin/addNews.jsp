<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="workspace.GetPath"%>
<%@ page import="gdk.*" %>
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>News Centre</title>
       
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
		<script type="text/javascript" src="Resources/jquery.tablesorter.pager.js" ></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Resources/jquery.pstrength-min.1.2.js"></script>
        
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
			
			function startindexing()
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
	        	  document.getElementById("titular").innerHTML="Indexing Profiles";
	              document.getElementById("replacearea").innerHTML=xmlhttp.responseText;
	            }
	          }
	        xmlhttp.open("GET","../cgi-bin/profileIndex.py",true);
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
			
			
	   function postNews()
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
		            document.getElementById("message").innerHTML=xmlhttp.responseText;
		            }
		          }
		        xmlhttp.open("POST","postNews.jsp?content="+document.getElementById("content").value,true);
		        xmlhttp.send();
		        }
		</script>
        
        <!-- Initiate password strength script -->
		<script type="text/javascript">
			$(function() {
			$('.password').pstrength();
			});
        </script>
	</head>
	<body>
	<%
		
		String content=request.getParameter("content");
		fileIO f=new fileIO();
		String fullPath=request.getRealPath("/");
		String uri = request.getRequestURI();
		GetPath getpath = new GetPath();
		String workspacePath=getpath.returnPath(fullPath,uri);
	%>
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
                                <li id="current"><a href="addNews.jsp">Control Centre</a></li>
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
            <div id="subnav">
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
        
		<div id="container" class="container_12">
        

            
            <!-- Dashboard icons -->
          <div class="grid_7">
            	<a href="addNews.jsp" class="dashboard-module">
                	<img src="Resources/news.png"  width="64" height="64" alt="edit" />
                	<span>Edit News</span>
                </a>
                
                <a href="query.jsp" class="dashboard-module">
                	<img src="Resources/query.png" width="64" height="64" alt="edit" />
                	<span>Sql Centre</span>
                </a>
                
                <a href="backupCentre.jsp" class="dashboard-module">
                	<img src="Resources/backtore.png" width="64" height="64" alt="edit" />
                	<span>Back Up & Restore</span>
                </a>
                
                <a href="" class="dashboard-module" onclick="startindexing(); return false;">
                	<img src="Resources/search3.png" width="64" height="64" alt="edit" />
                	<span>Millipede Indexer</span>
                </a>
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <!-- Account overview --><!-- End .grid_5 -->
            
          <div style="clear:both;"></div><!-- End .grid_12 -->
                
            <!-- Categories list --><!-- End .grid_6 -->
            
            <!-- To-do list --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
            
            <!-- Form elements -->    
            <div class="grid_12">
            
                <div class="module">
                	<div id="titular">
                     <h2><span>News Centre</span></h2>
                    </div>    
                     <div class="module-body" id="replacearea">
                       <form action="">
                        
                            <div></div>
                           <p>
                              <label>Editor</label>
                              <textarea rows="24" class="input-long" name="content" id="content">
                              <%
							    out.println(f.reader(workspacePath+"\\news.txt"));                              
                              %>
                              </textarea>
                            </p>
                            
                          <p>
                            <input class="submit-green" type="button" value="Post" onmousedown="postNews()"/>
                          </p>
                          <p id="message">
                          </p>
                            <fieldset>
                                <legend></legend>
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
          <div style="clear:both;"></div>
            
		  <div class="grid_3">
			<h1>&nbsp;</h1>
		  </div> 
			<!-- End .grid_3 -->
            
            
            <div class="grid_3">
            	<p>&nbsp;</p>
</div> <!-- End .grid_3 -->
            
            <div class="grid_6">
            	<p>&nbsp;</p>
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