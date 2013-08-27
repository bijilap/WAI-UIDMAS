
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 


<%
   Connection con = null;
   connectToDb Con=new connectToDb();   
   con = connectToDb.dbconnect();
     try{
       Statement st = con.createStatement();
       
       String dor ="'"+request.getParameter("dor")+"'";
       String reg ="'"+request.getParameter("reg")+"'";
       String mID ="'"+request.getParameter("mID")+"'";
    
       String QueryString = "SELECT DOR,REG_NO,MODERATOR_ID,FNAME,MNAME,LNAME,DOB,AGE,GUARDIAN,R_ADDR,P_ADDR,MOB_NO,EMAIL,PHOTO FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
       System.out.println(QueryString);
       ResultSet rs = st.executeQuery(QueryString);    
       %>
                          	<form action="">
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
                                    <td>Registration Date</td>
                                    <td><%=rs.getString("DOR")%></td>
                                </tr>
                                <tr>
                                    <td>Registration Number</td>
                                    <td><%=rs.getString("REG_NO")%></td>
                                </tr>
                                <tr>
                                    <td>Moderator ID</td>
                                    <td><%=rs.getString("Moderator_ID")%></td>
                                </tr>
                         		<tr>
                                    <td>Name</td>
                                    <td><%=rs.getString("FNAME")%> <%=rs.getString("MNAME")%> <%=rs.getString("LNAME")%></td>
                                </tr>
                                <tr>
                                    <td>Date of Birth/Age</td>
                                    <td><%=rs.getString("DOB")%><br><%=rs.getString("AGE")%></td>
                                </tr>
                                <tr>
                                    <td>Parent/Guardian</td>
                                    <td><%=rs.getString("GUARDIAN")%></td>
                                </tr>
                                <tr>
                                    <td>Residential Address</td>
                                    <td><%=rs.getString("R_ADDR")%></td>
                                </tr>
                                <tr>
                                    <td>Permanent Address</td>
                                    <td><%=rs.getString("P_ADDR")%></td>
                                </tr>
                                <tr>
                                    <td>Contact</td>
                                    <td><%=rs.getString("MOB_NO")%><br><%=rs.getString("EMAIL")%></td>
                                </tr>
                            	<tr>
                                    <td>Photo</td>
                                    <td><p><img src="../temp/image1.jpg" width="64" height="64"/></p></td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                <div>
                <a href="" class="dashboard-module" onmousedown="approveCitizen('approveCitizenAction.jsp?approve=yes&dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>')">
                	<img src="Resources/tick.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>Approve</span>
                </a>
                <a href="" class="dashboard-module">
                	<img src="Resources/ignore.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>Decide Later</span>
                </a>
                <a href="" class="dashboard-module" onmousedown="approveCitizen('approveCitizenAction.jsp?approve=no&dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>')">
                	<img src="Resources/cross.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
                	<span>Reject</span>
                </a>
                </div>
     <%
       }
     }
     catch (SQLException s){
       System.out.println("Database Connection Failed!");
     }
%>
