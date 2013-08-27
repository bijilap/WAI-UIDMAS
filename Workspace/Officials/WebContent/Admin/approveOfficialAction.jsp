<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 
<%@ page import="gdk.*" %> 
<%@ page import="genID.*" %> 

<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>

<%


Connection con = null;
connectToDb Con=new connectToDb();   
con = connectToDb.dbconnect();
String QueryString;
Statement st = con.createStatement();
if((request.getParameter("task")).equals("yes"))
{
try
{
		if(request.getParameter("type").equals("A")||request.getParameter("type").equals("M"))
		{
		eidGenerator gen=new eidGenerator();
		String eid=gen.start();
		for(int j=0;j<100;j++)
		{
			eid=gen.start();
			System.out.println(eid);
		}
		QueryString = "UPDATE db2admin.EMPLOYEE SET ACC_STATUS='A',TYPE='"+request.getParameter("type")+"',E_ID='"+eid+"' WHERE E_ID="+request.getParameter("uid");
		System.out.println(QueryString);
		st.executeUpdate(QueryString);
		QueryString = "UPDATE db2admin.OFFICIALS SET TYPE='"+request.getParameter("type")+"',E_ID='"+eid+"' WHERE E_ID="+request.getParameter("uid");
		System.out.println(QueryString);
		st.executeUpdate(QueryString);
		}
		else if(request.getParameter("type").equals("L"))
		{
			QueryString = "UPDATE db2admin.EMPLOYEE SET ACC_STATUS='L',TYPE='L' WHERE E_ID="+request.getParameter("uid");
			System.out.println(QueryString);
			st.executeUpdate(QueryString);
			QueryString = "UPDATE db2admin.OFFICIALS SET TYPE='L' WHERE E_ID="+request.getParameter("uid");
			System.out.println(QueryString);
			st.executeUpdate(QueryString);
		}
}
catch (SQLException s){
    System.out.println("Database Connection Failed!");
    s.printStackTrace();
  }
finally
{
	response.sendRedirect("addOfficials.jsp");
}
}
else
{
	QueryString = "DELETE  FROM db2admin.EMPLOYEE WHERE E_ID='"+request.getParameter("uid")+"'";
    System.out.println(QueryString);
   	st.executeUpdate(QueryString);
   	QueryString = "DELETE  FROM db2admin.OFFICIALS WHERE E_ID='"+request.getParameter("uid")+"'";
    System.out.println(QueryString);
   	st.executeUpdate(QueryString);
   	response.sendRedirect("addOfficials.jsp");
}
%>
