<%@ page import="java.sql.*,database.*" %> 
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>

<%
	connectToDb Con=new connectToDb();
    Connection conn = connectToDb.dbconnect();
    int count=0; 
	Statement st;
%>
<textarea rows="7" cols="90" class="input-long" >
<%
    try {
	   String query = request.getParameter("query");
       st = conn.createStatement();
	   count=st.executeUpdate(query);
	   out.println("Query:"+query);
	   out.println("Query OK, "+count+" rows affected");

	}
	catch (Exception e) {
		out.println("Error!");
		out.println(e);
    }
    finally
    {
         conn.close();
    }
 %>
 </textarea>