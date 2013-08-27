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
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.connectToDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
boolean isMultipart=ServletFileUpload.isMultipartContent(request);
System.out.println(isMultipart);
InputStream changeOfNationalityProof=null;
String uid =null;
String state =null;
String country =null;

if(isMultipart){
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = upload.parseRequest(request);
	Iterator iter = items.iterator();	
	while(iter.hasNext()){
		FileItem item = (FileItem) iter.next();
		if(!item.isFormField()){
			String itemName=item.getFieldName();
			System.out.println("Image-> "+itemName);
			if(itemName.equalsIgnoreCase("changeOfNationalityProof")){
				changeOfNationalityProof=item.getInputStream();
			}
			
		}else{
			String itemName=item.getFieldName();
			if(itemName.equalsIgnoreCase("uid")){
				uid=item.getString();
			}else if(itemName.equalsIgnoreCase("country")){
				country=item.getString();
			}else if(itemName.equalsIgnoreCase("state")){
				state=item.getString();
			}
		}
	}
}

connectToDb Con=new connectToDb();
Connection con=Con.dbconnect();     
try{	
	String QueryString;
	PreparedStatement statement;
	ResultSet rs;
	QueryString="SELECT UID FROM db2admin.NRI WHERE UID=?";
	statement=con.prepareStatement(QueryString);
	statement.setString(1, uid);
	rs=statement.executeQuery();
	if(rs.next()){
		%>
		<div align="center">
			<span class="notification n-attention">
				Your request is pending for approval.
			</span>
		</div>
		<%
	}else{
		QueryString = "INSERT INTO db2admin.NRI(uid,state,country,proof) VALUES(?,?,?,?)";
		statement = con.prepareStatement(QueryString);
		statement.setString(1,uid);
		statement.setString(2, state);
		statement.setString(3,country);
		statement.setBinaryStream(4, changeOfNationalityProof,changeOfNationalityProof.available());

		int success = statement.executeUpdate();
		%>
			<div align="center">
				<span class="notification n-success">
					Your Updates have been sent for confirmation.<br/>Thank you
				</span>
			</div>
		<%
	}
		
}catch(Exception e){
	e.printStackTrace();
	%>
		<div align="center">
		<span class="notification n-attention">
			Error while registering. Please check the credentials.
		</span>
		</div>
	<%
}finally{
	if(con!=null){
		con.close();
	}
}
%>
</body>
</html>