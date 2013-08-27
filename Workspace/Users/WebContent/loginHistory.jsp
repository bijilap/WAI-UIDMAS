<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String uid=session.getAttribute("userid").toString();
	Connection con=connectToDb.dbconnect();
	String sql="SELECT SESSIONID, INTIME, OUTTIME, COUNTRY, PROVINCE, CITY FROM db2admin.USER_SIGNIN_LOG WHERE UID=? ORDER BY INTIME DESC";
	PreparedStatement pst=con.prepareStatement(sql);
	pst.setString(1, uid);
%>
<h2>Login History</h2>
<table>
<tr>
	<th>Session ID</th>
	<th>Login Time</th>
	<th>Logout Time</th>
	<th>Location</th>
</tr>
<%
int i=0;
ResultSet rs=pst.executeQuery();
while(rs.next())
{
	if(i>5)
		break;
%>
<tr>
	<td><%=rs.getString("SESSIONID") %></td>
	<td><%=rs.getString("INTIME") %></td>
	<td><%=rs.getString("OUTTIME")%></td>
	<td><%=rs.getString("CITY")%>, <%=rs.getString("PROVINCE")%>, <%=rs.getString("COUNTRY")%></td>
</tr>
<% 
i++;
}
con.close();
%>
</table>