<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.ibm.db2.jcc.am.u"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.sql.*,database.*" %>
<body>
<%

	connectToDb Con=new connectToDb();
    Connection con=connectToDb.dbconnect();
    PreparedStatement p;
                 %>
	<div id="logo">
		<h1><a href="home.html">WAI</a></h1>
		<h2><a href="makers.html">by geniobrainiacs</a></h2>
	</div>
<div>
	<div>
		<div id="welcome" class="post">
			<div>
 <%
	String uid =null;
	String dod =null;
	InputStream proof =null;
	String query;
	try{
		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while(iter.hasNext()){							
				FileItem item = (FileItem) iter.next();
				if(!item.isFormField()){								
					proof=item.getInputStream();
// 					System.out.print(stream.available());
				}else{
					String itemName=item.getFieldName();
					String itemValue=item.getString();
					if(itemName.equalsIgnoreCase("uid")){
						uid=itemName;
					}else if(itemName.equals("dod")){
						dod=itemValue;
					}
				}
			}			
		}	
	}catch(Exception e){
		%>
	    <div align="center">
	    	<span class="notification n-attention">A connection to the database failed.Try later</span>
	    </div>
	    <%
	    System.out.println("File upload error!");
	}
	System.out.println(uid+"  "+dod);
		try{
			query="Select UID from db2admin.DEMISE where uid=?";
			p=con.prepareStatement(query);
			p.setString(1, uid);
			ResultSet rs = p.executeQuery();
			if(rs.next()){
				%>
	            <span class="notification n-attention">Your request is pending for approval. You will be notified once it is approved. Thank you</span>
	            <%
	            System.out.print("Request in database");
			}
			else{
				try{
// 					query="INSERT INTO db2admin.DEMISE(UID,DOD,PROOF) VALUES("+uid+","+dod+","+proof+")";
					query="INSERT INTO db2admin.DEMISE(UID,DOD,PROOF) VALUES(?,?,?)";
					p=con.prepareStatement(query);
					p.setString(1, uid);
					p.setString(2, dod);
					p.setBinaryStream(3, proof, proof.available());
				    System.out.println(query);
				    p.executeUpdate();
				    %>
				    <span class="notification n-success">Your Updates have been sent for confirmation.thank you</span>
				    <%
		        }
		        catch (SQLException s){
				    %>
				    <div align="center">
				    	<span class="notification n-attention">A connection to the database failed.Try later</span>
				    </div>
				    <%
				    System.out.println("Database Connection Failed!");
		        }
			}
		}catch(Exception e){
			%>
		    <div align="center">
		    	<span class="notification n-attention">A connection to the database failed.Try later</span>
		    </div>
		    <%
			e.printStackTrace();
		}
         %>           
		</div>
   	  </div>
	</div>
</div>
</body>
</html>
