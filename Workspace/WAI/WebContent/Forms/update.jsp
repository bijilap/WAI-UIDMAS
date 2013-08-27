<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
       
        <!-- Fluid 960 Grid System - CSS framework -->
		<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
		
        <!-- IE Hacks for the Fluid 960 Grid System -->
        <!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" media="screen" /><![endif]-->
        
        <!-- Main stylesheet -->
        <link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
     	 <link href="default.css" rel="stylesheet" type="text/css" />
     	 <style>
#myContent
{
	margin: 50px 0 0 270px;
    width: 740px;
}
a.dashboard-module, 
a.dashboard-module:visited { 
	width: 142px; 
	height: 142px; 
	display: block; 
	float: left; 
	background: url(Resources/dashboard-module.gif) top left no-repeat; 
	margin: 0 6px 8px 0;  
	text-align: center; 
	color: #444444; 
	}
	
a.dashboard-module:hover, 
a.dashboard-module:active { 
	background-position: bottom left;
	text-decoration: none; 
	color:#0063be; 
	}

a.dashboard-module img { 
	margin-top: 20px; 
	}
	
a.dashboard-module span { 
	margin-top: 10px; 
	display: block; 
	}

</style>
</head>
<body>
<form action="updateContact.jsp">
	<div align="center">
		<table>
			<tr>
				<td>
					<div align="center">
					<label for="uid">Enter the uid to update :</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
					<input type="text" name="uid" required id="uid" maxlength="13" pattern="(.){13,13}"></pre>
					</div>
				</td>
			</tr>
			<tr>
				<td><br/></td>
			</tr>
			<tr>
				<td>
					<div align="center">
					<input type="submit" value="submit" align="middle">
					</div>
				</td>
			</tr>	
		</table>
	</div>
</form>

</body>
</html>