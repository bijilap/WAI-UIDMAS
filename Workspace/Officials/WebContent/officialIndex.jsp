<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Magic Admin. Advanced, Beautiful and Customizable Admin Template.</title>
       
        <!-- CSS Reset -->
		<link rel="stylesheet" type="text/css" href="Admin/Resources/reset.css" tppabs="http://www.xooom.pl/work/magicadmin/css/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Admin/Resources/grid.css" tppabs="http://www.xooom.pl/work/magicadmin/css/grid.css" media="screen" />
        
<link rel="stylesheet" type="text/css" href="Admin/Resources/default.css" tppabs="" media="screen" />        
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/styles.css" tppabs="http://www.xooom.pl/work/magicadmin/css/styles.css" media="screen" />
        
        <!-- WYSIWYG editor stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/jquery.wysiwyg.css" tppabs="http://www.xooom.pl/work/magicadmin/css/jquery.wysiwyg.css" media="screen" />
        
        <!-- Table sorter stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/tablesorter.css" tppabs="http://www.xooom.pl/work/magicadmin/css/tablesorter.css" media="screen" />
        
        <!-- Thickbox stylesheet -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/thickbox.css" tppabs="http://www.xooom.pl/work/magicadmin/css/thickbox.css" media="screen" />
        
        <!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
        <link rel="stylesheet" type="text/css" href="Admin/Resources/theme-blue.css" tppabs="http://www.xooom.pl/work/magicadmin/css/theme-blue.css" media="screen" />
        <!--<link rel="stylesheet" type="text/css" href="css/theme-red.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-yellow.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-green.css" media="screen" />-->
        <!--<link rel="stylesheet" type="text/css" href="css/theme-graphite.css" media="screen" />-->
        
		<!-- JQuery engine script-->
		<script type="text/javascript" src="Admin/Resources/jquery-1.3.2.min.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery-1.3.2.min.js"></script>
        
		<!-- JQuery WYSIWYG plugin script -->
		<script type="text/javascript" src="Admin/Resources/jquery.wysiwyg.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.wysiwyg.js"></script>
        
        <!-- JQuery tablesorter plugin script-->
		<script type="text/javascript" src="Admin/Resources/jquery.tablesorter.min.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.min.js"></script>
        
		<!-- JQuery pager plugin script for tablesorter tables -->
		<script type="text/javascript" src="Admin/Resources/jquery.tablesorter.pager.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.pager.js"></script>
        
		<!-- JQuery password strength plugin script -->
		<script type="text/javascript" src="Admin/Resources/jquery.pstrength-min.1.2.js" tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.pstrength-min.1.2.js"></script>
        
		<!-- JQuery thickbox plugin script -->
		<script type="text/javascript" src="Admin/Resources/thickbox.js" tppabs="http://www.xooom.pl/work/magicadmin/js/thickbox.js"></script>
        
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
                <div class="container_12">
                    <div class="grid_12">
                        <ul>
                            <li><a href="#">link 1</a></li>
                            <li><a href="#">link 2</a></li>
                            <li><a href="#">link 3</a></li>
                            <li><a href="#">link 4</a></li>
                            <li><a href="#">link 5</a></li>
                        </ul>
                        
                    </div><!-- End. .grid_12-->
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
        
		<div class="container_12">
        

            
            <!-- Dashboard icons -->
          <div class="grid_7">
            	<a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_write.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>New article</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_file.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_file.gif" width="64" height="64" alt="edit" />
                	<span>Upload file</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_files.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_files.gif" width="64" height="64" alt="edit" />
                	<span>Articles</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_calendar.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_calendar.gif" width="64" height="64" alt="edit" />
                	<span>Calendar</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_user.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_user.gif" width="64" height="64" alt="edit" />
                	<span>My profile</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_stats.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_stats.gif" width="64" height="64" alt="edit" />
                	<span>Stats</span>
                </a>
                
                <a href="" class="dashboard-module">
                	<img src="Admin/Resources/Crystal_Clear_settings.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_settings.gif" width="64" height="64" alt="edit" />
                	<span>Settings</span>
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
            
                <div class="module"><span class="notification n-success">Success notification.</span> <!-- End .module-body -->

              </div>  
                <!-- End .module -->
        		<div style="clear:both;"></div>
            </div> <!-- End .grid_12 -->
                
            <!-- Settings-->
            <div class="grid_6"><!-- End .module -->
            </div> 
            <!-- End .grid_6 -->
                
            <!-- Password --><!-- End .grid_6 -->
          <div style="clear:both;"></div>
            
			<div class="grid_3">
				<div id="login" class="boxed">
			<h2 class="title">Login</h2>
			<div class="content">
				<form id="login" method="post" action="loginAction.jsp">
					
					
					<label for="UID"><b><i>User ID:</i></b></label>
					<input id="USERID" type="text" name="USERID" value="" />
					<label for="password"><b><i>Password:</i></b></label>
					<input id="password" type="password" name="password" value="" /><br />
				
					<div id=message>
					</div>
					<input id="signIn" type="submit" name="signIn" value="Sign In" />
					<p><a href="#">Forgot your password?</a></p>
					<div id=message>
					</div>
					
				</form>
			</div>
		</div>
            </div> <!-- End .grid_3 -->
            
            
            <div class="grid_3">
            	<p>Unordered list:</p>
                <ul class="bullets">
                	<li>UL Element 1</li>
                    <li>UL Element 2</li>
                    <li>UL Element 3</li>
                    <li>UL Element 4</li>
                    <li>UL Element 5</li>
                </ul>
            	<p>Ordered list:</p>
                <ol>
                	<li>OL Element 1</li>
                    <li>OL Element 2</li>
                    <li>OL Element 3</li>
                    <li>OL Element 4</li>
                    <li>OL Element 5</li>
                </ol>
            </div> <!-- End .grid_3 -->
            
            <div class="grid_6">
            	<p>Paragraph text:</p>
            
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel nibh sit amet metus lacinia hendrerit. Nullam tempus sem ut quam luctus rhoncus. Nullam vitae justo ligula, nec sollicitudin mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam ut mauris quis sapien adipiscing porttitor vitae at mauris. Fusce imperdiet placerat nunc tincidunt varius. Quisque tempus, nibh ac tempus faucibus, elit lorem aliquam mauris, facilisis ornare nisl sapien eu mi. Vivamus ac tempor nulla. Fusce ac lectus sapien. Aliquam commodo urna nec leo tincidunt non ultrices augue consequat. Curabitur justo risus, placerat eu auctor et, scelerisque vitae velit. Mauris venenatis nisl ut elit congue in euismod libero ultrices. Duis tincidunt sagittis velit, in auctor elit molestie sit amet.</p> 
                
                <p>Vivamus tellus magna, malesuada ac cursus sed, facilisis non ligula. Nam porta ullamcorper nibh id sagittis. Mauris risus nisi, dictum eget feugiat in, egestas in diam. Nulla dictum pharetra bibendum. Morbi turpis sapien, dignissim congue dignissim in, laoreet non felis. Sed elit turpis, interdum cursus vulputate ut, consectetur eget odio. Morbi dolor velit, volutpat auctor aliquet id, auctor sit amet neque. Curabitur id quam sit amet est sagittis posuere. Sed a nunc eros, hendrerit pulvinar felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget felis eget neque tristique scelerisque sed et magna.</p> 
                
            </div> <!-- End .grid_6 -->

            
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