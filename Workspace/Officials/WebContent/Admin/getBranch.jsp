<%@ page import="java.sql.*,database.*" %> 
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<%
	String state = request.getParameter("state").toString();
	connectToDb Con=new connectToDb();
    Connection conn = connectToDb.dbconnect();
    int sumcount=0; 
	Statement st;
    try {
	    String query = "SELECT * FROM DB2ADMIN.BRANCH WHERE STATE='"+state+"'";
       st = conn.createStatement();
	   ResultSet  rs = st.executeQuery(query);
%>

<%	   while(rs.next())
		{ %>
			<option value="<%=rs.getString("CODE")%>"><%=rs.getString("CITY")%></option>
<%		}

	}
	catch (Exception e) {
      e.printStackTrace();
    }
    finally
    {
         conn.close();
    }
 %>