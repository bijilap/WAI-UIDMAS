
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
       
       String uid ="'"+request.getParameter("eid")+"'";
       System.out.println(uid);
       String QueryString = "SELECT DESIGNATION,STATE,CITY,FNAME,LNAME,E.TYPE,ACC_STATUS, USERID,O.E_ID FROM DB2ADMIN.BRANCH, DB2ADMIN.EMPLOYEE  E, DB2ADMIN.OFFICIALS  O WHERE DB2ADMIN.BRANCH.CODE=E.BRANCH AND E.E_ID=O.E_ID AND E.E_ID="+uid;
       System.out.println(QueryString);
       ResultSet rs = st.executeQuery(QueryString);    
       %>
                          	<form action="approveOfficialAction.jsp">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="25%" style="width:25%">Field</th>
                                    <th width="75%" style="width:75%">Details</th>
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {
                            	 //fc.copyfile("F:/TGMC/WorkSpace/Images/2012-02-16/0001", "../../../WebContent/temp/image1.jpg");
                              %> 
                                <tr>
                                    <td>Name</td>
                                    <td><%=rs.getString("FNAME")%> <%=rs.getString("LNAME")%></td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td><%=rs.getString("DESIGNATION")%></td>
                                </tr>
                                <tr>
                                    <td>Branch</td>
                                    <td><%=rs.getString("CITY")%>, <%=rs.getString("STATE")%></td>
                                </tr>
                                <tr><input type="hidden" value="<%=uid%>" name="uid" id="uid"></tr>
                                 <tr><input type="hidden" value="yes" name="task" id="task"></tr>
                                <tr>
                                    <td>User ID</td>
                                    <td><%=rs.getString("USERID")%></td>
                                </tr>
  								<%if(rs.getString("ACC_STATUS").equals("B"))
  									{%>						                    
                                <tr>
                                    <td>Type of User</td>
                                    <td>
                                    <select class="input-short" name="type" id="type">
                                    <option value="M">Moderator</option>
                                    <option value="L">Administrator</option>
                                    </td>
                                </tr>
                                	<%} %>
                                <%if(rs.getString("ACC_STATUS").equals("L"))
  									{%>						                    
                                <tr>
                                    <td>Type of User</td>
                                    <td>
                                    <select class="input-short" name="type" id="type">
                                    <option value="A">Administrator</option>
                                    </td>
                                </tr>
                                	<%}
                                	%>
                                
                            </tbody>
                        </table>
                            <fieldset>
                                <input class="submit-green" type="submit" value="Approve" /> 
                                <input class="submit-gray" type="button" value="Reject" onclick="window.location.href='approveOfficialAction.jsp?task=no&uid=<%=rs.getString("E_ID")%>'"/>
                                <input class="submit-gray" type="button" value="Ignore" onclick="window.location.href='addOfficials.jsp'"/>
                            </fieldset>
                        </form>
     <%
       }
     }
     catch (SQLException s){
       System.out.println("Database Connection Failed!");
     }
%>
