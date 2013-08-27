
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 
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
     try{
       Statement st = con.createStatement();
       
       String uid =request.getParameter("content");
       uid=uid.toUpperCase();
       String QueryString = "SELECT DB2ADMIN.EMPLOYEE.E_ID,FNAME,LNAME,CITY,STATE,USERID,DB2ADMIN.EMPLOYEE.TYPE FROM DB2ADMIN.EMPLOYEE, DB2ADMIN.BRANCH, DB2ADMIN.OFFICIALS WHERE DB2ADMIN.EMPLOYEE.BRANCH=DB2ADMIN.BRANCH.CODE AND DB2ADMIN.EMPLOYEE.E_ID=DB2ADMIN.OFFICIALS.E_ID AND (UPPER(DB2ADMIN.EMPLOYEE.FNAME) LIKE '%"+uid+"%' OR UPPER(DB2ADMIN.EMPLOYEE.LNAME) LIKE '%"+uid+"%' OR UPPER(DB2ADMIN.OFFICIALS.USERID) LIKE '%"+uid+"%')";
       System.out.println(QueryString);
       ResultSet rs = st.executeQuery(QueryString);    
       %>
                          	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="20%" style="width:20%">Employee ID</th>
                                    <th width="30%" style="width:30%">Name</th>
                                    <th width="25%" style="width:25%">Branch</th>
                                    <th width="10%" style="width:10%">Type</th>
                                    <th width="15%" style="width:15%">Userid</th>
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {%> 
                                <tr>
                                    <td><%=rs.getString("E_ID")%></td>
                                    <td><%=rs.getString("FNAME")%> <%=rs.getString("LNAME")%></td>
                                    <td><%=rs.getString("CITY")%>, <%=rs.getString("STATE")%></td>
                                    <td><%=rs.getString("TYPE")%></td>
									<td><%=rs.getString("USERID")%></td>
                                </tr>
                            <%
                            }
                           rs.close();
                           st.close();
                           con.close();
                            %>
                            </tbody>
                        </table>
                        </form>
     <%
     }
     catch (SQLException s){
       System.out.println("Database Connection Failed!");
     }
%>
