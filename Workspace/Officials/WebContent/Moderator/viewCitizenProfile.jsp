<%@ page import="java.sql.*,database.*,java.io.*" %>

<div id="content">
		<div id="main">
		<div id="welcome" class="post">
		<div class="story">
		<% 
		connectToDb Con=new connectToDb();
		Connection con=connectToDb.dbconnect();
		Statement statement = con.createStatement();
		Blob image = null;
		byte[ ] imgData = null ;
		String U_ID=request.getParameter("UID");
			try{
				String QueryString = "SELECT * FROM DB2ADMIN.NOMINAL_ROLL , DB2ADMIN.CONTACT , DB2ADMIN.IDENTIFICATION WHERE DB2ADMIN.NOMINAL_ROLL.UID='"+U_ID+"'AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.CONTACT.UID AND DB2ADMIN.NOMINAL_ROLL.UID=DB2ADMIN.IDENTIFICATION.UID";
				System.out.println(QueryString);
				ResultSet rs1 = statement.executeQuery(QueryString);
				
				if(rs1.next())
				{
		%>
			<!-- <h4>Your profile was last visited on (cookie's to b used):</h4> -->
			<br />

<h2 class="title" style="width: 60%">User Profile</h2>
<table style="width: 60%">
<tr>
 <th>Photo<th>
</tr>
 <tr><td><img border="1" src="<%="../photo.png?0" %>" alt="Profile Picture" width="220" height="285" name="displayPic" /></td>
 <td>
    <table style="float: left; width: 100%">
		<TR>
		<TH>Name</TH>
		<TD><%=rs1.getString("FNAME")%>  <%=rs1.getString("MNAME")%>  <%=rs1.getString("LNAME")%></TD>
		</tr>
		<TR>
		<TH>Date of Birth</TH>
		<TD><%=rs1.getString("DOB")%></TD>
		</tr>
		<TR>
		<TH>Age</TH>
		<TD><%=rs1.getInt("AGE")%></TD>
		</tr>
		<TR>
		<TH>Gender</TH>
		<TD><%=rs1.getString("GENDER")%></TD>
		</tr>
		<TR>
		<TH>Guardian</TH>
		<TD><%=rs1.getString("GUARDIAN")%></TD>
		</tr>
		<TR>
		<TH>Address</TH>
		<TD><%=rs1.getString("ADDRESS")%></TD>
		</tr>
		<TH>Mobile Number</TH>
		<TD><%=rs1.getString("PHONE")%></TD>
		</tr>
		<TR>
		<TH>e-mail Address</TH>
		<TD><%=rs1.getString("EMAIL")%></TD>
		</tr>
		<TR>
	</table>	
	</td>
  </tr>
</table>						
		<%
			image = rs1.getBlob("PHOTO");
			imgData = image.getBytes(1,(int)image.length());
			}
			else 
				return;
			//response.setContentType("html");
			System.out.println(request.getRealPath("/"));
			OutputStream o=new FileOutputStream(request.getRealPath("/")+"photo.png");
			o.write(imgData);
			o.flush();
			o.close(); 
			  //Close the output stream
		 
		}
		catch(SQLException e)
		{
			out.println("SQL error : "+e);
		}
		catch(Exception e)
		{
			out.println("Unable to retrieve");
		}
		%>