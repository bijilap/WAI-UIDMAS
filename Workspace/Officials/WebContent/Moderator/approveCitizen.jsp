
<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 
<%@ page import="java.io.*" %> 
<%
   Connection con = null;
   connectToDb Con=new connectToDb();   
   con = connectToDb.dbconnect();
   Blob image = null;
   byte[ ] imgData = null ;
   OutputStream o;
     try{
       Statement st = con.createStatement();
       
       String dor ="'"+request.getParameter("dor")+"'";
       String reg ="'"+request.getParameter("reg")+"'";
       String mID ="'"+request.getParameter("mID")+"'";
    
       String QueryString = "SELECT DOR,REG_NO,MODERATOR_ID,FNAME,MNAME,LNAME,DOB,AGE,GUARDIAN,R_ADDR,P_ADDR,MOB_NO,EMAIL,PHOTO,PROOF1,PROOF2 FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
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
                                <%
                                image = rs.getBlob("PHOTO");
                    			imgData = image.getBytes(1,(int)image.length());
                    			o=new FileOutputStream(request.getRealPath("/")+"Moderator/photo.jpg");
                    			o.write(imgData);
                    			o.flush();
                    			o.close();
                    			image = rs.getBlob("PROOF1");
                    			imgData = image.getBytes(1,(int)image.length());
                    			o=new FileOutputStream(request.getRealPath("/")+"Moderator/proof1.jpg");
                    			o.write(imgData);
                    			o.flush();
                    			o.close();
                    			image = rs.getBlob("PROOF2");
                    			imgData = image.getBytes(1,(int)image.length());
                    			o=new FileOutputStream(request.getRealPath("/")+"Moderator/proof2.jpg");
                    			o.write(imgData);
                    			o.flush();
                    			o.close();
                    		    System.out.println(request.getRealPath("/"));
                    			
                                %>
                            	<tr>
                                    <td>Images</td>
                                    <td><p><a href="photo.jpg" rel="lightbox[roadtrip]" title="New Citizen">Photo</a></p>
										<p><a href="proof1.jpg" rel="lightbox[roadtrip]" title="New Citizen">Proof of DOB</a></p>
										<p><a href="proof2.jpg" rel="lightbox[roadtrip]" title="New Citizen">Address proof</a></p>
									</td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                <div>
                <a href="" class="dashboard-module" onmousedown="approveCitizen('approveCitizenAction.jsp?approve=yes&dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>')">
                	<img src="Resources/tick.jpg" width="64" height="64" alt="edit" />
                	<span>Approve</span>
                </a>
                <a href="" class="dashboard-module">
                	<img src="Resources/ignore.jpg" width="64" height="64" alt="edit" />
                	<span>Decide Later</span>
                </a>
                <a href="" class="dashboard-module" onclick="approveCitizen('approveCitizenAction.jsp?approve=no&dor=<%=rs.getString("DOR")%>&reg=<%=rs.getString("REG_NO")%>&mID=<%=rs.getString("MODERATOR_ID")%>'); return false;">
                	<img src="Resources/cross.jpg" width="64" height="64" alt="edit" />
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
