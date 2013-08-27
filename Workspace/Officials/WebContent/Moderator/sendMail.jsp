<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd" > 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="database.*" %> 

<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>

<html>
<head>
<title>Send Mail</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="This is where you update prisoner info" />
  <link rel="stylesheet" type="text/css" media="screen" href="css/default.css" />
</head>
<body id="index_page"> 
	<div id="wrapper">
		<div id="content">

<%

   
   Connection con = null;
   connectToDb Con=new connectToDb();
 
   java.util.Date todaysDate = new java.util.Date();
   
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
   String dt =formatter.format(todaysDate);  // Start date 
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
   Calendar c = Calendar.getInstance();
   c.setTime(sdf.parse(dt)); 
   c.add(Calendar.DATE, 0);
   dt = sdf.format(c.getTime()); 
   Calendar cal = new GregorianCalendar();

   int hour24 = cal.get(Calendar.HOUR_OF_DAY);     
   int min = cal.get(Calendar.MINUTE);             
   int sec = cal.get(Calendar.SECOND);
   
   String  time="";
   if(min<9 && sec>9)
    {time="'"+hour24+":0"+min+":"+sec+"'";}
   else if(min<9 && sec<9)
   {time="'"+hour24+":0"+min+":0"+sec+"'";}
   else if(min>9 && sec<9)
   {time="'"+hour24+":"+min+":0"+sec+"'";}
   else
   {time="'"+hour24+":"+min+":"+sec+"'";}
    time+=",";
     con = connectToDb.dbconnect();
     try{
       Statement st = con.createStatement();
       
       String to ="'"+request.getParameter("to")+"',";
       String from ="'"+session.getAttribute("userid").toString()+"',";
       String sub ="'"+request.getParameter("sub")+"',";
       String content ="'"+request.getParameter("content")+"',";
       String date="'"+dt+"'";
    
       String query="INSERT INTO db2admin.MAILBOX(TO,FROM,SUBJECT,CONTENT,TIMING,DATE) VALUES("+to+from+sub+content+time+date+")";
       System.out.println(query);
       int val = st.executeUpdate(query);
       System.out.println(val+"row(s) of log updated");%>
      
     <%
     }
     catch (SQLException s){
       System.out.println("Database Connection Failed!");
     }
%>
<jsp:forward page="outbox.jsp"></jsp:forward>
		</div>
	</div>
</body>
</html> 
