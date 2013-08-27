
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
       String QueryString = "SELECT UID,FNAME,LNAME,DOB,GENDER FROM DB2ADMIN.NOMINAL_ROLL WHERE (UPPER(DB2ADMIN.NOMINAL_ROLL.FNAME) LIKE '%"+uid+"%' OR UPPER(DB2ADMIN.NOMINAL_ROLL.LNAME) LIKE '%"+uid+"%' OR UPPER(DB2ADMIN.NOMINAL_ROLL.MNAME) LIKE '%"+uid+"%')";
       System.out.println(QueryString);
       ResultSet rs = st.executeQuery(QueryString);    
       %>
                          	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="20%" style="width:20%">UID</th>
                                    <th width="30%" style="width:30%">Name</th>
                                    <th width="25%" style="width:25%">Gender</th>
                                    <th width="10%" style="width:10%">Date Of Birth</th>
                                    <th width="15%" style="width:15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {%> 
                                <tr>
                                    <td><%=rs.getString("UID")%></td>
                                    <td><%
                                    if(rs.getString("FNAME")!=null)
                                    	out.println(rs.getString("FNAME")+" ");
                                    if(rs.getString("LNAME")!=null)
                                    	out.println(rs.getString("LNAME")+" ");
                                    %></td>
                                    <td><%=rs.getString("GENDER")%></td>
                                    <td><%
                                    if(rs.getString("DOB")!=null)
                                    	out.println(rs.getString("DOB"));
                                    %></td>
                                    <td>
                                    	<input type="checkbox" />
                                        
                                    </td>
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
