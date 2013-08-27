
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 
<%
/*if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}*/
%>

<%
   Connection con = null;
   connectToDb Con=new connectToDb();   
   con = connectToDb.dbconnect();
     try{
       
       String keyList =request.getParameter("content");
       keyList=keyList.toLowerCase();
       String keyword[]=keyList.split(" ");
       //String QueryString = "SELECT UID,COUNT(KEYWORD) AS RATING FROM db2admin.USER_INDEX WHERE (?)   GROUP BY UID   ORDER BY RATING DESC";
	   String QueryString = "SELECT FNAME,MNAME,LNAME, U.UID,COUNT(KEYWORD) AS RATING FROM db2admin.USER_INDEX AS U,db2admin.NOMINAL_ROLL AS N WHERE N.UID=U.UID AND (?)   GROUP BY U.UID,FNAME,LNAME,MNAME   ORDER BY RATING DESC";
       String substr="";
       if(keyword.length==0)
    	   substr="";
       else
       {
    	   substr="KEYWORD LIKE '"+keyword[0]+"%'";
    	   for(int i=1;i<keyword.length;i++)
    		   substr+=" OR KEYWORD LIKE '"+keyword[i]+"%'";
       }
       
       QueryString=QueryString.replace("?", substr);
       System.out.println(QueryString);
       PreparedStatement st=con.prepareStatement(QueryString);
       ResultSet rs = st.executeQuery();    
       %>
                          	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th width="60%" style="width:60%">Users Profile Search Results</th>
                                  <!--  <th width="30%" style="width:30%">Name</th>
                                    <th width="25%" style="width:25%">Branch</th>
                                    <th width="10%" style="width:10%">Type</th>
                                    <th width="15%" style="width:15%"></th> -->
                                </tr>
                            </thead>
                            <tbody>
                           <%
                             while (rs.next()) 
                              {%> 
                                <tr>
                                    <td><b><%=rs.getString("FNAME")%> <%=rs.getString("MNAME")%> <%=rs.getString("LNAME")%></b> [<%=rs.getString("UID")%>]</td>

                                    <td>
                                    	<!--<button onclick="loadProfile(<%=rs.getString("UID")%>); return false;" style="color: blue; border-color: blue; ">View</button>   -->
                                       <input class="submit-green" type="submit" value="View"   onclick="loadProfile(<%=rs.getString("UID")%>); return false;"></input>  
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
       s.printStackTrace();
     }
%>
