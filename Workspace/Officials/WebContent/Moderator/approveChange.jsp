
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
       
       String mID ="'"+request.getParameter("uid")+"'";
    
       String QueryString = "SELECT * FROM db2admin.UPDATE_FORM  WHERE UID="+mID;
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
                                 //System.out.println((rs.getBlob("PHOTO")).equals(""));
                              %> 
                              <tr>
                                    <td>UID</td>
                                    <td><%=rs.getString("UID")%></td>
                                </tr>
                              <%
                              	if(rs.getString("FNAME").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>First Name</td>
                                    <td><%=rs.getString("FNAME")%></td>
                                </tr>
                                <%} %>
                                <%
                              	if(rs.getString("MNAME").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>Middle Name</td>
                                    <td><%=rs.getString("MNAME")%></td>
                                </tr>
                                <%} %>
                                <%
                              	if(rs.getString("LNAME").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>Last Name</td>
                                    <td><%=rs.getString("LNAME")%></td>
                                </tr>
                                <%} %>
                         		
                                <%
                              	if(rs.getString("R_ADDR").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>Residential Address</td>
                                    <td><%=rs.getString("R_ADDR")%></td>
                                </tr>
                                <%} %>
                                <%
                              	if(rs.getString("MOB_NO").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>Contact</td>
                                    <td><%=rs.getString("MOB_NO")%></td>
                                </tr>
                                <%} %>
                                <%
                              	if(rs.getString("EMAIL").equals(null)==false)
                              	{
                              %>
                                <tr>
                                    <td>E-mail</td>
                                    <td><%=rs.getString("EMAIL")%></td>
                                </tr>
                                <%} %>
                                
                                <%
                                if((rs.getBlob("PHOTO")!=null))
                              	{
                              		image = rs.getBlob("PHOTO");
                         			imgData = image.getBytes(1,(int)image.length());
                         			o=new FileOutputStream(request.getRealPath("/")+"Moderator/photo.jpg");
                         			o.write(imgData);
                         			o.flush();
                         			o.close();
                              %>
                                <tr>
                                    <td>Proof</td>
                                    <td><p><a href="photo.jpg" rel="lightbox" title="Update">Photo</a></p>
									</td>
                                </tr>
                                <%} %>
                                
                                <%
                              	if(rs.getBlob("PROOF")!=null)
                              	{
                              		image = rs.getBlob("PROOF");
                         			imgData = image.getBytes(1,(int)image.length());
                         			o=new FileOutputStream(request.getRealPath("/")+"Moderator/proof.jpg");
                         			o.write(imgData);
                         			o.flush();
                         			o.close();
                              %>
                                <tr>
                                    <td>Proof</td>
                                    <td><p><a href="proof.jpg" rel="lightbox" title="Update">Proof</a></p>
									</td>
                                </tr>
                                <%} %>
                                
                            </tbody>
                        </table>
                        </form>
                <div>
                <a href="" class="dashboard-module" onmousedown="approveCitizen('approveChangeAction.jsp?approve=yes&uid=<%=rs.getString("UID")%>')">
                	<img src="Resources/tick.jpg" width="64" height="64" alt="edit" />
                	<span>Approve</span>
                </a>
                <a href="" class="dashboard-module">
                	<img src="Resources/ignore.jpg" width="64" height="64" alt="edit" />
                	<span>Decide Later</span>
                </a>
                <a href="" class="dashboard-module" onmousedown="approveCitizen('approveChangeAction.jsp?approve=no&uid=<%=rs.getString("UID")%>')">
                	<img src="Resources/cross.jpg" width="64" height="64" alt="edit" />
                	<span>Reject</span>
                </a>
                </div>
     <%
       }
     }
     catch (SQLException s){
    	 s.printStackTrace();
       System.out.println("Database Connection Failed!");
     }
%>
